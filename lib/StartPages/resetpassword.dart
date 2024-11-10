import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({super.key});

  @override
  _PasswordResetPageState createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
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
        elevation: 0, // Remove shadow
        automaticallyImplyLeading: false, // Prevents the default back button
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 150.0), // Adjusted padding
            child: Column(
              children: [
                Container(
                  width: 352,
                  height: 270,
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
                            'كلمة المرور الجديدة',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Markazi Text',
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // New Password Field
                        Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: 300,
                            child: TextFormField(
                              obscureText: true,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontFamily: 'Markazi Text',
                              ),
                              decoration: InputDecoration(
                                labelText: 'ادخل كلمة المرور الجديدة',
                                labelStyle: const TextStyle(
                                  fontFamily: 'Markazi Text',
                                  color: Colors.grey,
                                ),
                                suffixIcon: const Icon(Icons.lock,
                                    color: Color(0xFF4B7960)),
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 1),
                        Container(
                          height: 1,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF4B7960),
                                Color(0xFF728F66),
                                Color(0xFFA2AA6D),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Confirm Password Field
                        Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: 300,
                            child: TextFormField(
                              obscureText: true,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontFamily: 'Markazi Text',
                              ),
                              decoration: InputDecoration(
                                labelText: 'تأكيد كلمة المرور',
                                labelStyle: const TextStyle(
                                  fontFamily: 'Markazi Text',
                                  color: Colors.grey,
                                ),
                                suffixIcon: const Icon(Icons.lock,
                                    color: Color(0xFF4B7960)),
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 1),
                        Container(
                          height: 1,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF4B7960),
                                Color(0xFF728F66),
                                Color(0xFFA2AA6D),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // Reset Button
                Container(
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
                    onPressed: () {
                      // Add reset password logic here
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      shadowColor: Colors.transparent,
                    ),
                    child: const Text(
                      'إعادة تعيين',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Markazi Text',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
