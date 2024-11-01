import 'package:flutter/material.dart';
import 'package:instagram_app/screens/login_screen.dart'; // Import your login screen

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Edit Profile'),
            onTap: () {
              // Action for editing profile
            },
          ),
          ListTile(
            title: const Text('Account'),
            onTap: () {
              // Action for account settings
            },
          ),
          ListTile(
            title: const Text('Privacy'),
            onTap: () {
              // Action for privacy settings
            },
          ),
          ListTile(
            title: const Text('Notifications'),
            onTap: () {
              // Action for notifications settings
            },
          ),
          ListTile(
            title: const Text('Security'),
            onTap: () {
              // Action for security settings
            },
          ),
          ListTile(
            title: const Text('Help'),
            onTap: () {
              // Action for help or FAQ
            },
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              // Action for about the app
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Log Out'),
            onTap: () {
              // Action for logging out
              // Clear any user data or tokens here, if needed
              
              // Navigate to Login Screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            textColor: Colors.red, // Change text color for logout option
          ),
        ],
      ),
    );
  }
}
