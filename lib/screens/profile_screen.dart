import 'package:flutter/material.dart';
import 'package:instagram_app/screens/setting_screen.dart'; // Import your SettingsScreen

class ProfileScreen extends StatelessWidget {
  // List of user post images
  final List<String> postImages = [
    'assets/images/post_0.jpg',
    'assets/images/post_1.jpg',
    'assets/images/post_2.jpg',
    'assets/images/post_3.jpg',
    'assets/images/post_4.jpg',
    'assets/images/post_5.jpg',
    'assets/images/post_6.jpg',
    'assets/images/post_7.jpg',
    'assets/images/post_8.jpg',
    'assets/images/post_9.jpg',
    'assets/images/post_10.jpg',
    'assets/images/post_11.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/post_profile.jpg'), // Profile image
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Enhypen', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('Just accept everything and live happily in present.'),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          // Stats section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('12', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Posts'),
                  ],
                ),
                Column(
                  children: [
                    Text('200', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Followers'),
                  ],
                ),
                Column(
                  children: [
                    Text('150', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Following'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Follow and Message buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Toggle follow action
                    },
                    child: const Text('Edit Profile'),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Action to send a message
                  },
                  child: const Text('Share Profile'),
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
              itemCount: postImages.length, // Number of user posts
              itemBuilder: (context, index) {
                return Image.asset(
                  postImages[index], // Load different post images
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
