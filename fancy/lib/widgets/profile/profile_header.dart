// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileHeader extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userProfileImage;

  const ProfileHeader({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userProfileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: const Color.fromARGB(255, 165, 81, 139),
            child: CircleAvatar(
              radius: 57,
              backgroundImage: AssetImage(userProfileImage),
              onBackgroundImageError: (_, __) {
                return;
              },
            ),
          ),
          const SizedBox(height: 16),
          Text(
            userName,
            style: GoogleFonts.marcellus(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            userEmail,
            style: GoogleFonts.marcellus(
              fontSize: 14,
              color: Colors.black.withOpacity(0.9),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
