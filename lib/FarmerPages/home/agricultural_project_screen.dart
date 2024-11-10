import 'package:flutter/material.dart';
import 'package:untitled1/FarmerPages/home/farmerHome.dart';
import 'package:untitled1/FarmerPages/home/projects_list.dart';
import 'package:untitled1/FarmerPages/profile/ProfilePage.dart';

class AgriculturalProjectScreen extends StatefulWidget {
  const AgriculturalProjectScreen({super.key});

  @override
  _AgriculturalProjectScreenState createState() =>
      _AgriculturalProjectScreenState();
}

class _AgriculturalProjectScreenState extends State<AgriculturalProjectScreen> {
  int _selectedTabIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAF9),
      body: Stack(
        children: [
          // Background Image with specific height to show full picture
          Container(
            height: 700, // Adjust as needed to fit the image well
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/projectDetail.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 770,
            child: Container(
              height: 56,
              color: const Color(0xFFF9FAF9),
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 220), // Add extra space below the image

                // Project Details without White Background Box
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title with gradient
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
                      ),

                      const SizedBox(height: 16),
                      // Add Farm Return Button aligned to the left and smaller
                      Row(
                        children: [
                          Container(
                            height: 36,
                            width: 160, // Make the button smaller
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
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, "/deposit-investment");
                              },
                              icon: const Icon(Icons.add,
                                  color: Colors.white, size: 20),
                              label: const Text(
                                'أضف عائد المزرعة',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                shadowColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Additional Content (e.g., information grid) goes here
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'الحساب الشخصي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.nature),
            label: 'المشاريع الزراعية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
        ],
        currentIndex: _selectedTabIndex,
        selectedItemColor: const Color(0xFF4B7960),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
          });

          // Handle navigation
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProjectList()),
            );
          } else if (index == 2) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const FarmerHomePage()),
              (route) => route.isFirst,
            );
          }
        },
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
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF4B7960),
              fontFamily: 'Markazi Text',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
