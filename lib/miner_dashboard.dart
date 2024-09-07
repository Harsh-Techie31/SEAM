import 'package:flutter/material.dart';
import 'dart:async';

import 'package:seam/sos.dart';  // Import dart:async for Timer

class MinerDashboard extends StatefulWidget {
  const MinerDashboard({super.key});

  @override
  State<MinerDashboard> createState() => _MinerDashboardState();
}

class _MinerDashboardState extends State<MinerDashboard> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading screen for 2 seconds
    Timer(const Duration(milliseconds: 800), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mine Dashboard"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurpleAccent,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Section 1: Environment Stats
                  const Text(
                    "Environment Stats",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildStatRow("Carbon Dioxide Level (CO₂)", "450 ppm"),
                  _buildStatRow("Methane Level (CH₄)", "1.2%"),
                  _buildStatRow("Mine Temperature", "25°C"),
                  const SizedBox(height: 30),

                  // Section 2: Miner Vitals
                  const Text(
                    "Miner Vitals",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildStatRow("Oxygen Level", "95%"),
                  _buildStatRow("Body Temperature", "37°C"),
                  _buildStatRow("Pulse Rate", "72 bpm"),
                  //_buildStatRow("Heartbeat", "75 bpm"),
                  const SizedBox(height: 30),

                  // Section 3: Emergency Buttons
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: _buildActionButton(
                              "3D-MAP",
                              Icons.map,
                              Colors.white,
                              () {
                                // Navigate to 3D Map Screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MapScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: _buildActionButton(
                              "",
                              Icons.sos,
                              Colors.red,
                              () {
                                // Navigate to SOS Screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SossScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  // Helper function to create stat rows
  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  // Helper function to create action buttons
  Widget _buildActionButton(String title, IconData icon, Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: title==""? Icon(icon, size: 51, color: Colors.white):Icon(icon, size: 50, color: Colors.white),
      label: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: color,
        backgroundColor: const Color.fromARGB(255, 166, 5, 5), // Background color
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

// Placeholder for the 3D Map screen


class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("3D Mine Map"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body:  Center(
        child: Image.asset(
          'assets/mine3.jpg', // Make sure you have added this image in your assets folder
          fit: BoxFit.cover, // This makes sure the image covers the entire screen
          //width: double.infinity,
          //height: double.infinity,
        ),
      ),
    );
  }
}


// Placeholder for the SOS screen
