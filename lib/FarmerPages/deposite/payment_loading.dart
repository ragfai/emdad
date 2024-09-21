import 'package:flutter/material.dart';

class PaymentLoadingScreen extends StatelessWidget {
  const PaymentLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      // Simulating a delay for loading
      Navigator.pushReplacementNamed(context, '/payment-success');
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('تحميل عملية الدفع'),
      ),
      body: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        ),
      ),
    );
  }
}
