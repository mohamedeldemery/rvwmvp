import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/my_drawer.dart';
import 'package:rvw/components/logos.dart';

class BusinesslistPage extends StatefulWidget {
  const BusinesslistPage({Key? key}) : super(key: key);

  @override
  _BusinesslistPageState createState() => _BusinesslistPageState();
}

class _BusinesslistPageState extends State<BusinesslistPage> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'lib/images/rvwlogo.png',
          height: 100, // Adjust the height as needed
        ),
        backgroundColor: Colors.white70,
        elevation: 0,
      ),
      drawer: MyDrawer(),
      backgroundColor: Colors.white, // Set background color to white
      body: Column(
        children: [
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for businesses here...',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _searchQuery = _searchController.text;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance.collection("businesses").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Something went wrong"),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final businesses = snapshot.data?.docs;

                if (businesses == null || businesses.isEmpty) {
                  return Center(
                    child: Text("No Data"),
                  );
                }

                final filteredBusinesses = businesses.where((business) {
                  final businessData = business.data();
                  final businessName = businessData['username']?.toString().toLowerCase() ?? '';
                  return businessName.contains(_searchQuery.toLowerCase());
                }).toList();

                return ListView.builder(
                  itemCount: filteredBusinesses.length,
                  itemBuilder: (context, index) {
                    final business = filteredBusinesses[index];
                    final businessData = business.data();

                    if (businessData == null) {
                      return SizedBox();
                    }

                    if (business.id == businessData['email']) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0), // Add padding to the right and left edges
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center, // Ensure the row's contents are centered
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0), // Add padding around the Logos widget
                                child: Logos(
                                  imageUrl: businessData['imageUrl'],
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BusinessDetailsPage(businessData: businessData),
                                      ),
                                    );
                                  },
                                  iconSize: 135, // Adjust icon size as needed
                                ),
                              ),
                              SizedBox(width: 16), // Space between logo and text
                              Expanded(
                                child: ListTile(
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start of the column
                                    mainAxisAlignment: MainAxisAlignment.center, // Center items vertically within the column
                                    children: [
                                      Text(
                                        businessData['username'] ?? 'No username',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        businessData['business_category'] ?? 'No Business Category',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 18,
                                          ),
                                          SizedBox(width: 4),
                                          FutureBuilder<QuerySnapshot>(
                                            future: FirebaseFirestore.instance
                                                .collection('businesses')
                                                .doc(business.id)
                                                .collection('ratings')
                                                .get(),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState == ConnectionState.waiting) {
                                                return Text('Loading...');
                                              }
                                              if (snapshot.hasError) {
                                                return Text('Error');
                                              }
                                              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                                                return Text('0.0');
                                              }
                                              final ratings = snapshot.data!.docs
                                                  .map((doc) => (doc['rating'] as num).toDouble())
                                                  .toList();
                                              final averageRating = ratings.reduce((a, b) => a + b) / ratings.length;
                                              return Text(averageRating.toStringAsFixed(1));
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  trailing: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BusinessDetailsPage(businessData: businessData),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black87, // Brighter yellow color
                                      foregroundColor: Colors.white,
                                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20), // Increase button size
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),// Text and icon color
                                    ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Review'),
                                        SizedBox(width: 8), // Space between text and icon
                                        Icon(Icons.arrow_forward_ios, color: Colors.white), // Add the arrow icon
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );




                    } else {
                      return SizedBox();
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}





class BusinessDetailsPage extends StatefulWidget {
  final Map<String, dynamic> businessData;

  const BusinessDetailsPage({Key? key, required this.businessData}) : super(key: key);

  @override
  _BusinessDetailsPageState createState() => _BusinessDetailsPageState();
}

