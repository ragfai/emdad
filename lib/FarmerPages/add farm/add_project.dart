import 'package:flutter/material.dart';
import 'package:untitled1/FarmerPages/add%20farm/adding_success.dart';

class AddProject extends StatefulWidget {
  const AddProject({super.key});

  @override
  _AddProjectFormScreenState createState() => _AddProjectFormScreenState();
}

class _AddProjectFormScreenState extends State<AddProject> {
  // Controllers for the form fields
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cropTypeController = TextEditingController();
  final TextEditingController totalAreaController = TextEditingController();
  final TextEditingController opportunityDurationController =
      TextEditingController();
  final TextEditingController productionRateController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAF9),
      body: Stack(
        children: [
          // Gradient header at the top
          Container(
            height: 160,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF4B7960),
                  Color(0xFF728F66),
                  Color(0xFFA2AA6D),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.only(top: 50, left: 16),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Spacer(),
                const Text(
                  'بيانات الفرصة الزراعية',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.only(top: 140, left: 30, right: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  // White box to contain all fields
                  Container(
                    padding: const EdgeInsets.all(20),
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
                    child: Column(
                      children: [
                        _buildTextFieldWithLine(
                            projectNameController, 'اسم المشروع'),
                        _buildTextFieldWithLine(regionController, 'المنطقة'),
                        _buildTextFieldWithLine(addressController, 'العنوان'),
                        _buildTextFieldWithLine(
                            cropTypeController, 'نوع المحصول'),
                        _buildTextFieldWithLine(totalAreaController,
                            'المساحة الكلية (بالأمتار أو الهكتار)'),
                        _buildTextFieldWithLine(
                            opportunityDurationController, 'مدة الفرصة'),
                        _buildTextFieldWithLine(
                            productionRateController, 'معدل الإنتاج'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // "إضافة المزرعة" Button with gradient
                  Container(
                    width: double.infinity,
                    height: 50,
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
                              builder: (context) => const SuccessScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text(
                        'إضافة المزرعة',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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

  // Helper method to build text fields with a larger gradient line underneath
  Widget _buildTextFieldWithLine(
      TextEditingController controller, String labelText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(
                color: Color(0xFFA09E9E)), // Updated color for label text
            border: InputBorder.none,
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 5),
        // Larger gradient line
        Container(
          height: 2.5,
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
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
