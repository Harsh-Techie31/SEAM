import 'package:flutter/material.dart';
import 'package:seam/miner_dashboard.dart';

class SafetyGuidelinesPage extends StatefulWidget {
  const SafetyGuidelinesPage({super.key});

  @override
  State<SafetyGuidelinesPage> createState() => _SafetyGuidelinesPageState();
}

class _SafetyGuidelinesPageState extends State<SafetyGuidelinesPage> {
  final Map<String, bool> _guidelinesStatus = {
    "1. Always wear proper protective equipment.": false,
    "2. Ensure proper ventilation in mining areas.": false,
    "3. Keep a safe distance from moving equipment.": false,
    "4. Follow the emergency evacuation protocols.": false,
    "5. Report any hazardous conditions immediately.": false,
    "6. Always stay hydrated during the shift.": false,
  };

  bool get _allGuidelinesChecked => !_guidelinesStatus.containsValue(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Safety Guidelines"),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Current Shift Timings: 1 PM - 5 PM",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Safety Guidelines as per DGMS",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 10),
            ..._guidelinesStatus.keys.map((guideline) => _buildGuideline(guideline)),
            const SizedBox(height: 30),
            Text(
              "Note: The shift can only be started when all the red flags are checked and the admin has approved it.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.red[700],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: _buildSlideToStartOperationButton(),
            ),
          ],
        ),
      ),
    );
  }

  // A helper function to build a guideline with a checkbox
  Widget _buildGuideline(String guideline) {
    return Row(
      children: [
        Checkbox(
          value: _guidelinesStatus[guideline],
          onChanged: (value) {
            setState(() {
              _guidelinesStatus[guideline] = value!;
            });
          },
        ),
        Expanded(
          child: Text(
            guideline,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSlideToStartOperationButton() {
    return GestureDetector(
      onPanUpdate: (details) {
        // Check if the user has slid sufficiently to enable the button
        if (details.globalPosition.dx > MediaQuery.of(context).size.width - 100) {
          if (_allGuidelinesChecked) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MinerDashboard()),
            );
          }
        }
      },
      child: Container(
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
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.center,
            child: const Text(
              "Slide to Enter",
              style:  TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
