import 'package:flutter/material.dart';

class CustomerServiceScreen extends StatelessWidget {
  const CustomerServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove the AppBar to build a custom gradient header
      body: Column(
        children: [
          // Top gradient background with a curved bottom
          Stack(
            children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  gradient: SweepGradient(
                    colors: [
                      Color(0xFF49785E), // Start color
                      Color(0xFFB8BE79), // Middle color
                      Color(0xFF335D4F), // End color
                      Color(0xFF49785E), // Close the loop to start color
                    ],
                    center: FractionalOffset.center,
                    startAngle: 0.0,
                    endAngle: 3.14 * 2, // Full circle (360 degrees)
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                top: 50,
                right: 16,
                child: IconButton(
                  icon: const Icon(Icons.notifications, color: Colors.white),
                  onPressed: () {
                    // Add notification action
                  },
                ),
              ),
              const Positioned(
                top: 90,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'خدمة العملاء',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Chat messages area
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "اهلا بكم في إمداد",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8), // Add space between messages
                        Text(
                          "كيف نقدر نخدمكم؟",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Input field and send button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'اكتب هنا...',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFF49785E)),
                  onPressed: () {
                    // Implement send message functionality here
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
