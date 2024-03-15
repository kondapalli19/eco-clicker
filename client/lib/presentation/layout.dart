import 'dart:async';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:audioplayers/audioplayers.dart';

import 'top_info_bar.dart';
import 'navbar/navbar.dart';
import '/passive.dart';
import '/theme.dart';
import './marquee_texts/marquee_texts.dart';

class Layout extends StatefulWidget {
  final Widget child;

  const Layout({required this.child, Key? key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      setState(() {
        _showSplash = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showSplash ? SplashScreen() : MainLayout(child: widget.child);
  }
}

class SplashScreen extends StatefulWidget {

    @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AudioPlayer audioPlayer; // Declare an instance of AudioPlayer

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer(); // Initialize the AudioPlayer instance
    playMusic(); // Call the playMusic function to start playing music
  }

  void playMusic() async {
    await audioPlayer.play(UrlSource('assets/startGame.mp3')); // Play music from assets folder
  }

  @override
  void dispose() {
    audioPlayer.dispose(); // Dispose the AudioPlayer instance when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    Size screenSize = MediaQuery.of(context).size;

    // Determine whether the screen is of iPhone size
    bool isIphoneSize = screenSize.width <= 414 && screenSize.height <= 896;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          isIphoneSize ? 'assets/Splash_Iphone.png' : 'assets/Splash_Mac.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [EcoColors.bgDark, EcoColors.bgLight],
              ),
            ),
          ),
          Positioned.fill(
            child: Image.asset(
              'assets/stars_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MarqueeTexts(), // Place MarqueeTexts widget above AppBar
              const SizedBox(height: 0.1), // Adjust the space between MarqueeTexts and AppBar
              AppBar(
                backgroundColor: EcoColors.bgDark.withOpacity(0.8),
                elevation: 0, // Remove shadow
                title: const TopInfoBar(),
              ),
              Expanded(child: child),
              const Passive(),
              const Navbar(),
            ],
          ),
        ],
      ),
    );
  }
}
