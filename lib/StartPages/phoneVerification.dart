import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({super.key});

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  String _activationCode = '';
  bool _isCodeValid = true;
  final List<TextEditingController> _controllers =
  List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  void _verifyActivationCode() {
    // Validate the activation code
    if (_activationCode != '1234') {
      // Replace with your validation logic
      setState(() {
        _isCodeValid = false;
      });
    } else {
      setState(() {
        _isCodeValid = true;
      });
      // Proceed with verification if needed
    }
  }

  void _onChanged(String value, int index) {
    setState(() {
      // Build activation code from each field's value
      _activationCode =
          _controllers.map((controller) => controller.text).join();

      if (value.isNotEmpty && index < 3) {
        // Move focus to next field if not the last field
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else if (value.isEmpty && index > 0) {
        // Move focus to previous field if backspace is pressed
        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // Set the system UI overlay style
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAF9), // Set AppBar color
        elevation: 0,
        automaticallyImplyLeading: false, // Prevent default back button
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15), // Adjusted padding
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_forward, // Forward arrow
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height -
            140, // Reduce height instead of using negative margins
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg2.png'), // Background image
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 150.0), // Adjusted padding
                child: Column(
                  children: [
                    Container(
                      width: 352,
                      height: 300,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(33),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Title with gradient
                            ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                colors: [
                                  Color(0xFF4B7960),
                                  Color(0xFF728F66),
                                  Color(0xFFA2AA6D),
                                ],
                              ).createShader(
                                Rect.fromLTWH(
                                    0.0, 0.0, bounds.width, bounds.height),
                              ),
                              child: const Text(
                                'التحقق من رقم الجوال',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'Markazi Text',
                                ),
                              ),
                            ),
                            const SizedBox(
                                height: 8), // Space before the message
                            const Text(
                              'تم إرسال رمز تفعيلي إلى رقم الجوال الخاص بك',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontFamily: 'Markazi Text',
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 40),
                            const Text(
                              'الرمز التفعيلي',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF4B7960),
                                fontFamily: 'Markazi Text',
                              ),
                            ),
                            const SizedBox(height: 10),
                            // OTP input fields
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                4,
                                    (index) => GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context)
                                        .requestFocus(_focusNodes[index]);
                                  },
                                  child: SizedBox(
                                    width: 40,
                                    child: TextField(
                                      controller: _controllers[index],
                                      focusNode: _focusNodes[index],
                                      onChanged: (value) =>
                                          _onChanged(value, index),
                                      maxLength: 1,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        counterText: '',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: Color(0xFF4B7960),
                                            width: 2,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: Color(0xFF4B7960),
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        color: Color(0xFF4B7960),
                                        fontFamily: 'Markazi Text',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                                height: 8), // Space before the error message
                            if (!_isCodeValid)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'رمز التفعيل المدخل غير صحيح',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12, // Small font size
                                      fontFamily: 'Markazi Text',
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50), // Space after the container
                    // Verification button with gradient background
                    Center(
                      child: Container(
                        height: 35,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF4B7960),
                              Color(0xFF728F66),
                              Color(0xFFA2AA6D),
                            ],
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: _verifyActivationCode,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            shadowColor: Colors.transparent,
                          ),
                          child: const Text(
                            'التحقق',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Markazi Text',
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Resend code option
                    TextButton(
                      onPressed: () {
                        // Add functionality here to resend the code
                      },
                      child: const Text(
                        'أعد إرسال الرمز',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Markazi Text',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
