import 'package:flutter/material.dart';
import 'ErrorPage.dart'; // Import the error page

class phoneverification extends StatelessWidget {
  const phoneverification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        // title: Image.asset(
        //   'assets/emdad_logo.png', // Place your logo asset path here
        //   height: 50,
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'التحقق من رقم الجوال',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            // Assuming placeholders for images/icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => const Icon(Icons.check_box_outline_blank, size: 40),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Validate the phone number here
                bool isPhoneNumberValid =
                    false; // Replace with actual validation logic

                if (!isPhoneNumberValid) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ErrorPage()),
                  );
                } else {
                  // Proceed with verification
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 80),
              ),
              child: const Text(
                'التحقق',
                style: TextStyle(fontSize: 18),
              ),
            ),
            TextButton(
              onPressed: () {
                // Add functionality here to resend the code
              },
              child: const Text('أعد إرسال الرمز'),
            ),
          ],
        ),
      ),
    );
  }
}
