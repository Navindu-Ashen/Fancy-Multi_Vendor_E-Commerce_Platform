// ignore_for_file: deprecated_member_use

import 'package:fancy/widgets/profile/account_settings_card.dart';
import 'package:fancy/widgets/profile/personal_info_card.dart';
import 'package:fancy/widgets/profile/profile_header.dart';
import 'package:fancy/widgets/section_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final String userName = "Binadi Dissanayake";
  final String userEmail = "NaviBina@gmail.com";
  final String userPhone = "+94 77 123 4567";
  final String userAddress = "123 Main Street, Colombo";
  final String userProfileImage = "assets/images/profile.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Profile",
          style: GoogleFonts.marcellus(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.black,
            onPressed: () {
              // Handle edit profile
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(
                userName: userName,
                userEmail: userEmail,
                userProfileImage: userProfileImage,
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionTitle(title: "Personal Information"),
                    PersonalInfoCard(
                      userPhone: userPhone,
                      userAddress: userAddress,
                    ),
                    const SizedBox(height: 24),
                    const SectionTitle(title: "Account Settings"),
                    const AccountSettingsCard(),
                    const SizedBox(height: 24),

                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 24),
                      child: ElevatedButton(
                        onPressed: () {
                          print("Developed by WaveLoop");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            165,
                            81,
                            139,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Log Out",
                          style: GoogleFonts.marcellus(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
