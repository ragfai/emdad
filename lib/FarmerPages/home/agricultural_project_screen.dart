import 'package:flutter/material.dart';

class AgriculturalProjectScreen extends StatelessWidget {
  const AgriculturalProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'تفاصيل الفرصة الزراعية',
          style: TextStyle(color: Colors.green, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Container
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/tomato_farm.jpg'), // Replace with your asset image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Project Details Container
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'مشروع زراعة الطماطم',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.green),
                          const SizedBox(width: 4),
                          Text(
                            'المملكة العربية السعودية، سايجر',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Add Return Button
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, "/deposit-investment");
                          },
                          icon: const Icon(Icons.add, color: Colors.white),
                          label: const Text('أضف عائد المزرعة'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Information Grid
                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        children: [
                          _buildInfoTile('مدة الفرصة', 'قصيرة الأجل'),
                          _buildInfoTile('المساحة الكلية', '100م²'),
                          _buildInfoTile('نوع المحصول', 'الطماطم'),
                          _buildInfoTile('نسبة الاستثمار', '10%'),
                          _buildInfoTile('نوع الإدارة', 'ملكية خاصة'),
                          _buildInfoTile('معدل الإنتاج', '5000kg'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Progress Bar for Funding Rate
                      const Text(
                        'نسبة التمويل',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: 0.8,
                        backgroundColor: Colors.grey[200],
                        color: Colors.green,
                        minHeight: 8,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '80%',
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.agriculture),
            label: 'المشاريع الزراعية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'الملف الشخصي',
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  // Helper function to build the tiles in the grid view
  Widget _buildInfoTile(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.green[700]),
          ),
          const SizedBox(height: 4),
          Text(subtitle, style: TextStyle(color: Colors.grey[700])),
        ],
      ),
    );
  }
}
