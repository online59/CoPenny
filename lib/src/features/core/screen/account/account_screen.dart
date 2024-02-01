import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0), // Add padding to the entire avatar container
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue, // Change the avatar background color
                child: Text(
                  "A", // Displaying a random letter for avatar
                  style: TextStyle(fontSize: 40, color: Colors.white), // Change text color to white
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
              child: Text(
                "John Doe", // Random name
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
              child: Text(
                "john.doe@example.com", // Random email
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
                child: TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(12), // Add padding to the button
                  ),
                  child: const Text('Log Out'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListItem(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Add padding
          child: Text(
            title,
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey[300], // Change line color
        ),
      ],
    );
  }
}
