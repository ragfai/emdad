import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/StartPages/phoneVerification.dart';
import 'package:untitled1/StartPages/loginPage.dart'; // Import the LoginPage

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignScreen();
  }
}

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<SignScreen> {
  String? _selectedRole;
  final List<String> _roles = ['مزارع', 'مستثمر'];

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
      body: Stack(
        children: [
          // Background Container
          Container(
            height: MediaQuery.of(context).size.height -
                140, // Reduce height instead of using negative margins
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main content
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 150),
              child: Container(
                width: 352,
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [
                            Color(0xFF4B7960),
                            Color(0xFF728F66),
                            Color(0xFFA2AA6D),
                          ],
                        ).createShader(
                          Rect.fromLTWH(0.0, 0.0, bounds.width, bounds.height),
                        ),
                        child: const Text(
                          'حساب جديد',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Markazi Text',
                          ),
                        ),
                      ),
                      buildInputField(
                        label: 'الاسم الأول والأخير',
                        icon: Icons.person,
                      ),
                      buildGradientLine(),
                      const SizedBox(height: 1),
                      buildInputField(
                        label: 'البريد الإلكتروني',
                        icon: Icons.email,
                      ),
                      buildGradientLine(),
                      const SizedBox(height: 1),
                      buildInputField(
                        label: 'رقم الجوال',
                        icon: Icons.phone,
                      ),
                      buildGradientLine(),
                      const SizedBox(height: 1),
                      buildInputField(
                        label: 'كلمة المرور',
                        icon: Icons.lock,
                        isPassword: true,
                      ),
                      buildGradientLine(),
                      const SizedBox(height: 1),
                      buildInputField(
                        label: 'تأكيد كلمة المرور',
                        icon: Icons.lock_outline,
                        isPassword: true,
                      ),
                      buildGradientLine(),
                      const SizedBox(height: 1),
                      SizedBox(
                        height: 50,
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'هل أنت مزارع أم مستثمر؟',
                            alignLabelWithHint: true,
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                          value: _selectedRole,
                          items: _roles.map((String role) {
                            return DropdownMenuItem<String>(
                              value: role,
                              child: Text(role,
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                      fontFamily: 'Markazi Text')),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedRole = newValue;
                            });
                          },
                          style: const TextStyle(
                              color: Color(0xFF4B7960),
                              fontFamily: 'Markazi Text'),
                        ),
                      ),
                      const SizedBox(height: 1),
                      buildGradientLine(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Button and text at the bottom
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PhoneVerification()),
                        );
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
                        'إنشاء حساب',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Markazi Text',
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text(
                      'يوجد لديك حساب؟ تسجيل الدخول',
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
    );
  }

  Widget buildInputField(
      {required String label,
      required IconData icon,
      bool isPassword = false}) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            obscureText: isPassword,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
              labelText: label,
              alignLabelWithHint: true,
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
              enabledBorder:
                  const UnderlineInputBorder(borderSide: BorderSide.none),
              focusedBorder:
                  const UnderlineInputBorder(borderSide: BorderSide.none),
            ),
            cursorColor: const Color(0xFF4B7960),
            style: const TextStyle(fontFamily: 'Markazi Text'),
          ),
        ),
        const SizedBox(width: 1),
        Icon(icon, color: const Color(0xFF4B7960)),
      ],
    );
  }

  Widget buildGradientLine() {
    return Container(
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
    );
  }
}
