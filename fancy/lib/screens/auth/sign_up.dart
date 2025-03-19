import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _aboutController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/206813471_75f9a78b-b98f-4194-b683-beafc10c3cd9.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: screenSize.height - 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        spacing: 16,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sign Up',
                            style: GoogleFonts.marcellus(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 165, 81, 139),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Column(
                        spacing: 16,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: SizedBox(
                                  child: CircleAvatar(
                                    radius: 84,
                                    backgroundColor: Color.fromARGB(
                                      255,
                                      165,
                                      81,
                                      139,
                                    ),
                                    child: CircleAvatar(
                                      radius: 78.0,
                                      backgroundImage: AssetImage(""),
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.add_a_photo_rounded,
                                            ),
                                            iconSize: 30,
                                            padding: const EdgeInsets.all(10),
                                            color: Colors.white,
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  WidgetStateProperty.all<
                                                    Color
                                                  >(
                                                    Color.fromARGB(
                                                      255,
                                                      165,
                                                      81,
                                                      139,
                                                    ),
                                                  ),
                                            ),
                                          ),
                                          // IconButton(
                                          //     onPressed: () {
                                          //       context
                                          //           .read<UserProvider>()
                                          //           .clearImage();
                                          //     },
                                          //     icon: const Icon(
                                          //         Icons.cancel_outlined),
                                          //     iconSize: 30,
                                          //     padding:
                                          //         const EdgeInsets.all(
                                          //             10),
                                          //     color: Colors.white,
                                          //     style: ButtonStyle(
                                          //       backgroundColor:
                                          //           WidgetStateProperty
                                          //               .all<Color>(
                                          //         Color.fromARGB(
                                          //             255, 245, 146, 69),
                                          //       ),
                                          //     ),
                                          //   )
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              labelStyle: GoogleFonts.marcellus(
                                color: Color.fromARGB(255, 165, 81, 139),
                              ),
                              prefixIcon: Icon(Icons.person),
                              prefixIconColor: Color.fromARGB(
                                255,
                                165,
                                81,
                                139,
                              ),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 165, 81, 139),
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 165, 81, 139),
                                  width: 2.5,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a username';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _aboutController,
                            decoration: InputDecoration(
                              labelText: 'Contact Number',
                              labelStyle: GoogleFonts.marcellus(
                                color: Color.fromARGB(255, 165, 81, 139),
                              ),
                              prefixIcon: Icon(Icons.phone),
                              prefixIconColor: Color.fromARGB(
                                255,
                                165,
                                81,
                                139,
                              ),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 165, 81, 139),
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 165, 81, 139),
                                  width: 2.5,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your contact number';
                              }
                              return null;
                            },
                          ),
                          // TextFormField(
                          //   decoration: InputDecoration(
                          //     labelText: 'Address',
                          //     labelStyle: GoogleFonts.marcellus(
                          //       color: Color.fromARGB(100, 0, 0, 0),
                          //     ),
                          //     prefixIcon: Icon(Icons.location_pin),
                          //     prefixIconColor: Color.fromARGB(255, 246, 166, 221),
                          //     border: OutlineInputBorder(),
                          //     enabledBorder: OutlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: Color.fromARGB(255, 246, 166, 221),
                          //       ),
                          //     ),
                          //     focusedBorder: OutlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: Color.fromARGB(255, 165, 81, 139),
                          //         width: 2,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hoverColor: Color.fromARGB(255, 165, 81, 139),
                              labelText: 'Email',
                              labelStyle: GoogleFonts.marcellus(
                                color: Color.fromARGB(255, 165, 81, 139),
                              ),
                              prefixIcon: Icon(Icons.email),
                              prefixIconColor: Color.fromARGB(
                                255,
                                165,
                                81,
                                139,
                              ),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 165, 81, 139),
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 165, 81, 139),
                                  width: 2.5,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              // Add email format validation
                              bool emailValid = RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                              ).hasMatch(value);
                              if (!emailValid) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),

                          TextFormField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: GoogleFonts.marcellus(
                                color: Color.fromARGB(255, 165, 81, 139),
                              ),
                              prefixIcon: const Icon(Icons.lock),
                              prefixIconColor: Color.fromARGB(
                                255,
                                165,
                                81,
                                139,
                              ),
                              border: const OutlineInputBorder(),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 165, 81, 139),
                                  width: 2,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 165, 81, 139),
                                  width: 2.5,
                                ),
                              ),
                              suffixIconColor: Color.fromARGB(
                                255,
                                165,
                                81,
                                139,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              fixedSize: Size(screenSize.width, 58),
                              backgroundColor: Color.fromARGB(
                                255,
                                165,
                                81,
                                139,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              disabledBackgroundColor: const Color.fromARGB(
                                255,
                                165,
                                81,
                                139,
                              ),
                            ),
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.marcellus(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            height: 2,
                            width: screenSize.width,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 165, 81, 139),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: RichText(
                              text: TextSpan(
                                style: GoogleFonts.marcellus(
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(text: "Already have an account? "),
                                  TextSpan(
                                    text: "Sign In",
                                    style: GoogleFonts.marcellus(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Text(
                            "By registering you agree to our\nTerms & Privacy Policy",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.marcellus(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
