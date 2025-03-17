import 'package:fancy/screens/auth/get_started_2.dart';
import 'package:flutter/material.dart';

class GetStarted1 extends StatefulWidget {
  const GetStarted1({super.key});

  @override
  State<GetStarted1> createState() => _GetStarted1State();
}

class _GetStarted1State extends State<GetStarted1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get Started')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GetStarted2()),
            );
          },
          child: const Text('Next'),
        ),
      ),
    );
  }
}
