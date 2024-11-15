import 'package:flutter/material.dart';

class DepositReturnsScreen extends StatefulWidget {
  const DepositReturnsScreen({super.key});

  @override
  _DepositReturnsScreenState createState() => _DepositReturnsScreenState();
}

class _DepositReturnsScreenState extends State<DepositReturnsScreen> {
  String? selectedPaymentMethod = 'mada'; // Default selected payment method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAF9), // Set screen background color
      body: Stack(
        children: [
          // Top gradient background with a rounded border at the bottom
          Container(
            height: 320,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF345E50),
                  Color(0xFF49785E),
                  Color(0xFFA8B475),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                // Back button positioned at the top right
                Positioned(
                  top: 50,
                  right: 15,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                // Header text aligned to the bottom center
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 145.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'ايداع عوائد المزرعة', // Main title
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'يرجى إدخال قيمة العائد مع اختيار طريقة الدفع\n المناسبة لإتمام العملية',
                          style: TextStyle(fontSize: 15, color: Colors.white70),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Main content area with form fields for deposit and payment method
          Padding(
            padding: const EdgeInsets.only(top: 200, left: 16, right: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        _buildLabel(
                            'أدخل عائد المزرعة'), // Label for amount input
                        const SizedBox(height: 5),
                        _buildAmountInput(), // Text field for inputting deposit amount
                        _buildDivider(), // Divider for visual separation
                        const SizedBox(height: 50),
                        _buildLabel(
                            'اختر طريقة الدفع'), // Label for payment method selection
                        _buildPaymentMethod(
                            'mada', 'assets/icons/MadaIcon.png'),
                        const SizedBox(height: 10),
                        _buildPaymentMethod(
                            'applePay', 'assets/icons/applepayIcon.png'),
                        const SizedBox(height: 40),
                        _buildNextButton(context), // Button to proceed
                      ],
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

  // Widget to display a label with bold text
  Widget _buildLabel(String text) {
    return Container(
      alignment: Alignment.centerRight,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF345E50),
        ),
      ),
    );
  }

  // Text field for entering the deposit amount
  Widget _buildAmountInput() {
    return const TextField(
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: 'القيمة بالريال السعودي',
        hintStyle: TextStyle(color: Color(0xFFA09E9E)),
        border: InputBorder.none,
      ),
      style: TextStyle(color: Color(0xFFA09E9E)),
    );
  }

  // Gradient divider for separating sections
  Widget _buildDivider() {
    return Container(
      height: 1,
      width: double.infinity,
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

  // Payment method selection with a radio button and icon
  Widget _buildPaymentMethod(String method, String assetPath) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedPaymentMethod = method;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Radio<String>(
                  value: method,
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value.toString();
                    });
                  },
                  activeColor: const Color(0xFF4B7960),
                ),
                Image.asset(
                  assetPath,
                  height: 50,
                  width: 50,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Next button to proceed to the payment process screen
  Widget _buildNextButton(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 40,
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
            Navigator.pushNamed(
                context, '/card_info'); // Navigate to Card Info Screen
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          child: const Text(
            'التالي', // Button text
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
