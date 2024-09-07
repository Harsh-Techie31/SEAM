import 'package:flutter/material.dart';

class SossScreen extends StatelessWidget {
  const SossScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SOS - Connect with Peers"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          // Header with nearby miners
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     colors: [Colors.blue.shade300, Colors.purple.shade300],
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //   ),
            //   borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
            // ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Nearby Miners:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 70,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildMinerChip("Mukesh Kumar"),
                      _buildMinerChip("Raju Rastogi"),
                      _buildMinerChip("Rimlesh Thakur"),
                      _buildMinerChip("Mahesh Gautam"),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
          //const SizedBox(height: 10),
          const SizedBox(height: 10),
                const Center(
                  child:  Text(
                    "Public Chat",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
          // Chat window
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(10),
                    children: [
                      // Example chat bubbles
                      _buildChatBubble("Hello!", true),
                      _buildChatBubble("Hi there! Need help?", false),
                      _buildChatBubble("Yes, I’m lost.", true),
                      _buildChatBubble("I’ll guide you.", false),
                    ],
                  ),
                ),
                // Message input area
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      // Text input field
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Type a message",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Send button
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          // Handle send action
                        },
                      ),
                    ],
                  ),
                ),
                // Action buttons
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionButton(Icons.mic, "Voice Note", () {
                        // Handle voice note
                      }),
                      _buildActionButton(Icons.call, "Voice Call", () {
                        // Handle voice call
                      }),
                      _buildActionButton(Icons.video_call, "Video Call", () {
                        // Handle video call
                      }),
                      _buildActionButton(Icons.image, "Image", () {
                        // Handle image sending
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build miner chip
  Widget _buildMinerChip(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Chip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(name , style: const TextStyle(fontSize: 20),),
            IconButton(
              icon: const Icon(Icons.call, color: Colors.white),
              onPressed: () {
                // Handle call action
              },
            ),
          ],
        ),
        backgroundColor: Colors.deepPurple,
        labelStyle: const TextStyle(color: Colors.white),
      ),
    );
  }

  // Helper function to build chat bubbles
  Widget _buildChatBubble(String text, bool isMine) {
    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: isMine ? Colors.deepPurpleAccent : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isMine ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  // Helper function to create action buttons
  Widget _buildActionButton(IconData icon, String label, VoidCallback onPressed) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, // Icon color
            backgroundColor: Colors.red, // Background color
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
          ),
          child: Icon(icon, size: 30),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.red)),
      ],
    );
  }
}
