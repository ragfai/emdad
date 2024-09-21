import 'package:flutter/material.dart';
import 'package:untitled1/FarmerPages/home/projects_list.dart';
import '../home/agricultural_project_screen.dart'; // Import the AgriculturalProjectScreen

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 120,
              ),
              const SizedBox(height: 20),
              Text(
                'تم إضافة فرصتك الزراعية بنجاح',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Navigate back to the AgriculturalProjectScreen
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProjectList()),
                    (Route<dynamic> route) =>
                        false, // Clears the navigation stack
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('الصفحة الرئيسية'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
