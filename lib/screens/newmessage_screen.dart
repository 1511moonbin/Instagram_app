import 'package:flutter/material.dart';

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
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'), // User profile image
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

// Sample Conversation Screen
class ConversationScreen extends StatelessWidget {
  final int userId;

  ConversationScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversation with ${userId}'), // Show selected user's name
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Example message count
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
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Send a message...',
                      border: OutlineInputBorder(),
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
