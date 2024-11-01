import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Add image picker package
import 'dart:io';

class AddPostScreen extends StatefulWidget {
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  File? _image; // Variable to hold the selected image
  final TextEditingController _captionController = TextEditingController(); // Controller for caption input

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Function to submit the post (can be updated to handle actual submission)
  void _submitPost() {
    if (_image != null && _captionController.text.isNotEmpty) {
      // Handle post submission logic (e.g., upload to a server)
      print('Post submitted with caption: ${_captionController.text}');
      Navigator.pop(context); // Go back after submission
    } else {
      // Show a warning if image or caption is missing
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image and enter a caption')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
        actions: [
          TextButton(
            onPressed: _submitPost,
            child: const Text('Post', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _image == null
                    ? const Center(child: Text('Tap to select an image'))
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _captionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Write a caption...',
              ),
              maxLines: 4, // Allow multiple lines for the caption
            ),
          ],
        ),
      ),
    );
  }
}
