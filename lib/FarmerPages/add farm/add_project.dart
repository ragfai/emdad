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
      appBar: AppBar(
        title: const Text('بيانات الفرصة الزراعية'),
        backgroundColor: Colors.green.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'يرجى ملء جميع التفاصيل المتعلقة بمزرعتك',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              _buildTextField(projectNameController, 'اسم المشروع'),
              const SizedBox(height: 10),
              _buildTextField(regionController, 'المنطقة'),
              const SizedBox(height: 10),
              _buildTextField(addressController, 'العنوان'),
              const SizedBox(height: 10),
              _buildTextField(cropTypeController, 'نوع المحصول'),
              const SizedBox(height: 10),
              _buildTextField(
                  totalAreaController, 'المساحة الكلية (بالأمتار أو الهكتار)'),
              const SizedBox(height: 10),
              _buildTextField(opportunityDurationController, 'مدة الفرصة'),
              const SizedBox(height: 10),
              _buildTextField(productionRateController, 'معدل الإنتاج'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SuccessScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('إضافة المزرعة'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build text fields
  Widget _buildTextField(TextEditingController controller, String labelText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
