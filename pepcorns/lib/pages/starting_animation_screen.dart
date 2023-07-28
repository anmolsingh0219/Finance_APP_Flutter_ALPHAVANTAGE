import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pepcorns/pages/auth_page.dart';
import 'package:video_player/video_player.dart';

class StartingAnimationScreen extends StatefulWidget {
  @override
  _StartingAnimationScreenState createState() =>
      _StartingAnimationScreenState();
}

class _StartingAnimationScreenState extends State<StartingAnimationScreen> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;
  bool _showButton = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/start.mp4')
      ..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
          _controller.play();
          _startTimerToShowButton();
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startTimerToShowButton() {
    Timer(Duration(seconds: 3), () {
      setState(() {
        _showButton = true;
      });
    });
  }

  void _navigateToAuthScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AuthPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _isVideoInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
        Positioned(
          bottom:
              60, // Adjust this value to change the button's position from the bottom
          left: 65,
          right: 65,
          child: AnimatedOpacity(
            opacity: _showButton ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            child: ElevatedButton(
              onPressed: _navigateToAuthScreen,
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent, // Transparent background
                onPrimary: Colors.deepPurple, // Border color
                side: BorderSide(
                    width: 2,
                    color: Colors.deepPurple), // Border width and color
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'SofiaSans',
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
