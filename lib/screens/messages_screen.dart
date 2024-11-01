import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Direct Messages'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Search functionality can be implemented here
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigate to the new message screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewMessageScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10, // Number of conversations
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/user_$index.jpg'), // User profile image
              onBackgroundImageError: (_, __) => AssetImage('assets/images/default_avatar.jpg'), // Default image if error
            ),
            title: Text('User $index'), // Replace with actual user names
            subtitle: Text('Last message from User $index'), // Last message preview
            trailing: const Text('2h ago'), // Time of last message
            onTap: () {
              // Navigate to conversation screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConversationScreen(userId: index)),
              );
            },
          );
        },
      ),
    );
  }
}

// Sample Conversation Screen
class ConversationScreen extends StatelessWidget {
  final int userId;

  ConversationScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversation with User $userId'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20, // Example message count
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Message $index from User $userId'), // Replace with actual message content
                  subtitle: Text('Time of message $index'), // Replace with actual message time
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Send a message...',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Implement send message functionality
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Sample New Message Screen
class NewMessageScreen extends StatelessWidget {
  // Sample list of users
  final List<String> users = List.generate(20, (index) => 'User $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Message'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/user_$index.jpg'), // User profile image
              onBackgroundImageError: (_, __) => AssetImage('assets/images/default_avatar.jpg'), // Default image if error
            ),
            title: Text(users[index]), // User name
            onTap: () {
              // Navigate to the conversation screen for the selected user
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConversationScreen(userId: index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
