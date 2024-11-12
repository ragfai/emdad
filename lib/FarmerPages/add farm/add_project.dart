import 'package:flutter/material.dart';
import 'package:untitled1/FarmerPages/add%20farm/adding_success.dart';

class AddProject extends StatefulWidget {
  const AddProject({super.key});

  @override
  _AddProjectFormScreenState createState() => _AddProjectFormScreenState();
}

class _AddProjectFormScreenState extends State<AddProject> {
  // Controllers for text fields to capture user inputs
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
    return Directionality(
      textDirection:
          TextDirection.rtl, // Sets the text direction to right-to-left
      child: Scaffold(
        backgroundColor:
            const Color(0xFFF9FAF9), // Background color of the screen
        body: Stack(
          children: [
            _buildAppBar(), // Custom app bar widget
            Padding(
              padding: const EdgeInsets.only(top: 200, left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
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
                          // Text fields to capture project details
                          _buildTextField(projectNameController, 'اسم المشروع'),
                          _buildTextField(regionController, 'المنطقة'),
                          _buildTextField(addressController, 'العنوان'),
                          _buildTextField(cropTypeController, 'نوع المحصول'),
                          _buildTextField(totalAreaController,
                              'المساحة الكلية (بالأمتار أو الهكتار)'),
                          _buildTextField(
                              opportunityDurationController, 'مدة الفرصة'),
                          _buildTextField(
                              productionRateController, 'معدل الإنتاج'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Add farm button
                    Center(
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
                            // Navigate to SuccessScreen on button click
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SuccessScreen()),
                            );
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
                            'إضافة المزرعة',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom app bar widget
  Widget _buildAppBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Container(
        height: 320,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF345E50), Color(0xFF49785E), Color(0xFFA8B475)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // Back button
            Positioned(
              top: 50,
              right: 15,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            // Title and description text
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 150.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'بيانات الفرصة الزراعية',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'يرجى ملء جميع التفاصيل المتعلقة بمزرعتك.',
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
    );
  }

  // Reusable text field builder with gradient underline
  Widget _buildTextField(TextEditingController controller, String labelText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(color: Color(0xFFA09E9E)),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        ),
        Container(
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
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
