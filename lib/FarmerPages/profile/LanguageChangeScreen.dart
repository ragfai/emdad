import 'package:flutter/material.dart';

class LanguageChangeScreen extends StatelessWidget {
  const LanguageChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("تغيير اللغة")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: const Text("العربية", style: TextStyle(fontSize: 18)),
              onTap: () {
                // Switch to Arabic logic
              },
            ),
            const Divider(),
            ListTile(
              title: const Text("English", style: TextStyle(fontSize: 18)),
              onTap: () {
                // Switch to English logic
              },
            ),
          ],
        ),
      ),
    );
  }
}
