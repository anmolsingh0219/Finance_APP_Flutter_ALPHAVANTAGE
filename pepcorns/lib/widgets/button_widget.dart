import 'package:flutter/material.dart';

class CustomExploreButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText; // New parameter to accept custom text

  const CustomExploreButton({
    required this.onPressed,
    required this.buttonText, // Add buttonText to the constructor
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.deepPurple, // Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
        padding: EdgeInsets.symmetric(
            horizontal: 24.0, vertical: 16.0), // Button padding
      ),
      child: Text(
        buttonText, // Use the custom text provided
        style: TextStyle(
          color: Colors.white, // Button text color
          fontFamily: 'SofiaSans', // Use Sofia Sans font for the button text
          fontSize: 18.0, // Button text font size
          fontWeight: FontWeight.bold, // Button text font weight
        ),
      ),
    );
  }
}
