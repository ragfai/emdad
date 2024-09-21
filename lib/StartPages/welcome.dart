import 'package:flutter/material.dart';
import 'package:untitled1/FarmerPages/home/projects_list.dart';
import 'package:untitled1/FarmerPages/profile/TermsScreen.dart';
import 'package:untitled1/StartPages/signup.dart';

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
      initialRoute: '/', // Set initial route to the Welcome page
      routes: {
        '/': (context) => const Welcome(), // Root route
        '/login': (context) => const LoginPage_(), // Define login route
        '/signup': (context) => const SignupPage(), // Define signup route
      },
    );
  }
}

// Welcome Page Widget
class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(fontSize: 33, fontFamily: "myfont"),
                ),
                const SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {
                    print("Navigating to /login");
                    Navigator.pushNamed(context, "/login");
                  },
                  child: const Text(
                    "تسجيل الدخول",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(height: 22),
                ElevatedButton(
                  onPressed: () {
                    debugPrint("Navigating to /signup");
                    Navigator.pushNamed(
                        context, '/signup'); // Navigate to signup
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 36, 67, 9),
                    ),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal: 77,
                        vertical: 13,
                      ),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27),
                      ),
                    ),
                  ),
                  child: const Text(
                    "إنشاء حساب",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProjectList(),
                      ),
                    );
                  },
                  child: const Text('View Projects'),
                ),
                const SizedBox(height: 22),
              ],
            ),
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
