import 'package:flutter/material.dart';
import 'package:untitled1/FarmerPages/deposite/card_info.dart';
import 'package:untitled1/FarmerPages/home/farmerHome.dart';
import 'package:untitled1/FarmerPages/profile/InfoScreen.dart';
import 'package:untitled1/FarmerPages/profile/CustomerServiceScreen.dart';
import 'package:untitled1/FarmerPages/profile/FAQscreen.dart';
import 'package:untitled1/FarmerPages/profile/ProfilePage.dart';
import 'package:untitled1/FarmerPages/profile/TermsScreen.dart';
import 'package:untitled1/FarmerPages/home/agricultural_project_screen.dart';
//add returns - farmer
import 'package:untitled1/FarmerPages/deposite/deposit_returns.dart';
import 'package:untitled1/FarmerPages/deposite/payment_process.dart';
import 'package:untitled1/FarmerPages/home/projects_list.dart';
import 'package:untitled1/InvestorPages/HomeScreen.dart';
//start pages
import 'package:untitled1/StartPages/LoginPage.dart';
import 'package:untitled1/StartPages/forgotpassword.dart';
import 'package:untitled1/StartPages/phoneVerification.dart';
import 'package:untitled1/StartPages/signup.dart';
import 'package:untitled1/StartPages/welcome.dart';
// Import the new screens for the payment flow

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure bindings are initialized before Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Markazi Text', // Set the global font family
      ),
      initialRoute: '/', // Start with StartPage as the initial page
      routes: {
        '/': (context) => StartPage(),
        '/farmerPage': (context) =>
            FarmerHomePage(), // Add route for FarmerHomePage
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        //farmer
        'home': (context) => const FarmerHomePage(),
        '/profile': (context) => const ProfilePage(),
        "/agricultural-project": (context) => const AgriculturalProjectScreen(),
        "/ProjectList": (context) => const ProjectList(),
        '/account': (context) => const InfoScreen(), // Account screen route
        '/customer_service': (context) =>
            const CustomerServiceScreen(), // Customer service route
        '/FAQ': (context) => const FAQscreen(), // Privacy policy route
        '/terms': (context) => const TermsScreen(), // Terms screen route

        // payment process
        "/deposit-investment": (context) => const DepositReturnsScreen(),
        "/card_info": (context) => const CardInfoScreen(),
        "/payment-process": (context) =>
            PaymentStatusPage(), // Updated to the new class

        '/investorPage': (context) => HomeScreen(),
      },
    );
  }
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/FirstBg.png',
              fit: BoxFit.cover,
            ),
          ),
          // White Rounded Container
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  // Small line at the top of the container
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        CustomButton(
                          text: 'تسجيل الدخول',
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                        ),
                        SizedBox(height: 15),
                        CustomButton(
                          text: 'تسجيل',
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                        ),
                        SizedBox(height: 15), // Add space before the new button
                        CustomButton(
                          text: 'اذهب إلى الصفحة الرئيسية',
                          onPressed: () {
                            Navigator.pushNamed(context,
                                '/farmerPage'); // Navigate to FarmerHomePage
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  // Line with "أو التسجيل مع" text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey[400],
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'أو التسجيل مع',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Markazi Text',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey[400],
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          'assets/icons/googleIcon.png',
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () {
                          // Google login logic
                        },
                      ),
                      IconButton(
                        icon: Image.asset(
                          'assets/icons/appleIcon.jpg',
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () {
                          // Apple login logic
                        },
                      ),
                      IconButton(
                        icon: Image.asset(
                          'assets/icons/phoneIcon.jpg',
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/phoneVerification');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF335D4F), Color(0xFFA8B475)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Markazi Text',
          ),
        ),
      ),
    );
  }
}
