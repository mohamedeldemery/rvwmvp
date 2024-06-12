import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Reviews extends StatefulWidget {
  final double initialRating;
  final void Function(double) onRatingChanged;

  const Reviews({
    Key? key,
    required this.initialRating,
    required this.onRatingChanged,
  }) : super(key: key);

  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: _rating,
      minRating: 0,
      maxRating: 5,
      allowHalfRating: true,
      itemSize: 40,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        setState(() {
          _rating = rating;
        });
        widget.onRatingChanged(_rating);
      },
    );
  }
}
