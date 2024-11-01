import 'package:flutter/material.dart';

class ProfileDetailScreen extends StatefulWidget {
  final String username;

  const ProfileDetailScreen({Key? key, required this.username}) : super(key: key);

  @override
  _ProfileDetailScreenState createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  bool isFollowing = false; // Track follow status

  // Sample data for profile details
  final String bio = 'This is the bio of the user.';
  final int postsCount = 12; // Example number of posts
  final int followersCount = 200; // Example number of followers
  final int followingCount = 150; // Example number of following

  @override
  Widget build(BuildContext context) {
    // Sample posts (placeholder images)
    final List<String> posts = List.generate(12, (index) => 'assets/images/post_image.jpg'); 

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username), // Display user name in AppBar
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User profile info section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/profile.jpg'), // Profile image
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.username, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(bio),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          // Stats section (posts, followers, following)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('$postsCount', style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Text('Posts'),
                  ],
                ),
                Column(
                  children: [
                    Text('$followersCount', style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Text('Followers'),
                  ],
                ),
                Column(
                  children: [
                    Text('$followingCount', style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Text('Following'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Follow and Message buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isFollowing = !isFollowing; // Toggle follow status
                      });
                    },
                    child: Text(isFollowing ? 'Following' : 'Follow'),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Action to send a message
                    // You can navigate to a message screen or show a dialog
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Message sent to ${widget.username}')),
                    );
                  },
                  child: const Text('Message'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // User posts section
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
              ),
              itemCount: posts.length, // Count of user's posts
              itemBuilder: (context, index) {
                return Image.asset(posts[index], fit: BoxFit.cover); // Replace with user's post images
              },
            ),
          ),
        ],
      ),
    );
  }
}
