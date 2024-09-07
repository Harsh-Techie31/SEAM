import 'package:flutter/material.dart';
import 'package:seam/minerLogin.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the package

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          labelLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/miner.jpg',
              fit: BoxFit.fill,
            ),
          ),
          // Logo positioned at the top left
          Positioned(
            top: 30, // Adjust top padding
            left: 10, // Adjust left padding
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(
                'assets/logo.jpg',
                fit: BoxFit.contain,
                color: Colors.black,
              ),
            ),
          ),
          // Content positioned at the bottom
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Welcome To SEAM",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.7),
                        offset: const Offset(3, 3),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                _buildGradientButton("Admin", () {
                  launchUrl(Uri.parse('https://main--sih-2024-alok.netlify.app/'));
                }),
                const SizedBox(height: 20),
                _buildGradientButton("Miner", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Minerlogin()),
                  );
                }),
                const SizedBox(height: 30), // Add some space at the bottom
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildGradientButton(String text, VoidCallback onPressed) {
    return Container(
      height: 60,
      width: 200,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.pinkAccent, Colors.orangeAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
