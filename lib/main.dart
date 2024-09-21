import 'package:flutter/material.dart';
import 'package:untitled1/FarmerPages/profile/InfoScreen.dart';
import 'package:untitled1/FarmerPages/profile/CustomerServiceScreen.dart';
import 'package:untitled1/FarmerPages/profile/LanguageChangeScreen.dart';
import 'package:untitled1/FarmerPages/profile/FAQscreen.dart';
import 'package:untitled1/FarmerPages/profile/ProfilePage.dart';
import 'package:untitled1/FarmerPages/profile/TermsScreen.dart';
import 'package:untitled1/FarmerPages/home/agricultural_project_screen.dart';
//add returns - farmer
import 'package:untitled1/FarmerPages/deposite/deposit_returns.dart';
import 'package:untitled1/FarmerPages/deposite/payment_failure.dart';
import 'package:untitled1/FarmerPages/deposite/payment_loading.dart';
import 'package:untitled1/FarmerPages/deposite/payment_process.dart';
import 'package:untitled1/FarmerPages/deposite/payment_success.dart';
import 'package:untitled1/FarmerPages/home/projects_list.dart';
//start pages
import 'package:untitled1/StartPages/LoginPage.dart';
import 'package:untitled1/StartPages/forgotpassword.dart';
import 'package:untitled1/StartPages/phoneVerification.dart';
import 'package:untitled1/StartPages/resetpassword.dart';
import 'package:untitled1/StartPages/signup.dart';
import 'package:untitled1/StartPages/welcome.dart';

// Import the new screens for the payment flow

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const Welcome(),
        "/login": (context) => const LoginPage(),
        "/signup": (context) => const SignupPage(),
        //"/resetpassword": (context) => const PasswordResetPage(),
        "/forgetpassword": (context) => const ForgotPasswordScreen(),
        "/phoneverification": (context) => phoneverification(),

//farmer
//bar screens
        '/profile': (context) => const ProfilePage(),
        "/agricultural-project": (context) => const AgriculturalProjectScreen(),
        "/ProjectList": (context) => const ProjectList(),
        '/account': (context) => const InfoScreen(), // Account screen route
        '/customer_service': (context) =>
            const CustomerServiceScreen(), // Customer service route
        '/language_change': (context) =>
            const LanguageChangeScreen(), // Language change route
        '/FAQ': (context) => const FAQscreen(), // Privacy policy route
        '/terms': (context) => const TermsScreen(), // Terms screen route

        // payment process
        "/deposit-investment": (context) => const DepositReturnsScreen(),
        "/payment-process": (context) => const PaymentProcessScreen(),
        "/payment-loading": (context) => const PaymentLoadingScreen(),
        "/payment-success": (context) => const PaymentSuccessScreen(),
        "/payment-failure": (context) => const PaymentFailureScreen(),
      },
    );
  }
}
