import 'package:flutter/material.dart';
import 'package:untitled1/FarmerPages/add%20farm/add_project.dart';
import 'package:untitled1/FarmerPages/home/agricultural_project_screen.dart';
import 'package:untitled1/FarmerPages/home/farmerHome.dart';
import 'package:untitled1/FarmerPages/profile/ProfilePage.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({super.key});

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  int _selectedTopTabIndex = 1; // Default to "تحت المعالجة"
  int _selectedBottomTabIndex = 1; // Default to 'المشاريع الزراعية' tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAF9),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/projectsBG.png',
              fit: BoxFit.cover,
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
          Column(
            children: [
              // Info box and tab buttons without extra padding at the top
              Container(
                padding: const EdgeInsets.only(top: 180, left: 16, right: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildTabButton(0, "مكتملة"),
                        const SizedBox(height: 6, width: 10),
                        _buildTabButton(1, "تحت المعالجة"),
                      ],
                    ),
                  ],
                ),
              ),
              // Display selected tab content
              Expanded(
                child: _selectedTopTabIndex == 0
                    ? _buildCompletedProjects()
                    : _buildProcessingProjects(),
              ),
            ],
          ),
        ],
      ),
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
        currentIndex: _selectedBottomTabIndex,
        selectedItemColor: const Color(0xFF4B7960),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            // Navigate to Profile Page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          } else if (index == 1) {
            // Navigate to Project List (current page)
            setState(() {
              _selectedBottomTabIndex = index;
            });
          } else if (index == 2) {
            // Navigate to Home Page
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

  Widget _buildTabButton(int index, String title) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTopTabIndex = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: _selectedTopTabIndex == index
                ? const LinearGradient(
                    colors: [
                      Color(0xFF4B7960),
                      Color(0xFF728F66),
                      Color(0xFFA2AA6D)
                    ],
                  )
                : null,
            color: _selectedTopTabIndex == index ? null : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF4B7960),
              width: 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: _selectedTopTabIndex == index
                    ? Colors.white
                    : const Color(0xFF4B7960),
                fontWeight: FontWeight.bold,
                fontFamily: 'Markazi Text',
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompletedProjects() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 4, // Example count, replace with actual data
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AgriculturalProjectScreen()),
                    );
                  }
                },
                child: const Card(
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  child: ListTile(
                    title: Text('مشروع زراعة الطماطم',
                        style: TextStyle(fontFamily: 'Markazi Text')),
                    subtitle: Text('المزيد...',
                        style: TextStyle(fontFamily: 'Markazi Text')),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('100%',
                            style: TextStyle(color: Color(0xFF4B7960))),
                        SizedBox(height: 5),
                        Text('ساجر', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        // Add Project button with gradient
        Padding(
          padding: const EdgeInsets.all(100.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF4B7960),
                  Color(0xFF728F66),
                  Color(0xFFA2AA6D)
                ],
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddProject()),
                );
              },
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text(
                "أضف مشروع",
                style: TextStyle(
                    fontFamily: 'Markazi Text',
                    fontSize: 16,
                    color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 2, horizontal: 10), //size of it
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProcessingProjects() {
    return Column(
      children: [
        const Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "لا يوجد لديك أي مشروع زراعي",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontFamily: 'Markazi Text'),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
        // Add Project button for Processing Projects with gradient
        Padding(
          padding: const EdgeInsets.all(100.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF4B7960),
                  Color(0xFF728F66),
                  Color(0xFFA2AA6D)
                ],
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddProject()),
                );
              },
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text(
                "أضف مشروع",
                style: TextStyle(
                    fontFamily: 'Markazi Text',
                    fontSize: 16,
                    color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
