import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'phoneVerification.dart';
import 'loginPage.dart';

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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Form key and controllers
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _isObscure = true;
  bool _isObscureConfirm = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  Future<void> _signUp(BuildContext context) async {
    if (_formKey.currentState!.validate() && _selectedRole != null) {
      try {
        // Firebase sign-up with email and password
        final userCredential = await _auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        // Store all user data in Firestore
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'name': nameController.text.trim(),
          'email': emailController.text.trim(),
          'phone': phoneController.text.trim(),
          'role': _selectedRole,
          'uid': userCredential.user!.uid,
        });

        // Navigate to Phone Verification with user data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhoneVerification(
              phoneNumber: phoneController.text,
              userData: {
                'name': nameController.text.trim(),
                'email': emailController.text.trim(),
                'phone': phoneController.text.trim(),
                'role': _selectedRole,
                'uid': userCredential.user!.uid,
              },
            ),
          ),
        );
      } catch (e) {
        // Handle errors and display a message to the user
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Error: $e"),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAF9),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_forward,
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
            height: MediaQuery.of(context).size.height - 140,
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
                  child: Form(
                    key: _formKey,
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
                            Rect.fromLTWH(
                                0.0, 0.0, bounds.width, bounds.height),
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
                          controller: nameController,
                          validator: (value) =>
                              value!.isEmpty ? "Please enter your name" : null,
                        ),
                        buildGradientLine(),
                        const SizedBox(height: 1),
                        buildInputField(
                          label: 'البريد الإلكتروني',
                          icon: Icons.email,
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty)
                              return "Please enter your email";
                            if (!RegExp(
                                    r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-z]")
                                .hasMatch(value)) {
                              return "Please enter a valid email";
                            }
                            return null;
                          },
                        ),
                        buildGradientLine(),
                        const SizedBox(height: 1),
                        buildInputField(
                          label: 'رقم الجوال',
                          icon: Icons.phone,
                          controller: phoneController,
                          validator: (value) {
                            if (value!.isEmpty)
                              return "Please enter your phone number";
                            if (value.length < 10)
                              return "Please enter a valid phone number";
                            return null;
                          },
                        ),
                        buildGradientLine(),
                        const SizedBox(height: 1),
                        buildInputField(
                          label: 'كلمة المرور',
                          icon: Icons.lock,
                          isPassword: true,
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty)
                              return "Please enter your password";
                            if (value.length < 6)
                              return "Password must be at least 6 characters";
                            return null;
                          },
                        ),
                        buildGradientLine(),
                        const SizedBox(height: 1),
                        buildInputField(
                          label: 'تأكيد كلمة المرور',
                          icon: Icons.lock_outline,
                          isPassword: true,
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value != passwordController.text)
                              return "Passwords do not match";
                            return null;
                          },
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
                            ),
                            value: _selectedRole,
                            items: _roles.map((String role) {
                              return DropdownMenuItem<String>(
                                value: role,
                                child: Text(
                                  role,
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                      fontFamily: 'Markazi Text'),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedRole = newValue;
                              });
                            },
                            style: const TextStyle(
                              color: Color(0xFF4B7960),
                              fontFamily: 'Markazi Text',
                            ),
                            validator: (value) =>
                                value == null ? "Please select a role" : null,
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
                      onPressed: () => _signUp(context),
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

  Widget buildInputField({
    required String label,
    required IconData icon,
    bool isPassword = false,
    required TextEditingController controller,
    String? Function(String?)? validator,
  }) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            obscureText: isPassword,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
              labelText: label,
              alignLabelWithHint: true,
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
            ),
            cursorColor: const Color(0xFF4B7960),
            style: const TextStyle(fontFamily: 'Markazi Text'),
            validator: validator,
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
