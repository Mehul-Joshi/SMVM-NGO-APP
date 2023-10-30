import 'package:flutter/material.dart';

import 'package:smvm/Registration.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Add a delay before navigating to the home page
    Future.delayed(Duration(milliseconds: 2500), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              Registration(), // Replace 'HomePage' with your actual home page widget
        ),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white, // Set your desired background color
      body: Stack(
        fit: StackFit.expand, // Make the stack's children fill the screen
        children: [
          Image.asset(
            'assets/images/ic_logo.jpeg',
            fit: BoxFit.cover, // Scale the image to cover the entire screen
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SMVM',
                  style: TextStyle(
                    fontSize: 54,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Customize the text color
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