class _BusinessDetailsPageState extends State<BusinessDetailsPage> {
  double _rating = 0;
  late String _userEmail;
  late bool _isLoading = true;
  double _averageRating = 0;
  String? _googleReviewLink;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _loadRatings();
    _loadGoogleReviewLink();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _userEmail = user.email ?? '';
        _isLoading = false;
      });
    }
  }

  Future<void> _loadRatings() async {
    final ratingsSnapshot = await FirebaseFirestore.instance
        .collection("businesses")
        .doc(widget.businessData['email'])
        .collection('ratings')
        .get();

    if (ratingsSnapshot.docs.isNotEmpty) {
      final List<double> ratings = ratingsSnapshot.docs.map((doc) => doc['rating']).cast<double>().toList();
      double totalRating = ratings.fold(0, (previous, current) => previous + current);
      setState(() {
        _averageRating = totalRating / ratings.length;
      });
    }
  }

  Future<void> _loadGoogleReviewLink() async {
    final docSnapshot = await FirebaseFirestore.instance.collection("businesses").doc(widget.businessData['email']).get();
    if (docSnapshot.exists) {
      final businessData = docSnapshot.data();
      setState(() {
        _googleReviewLink = businessData?['google_review_link'];
        print("_googleReviewLink: $_googleReviewLink");
      });
    } else {
      print("Document with email '${widget.businessData['email']}' does not exist.");
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showInfoDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black, // Text color
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Close"),
                ),
              ],
            ),
          ),
        );
      },
      barrierDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    child: Stack(
                      children: [
                        Image(
                          image: widget.businessData['imageUrl'] != null
                              ? NetworkImage(widget.businessData['imageUrl'])
                              : AssetImage('assets/sample_image.png') as ImageProvider,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Positioned(
                          top: 40,
                          left: 20,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5, // Ensure the container height fills the rest of the screen
                  color: Colors.white,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.4), // Adjust the overlap
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 8.0, left: 8.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: widget.businessData['username'] ?? 'No username',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 30,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: ' ${_averageRating.toStringAsFixed(1)}',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Text(
                      widget.businessData['business_category'] ?? 'No Business Category',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.businessData['description'] ?? 'No description'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showInfoDialog("Contact Info", widget.businessData['contact_info'] ?? 'No Contact Info');
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.phone, color: Colors.black),
                                SizedBox(width: 4),
                                Text("Call"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            _showInfoDialog("Email", widget.businessData['email'] ?? 'No email');
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.email, color: Colors.black),
                                SizedBox(width: 4),
                                Text("Email"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            _showInfoDialog("Address", widget.businessData['address'] ?? 'No Address');
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.black),
                                SizedBox(width: 4),
                                Text("Location"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Give us a review!",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        RatingBar.builder(
                          initialRating: _rating,
                          minRating: 0,
                          maxRating: 5,
                          itemCount: 5,
                          itemSize: 60, // Increase the size of the stars
                          itemBuilder: (context, index) {
                            return Icon(
                              Icons.star,
                              color: Colors.amber,
                            );
                          },
                          onRatingUpdate: (rating) {
                            setState(() {
                              _rating = rating;
                            });
                          },
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black, // Button color
                            foregroundColor: Colors.white, // Text color
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20), // Increase button size
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection("businesses")
                                .doc(widget.businessData['email'])
                                .collection('ratings')
                                .where('userEmail', isEqualTo: _userEmail)
                                .get()
                                .then((querySnapshot) {
                              if (querySnapshot.docs.isEmpty) {
                                FirebaseFirestore.instance
                                    .collection("businesses")
                                    .doc(widget.businessData['email'])
                                    .collection('ratings')
                                    .add({
                                  'userEmail': _userEmail,
                                  'rating': _rating,
                                }).then((value) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Rating submitted')));
                                }).catchError((error) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to submit rating')));
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('You have already rated this business')));
                              }
                            }).catchError((error) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error checking rating')));
                            });
                          },
                          child: Text('Submit Rating'),
                        ),
                        SizedBox(height: 16),
                        if (_googleReviewLink != null && _googleReviewLink!.isNotEmpty)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black, // Button color
                              foregroundColor: Colors.white, // Text color
                              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20), // Increase button size
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () => _launchURL(_googleReviewLink!),
                            child: Text('Review on Google'),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}