import 'package:flutter/material.dart';
import 'package:instagram_app/screens/profile_screen.dart'; // Import Profile Screen
import 'package:instagram_app/screens/search_screen.dart'; // Import Search Screen
import 'package:instagram_app/screens/add_post_screen.dart'; // Import Add Post Screen
import 'package:instagram_app/screens/likes_screen.dart'; // Import Likes Screen
import 'package:instagram_app/screens/messages_screen.dart'; // Import Messages Screen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Keep track of the selected index
  final List<Widget> _pages = [
    HomeContent(), // Home content (ListView)
    SearchScreen(), // Search Screen
    AddPostScreen(), // Add Post Screen
    LikesScreen(), // Likes Screen
    ProfileScreen(), // Profile Screen
  ];

  // Function to handle item tap in BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram'),
        actions: [
          IconButton(
            icon: const Icon(Icons.message_outlined), // Message icon
            onPressed: () {
              // Navigate to the messages screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagesScreen()), // Navigate to MessagesScreen
              );
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Post'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Likes'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex, // Set the current index
        onTap: _onItemTapped, // Handle item tap
        backgroundColor: Colors.white, // Background color of the bar
        selectedItemColor: Colors.blue, // Color for the selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
        showUnselectedLabels: true, // Show labels for unselected items
        showSelectedLabels: true, // Show labels for selected items
      ),
    );
  }
}

// Widget to display the home content (ListView)
class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  // Example list of user profiles with unique post images
  final List<UserProfile> userProfiles = List.generate(10, (index) => UserProfile(
    userName: 'User $index',
    profileImage: 'assets/images/user_$index.jpg', // Change this path as necessary
    postImage: 'assets/images/post_$index.jpg', // Each post image based on index
  ));

  // List to track liked status of posts
  final List<bool> likedPosts = List.generate(10, (index) => false); // Initialize with false
  
  // List to track comment visibility
  final List<bool> commentVisible = List.generate(10, (index) => false); // Initialize with false
  
  // List to hold comments for each post
  final List<String> comments = List.generate(10, (index) => ''); // Initialize with empty strings

  // Controllers for text fields
  final List<TextEditingController> commentControllers = List.generate(10, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userProfiles.length, // Use the length of userProfiles
      itemBuilder: (context, index) {
        final userProfile = userProfiles[index]; // Get the user profile
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(userProfile.profileImage), // User profile image
              ),
              title: Text(userProfile.userName),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ),
            // Container to fix the size of the post images
            Container(
              height: 300, // Fixed height for the post image
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), // Rounded corners for the image
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8), // Rounded corners for the image
                child: Image.asset(
                  userProfile.postImage, // Post image
                  fit: BoxFit.cover, // Cover the entire container while maintaining aspect ratio
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    likedPosts[index] ? Icons.favorite : Icons.favorite_border,
                    color: likedPosts[index] ? Colors.pink : null, // Change color when liked
                  ),
                  onPressed: () {
                    setState(() {
                      likedPosts[index] = !likedPosts[index]; // Toggle like status
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.comment),
                  onPressed: () {
                    setState(() {
                      commentVisible[index] = !commentVisible[index]; // Toggle comment input visibility
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
            if (commentVisible[index]) // Show comment input if visible
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: commentControllers[index],
                        decoration: InputDecoration(
                          hintText: 'Add a comment...',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        setState(() {
                          // Add comment to the list
                          comments[index] = commentControllers[index].text;
                          commentControllers[index].clear(); // Clear the input field
                          commentVisible[index] = false; // Hide the comment input
                        });
                      },
                    ),
                  ],
                ),
              ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Liked by User 1 and others'),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('View all comments', style: TextStyle(color: Colors.grey)),
            ),
            if (comments[index].isNotEmpty) // Show the comment if it's not empty
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(comments[index], style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            const Divider(),
          ],
        );
      },
    );
  }
}

// Class to represent user profile data
class UserProfile {
  final String userName; // User name
  final String profileImage; // User profile image path
  final String postImage; // Post image path

  UserProfile({
    required this.userName,
    required this.profileImage,
    required this.postImage,
  });
}
