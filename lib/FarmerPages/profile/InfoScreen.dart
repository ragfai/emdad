import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("عن إمداد")),
      body: const Center(
        child: Text(
          'تفاصيل',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
