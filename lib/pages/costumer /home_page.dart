// import 'package:flutter/material.dart';
// import 'package:rvw/components/my_drawer.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
//
// import '../database/firestore.dart';
//
// class HomePage extends StatelessWidget {
//   HomePage({Key? key}) : super(key: key);
//
//   final FirestoreDatabase database = FirestoreDatabase();
//
//   final TextEditingController newPostController = TextEditingController();
//
//   void postMessage() {
//     if (newPostController.text.isNotEmpty) {
//       String message = newPostController.text;
//       database.addPost(message);
//     }
//     newPostController.clear();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home"),
//         backgroundColor: Colors.grey[400],
//         actions: [
//           // Add actions here if needed
//         ],
//       ),
//       drawer: MyDrawer(),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: newPostController,
//               decoration: InputDecoration(
//                 hintText: 'Write something...',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: postMessage,
//               child: Text('Post Message'),
//             ),
//             Expanded(
//               child: StreamBuilder(
//                 stream: database.getPostsStream(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//
//                   final posts = snapshot.data!.docs;
//
//                   if (snapshot.data == null || posts.isEmpty) {
//                     return Center(
//                       child: Padding(
//                         padding: EdgeInsets.all(25),
//                         child: Text("No Posts "),
//                       ),
//                     );
//                   }
//
//                   return ListView.builder(
//                     itemCount: posts.length,
//                     itemBuilder: (context, index) {
//                       final post = posts[index];
//
//                       String message = post['PostsMessage'];
//                       String userEmail = post['UserEmail'];
//                       Timestamp timestamp = post['TimeStamp'];
//
//                       return ListTile(
//                         title: Text(message),
//                         subtitle: Text(userEmail),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
