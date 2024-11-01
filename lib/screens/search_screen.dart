import 'package:flutter/material.dart';

// Class to represent user data
class User {
  final String userName; // User name
  final String profileImage; // Profile image path

  User({required this.userName, required this.profileImage});
}

class SearchScreen extends StatelessWidget {
  // Example list of suggested users with their profile images
  final List<User> suggestedUsers = [
    User(userName: 'User 1', profileImage: 'assets/images/user_1.jpg'),
    User(userName: 'User 2', profileImage: 'assets/images/user_2.jpg'),
    User(userName: 'User 3', profileImage: 'assets/images/user_3.jpg'),
    User(userName: 'User 4', profileImage: 'assets/images/user_4.jpg'),
    User(userName: 'User 5', profileImage: 'assets/images/user_5.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black), // Change icon color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            // Trending Topics
            const Text(
              'Trending',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            // Example of Trending Topics List
            Expanded(
              child: ListView(
                children: List.generate(5, (index) {
                  return ListTile(
                    title: Text('Trending Topic ${index + 1}'),
                    onTap: () {
                      // Action for tapping a trending topic
                    },
                  );
                }),
              ),
            ),
            const SizedBox(height: 16.0),
            // Users Grid
            const Text(
              'Suggested Users',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                ),
                itemCount: suggestedUsers.length, // Number of suggested users
                itemBuilder: (context, index) {
                  final user = suggestedUsers[index]; // Get the user for the current index
                  return GestureDetector(
                    onTap: () {
                      // Navigate to the profile detail screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileDetailScreen(username: user.userName),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(user.profileImage), // Use the user's profile image
                        ),
                        const SizedBox(height: 8.0),
                        Text(user.userName), // Display user name
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

// Dummy Profile Detail Screen for navigation
class ProfileDetailScreen extends StatelessWidget {
  final String username;

  const ProfileDetailScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username), // Display username in AppBar
      ),
      body: Center(
        child: Text('Profile of $username'), // Placeholder for profile content
      ),
    );
  }
}
