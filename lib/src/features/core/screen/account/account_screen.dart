import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:piggy/src/common_widget/containers/gradient_container_widget.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            _buildProfile(),
            const SizedBox(height: 30),
            _buildSettingItem(
              icon: Icons.person,
              title: 'Your profile',
              subtitle: 'Edit and view profile info',
            ),
            _buildSettingItem(
              icon: Icons.wallet,
              title: 'Wallet settings',
              subtitle: 'Edit and view wallet settings',
            ),
            _buildSettingItem(
              icon: Icons.settings,
              title: 'Display preference',
              subtitle: 'Adjust your display',
            ),
            _buildSettingItem(
              icon: Icons.notifications,
              title: 'Notifications',
              subtitle: 'On/Off your notification',
            ),
            Padding(
              padding: const EdgeInsets.all(mDefaultPadding),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: mDefaultPadding * 4,
                                vertical: mDefaultPadding),
                          ),
                          child: const Text(
                            mSignOut,
                            style: TextStyle(
                              fontSize: mFontSizeLarge,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // Handle setting item tap
      },
    );
  }

  Widget _buildProfile() {
    return const Column(children: [
      Padding(
        padding: EdgeInsets.all(8.0),
        // Add padding to the entire avatar container
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.blue,
          // Change the avatar background color
          child: Text(
            "A", // Displaying a random letter for avatar
            style: TextStyle(
                fontSize: 40,
                color: Colors.white), // Change text color to white
          ),
        ),
      ),
      SizedBox(height: 12),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        // Add horizontal padding
        child: Text(
          "John Doe", // Random name
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        // Add horizontal padding
        child: Text(
          "john.doe@example.com", // Random email
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
    ]);
  }
}
