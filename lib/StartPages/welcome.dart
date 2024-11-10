import 'package:flutter/material.dart';
import 'package:untitled1/FarmerPages/home/farmerHome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Welcome(),
        '/login': (context) => const LoginPage_(),
      },
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAF9),
        body: Stack(
          children: [
            Positioned(
              left: 30,
              top: 100, // Adjust this to bring the box higher
              child: Container(
                width: 352,
                height: 350, // Adjusted for content space
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
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                          "مرحبا",
                          style: TextStyle(
                            fontSize: 33,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontFamily: "Markazi Text",
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      _buildButton(
                        context,
                        "تسجيل الدخول",
                        onPressed: () => Navigator.pushNamed(context, "/login"),
                      ),
                      const SizedBox(height: 15),
                      _buildButton(
                        context,
                        "إنشاء حساب",
                        onPressed: () =>
                            Navigator.pushNamed(context, '/signup'),
                      ),
                      const SizedBox(height: 15),
                      _buildButton(
                        context,
                        "farmer code",
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FarmerHomePage(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text,
      {required VoidCallback onPressed}) {
    return Container(
      height: 50,
      width: 200,
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
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          shadowColor: Colors.transparent,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// Login Page Widget
class LoginPage_ extends StatelessWidget {
  const LoginPage_({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: const Center(child: Text('Login Page')),
    );
  }
}
