import 'package:flutter/material.dart';
import 'package:instagram_app/screens/profiledetail_screen.dart';

// Class to represent user data
class User {
  final String userName; // User name
  final String profileImage; // Profile image path

  User({required this.userName, required this.profileImage});
}

class LikesScreen extends StatefulWidget {
  @override
  _LikesScreenState createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
  // Example list of users who liked the post, with their profile images
  final List<User> likes = [
    User(userName: 'User0', profileImage: 'assets/images/user_0.jpg'),
    User(userName: 'User1', profileImage: 'assets/images/user_1.jpg'),
    User(userName: 'User2', profileImage: 'assets/images/user_2.jpg'),
    User(userName: 'User3', profileImage: 'assets/images/user_3.jpg'),
    User(userName: 'User4', profileImage: 'assets/images/user_4.jpg'),
    User(userName: 'User5', profileImage: 'assets/images/user_5.jpg'),
    User(userName: 'User6', profileImage: 'assets/images/user_6.jpg'),
  ];

  // Example list of comments on the post with corresponding user
  final List<Map<String, String>> comments = [
    {'user': 'User0', 'comment': 'Great post!'},
    {'user': 'User1', 'comment': 'Amazing!'},
    {'user': 'User2', 'comment': 'Love this!'},
  ];

  // Function to get user by username
  User getUserByUsername(String username) {
    return likes.firstWhere(
      (user) => user.userName == username,
      orElse: () => User(userName: 'Unknown', profileImage: 'assets/images/default_user.jpg'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Likes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display number of likes
            Text(
              '${likes.length} Likes',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // List of users who liked the post
            Expanded(
              child: ListView.builder(
                itemCount: likes.length,
                itemBuilder: (context, index) {
                  final user = likes[index]; // Get the user for the current index
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(user.profileImage), // Use the user's profile image
                    ),
                    title: Text(user.userName), // Display user name
                    onTap: () {
                      // Navigate to Profile Detail Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileDetailScreen(username: user.userName),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            // Display number of comments
            Text(
              '${comments.length} Comments',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // List of comments
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  // Get the user for the comment
                  final user = getUserByUsername(comment['user']!); // Find the user based on the comment
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            user.profileImage, // Use user profile image or a default image
                          ),
                        ),
                        const SizedBox(width: 8), // Spacing between avatar and text
                        Expanded(
                          child: Text('${comment['user']}: ${comment['comment']}'), // Display comment
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
