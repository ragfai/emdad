import 'package:flutter/material.dart';
import 'package:untitled1/FarmerPages/add%20farm/add_project.dart';
import 'package:untitled1/FarmerPages/home/agricultural_project_screen.dart';
import 'package:untitled1/FarmerPages/profile/ProfilePage.dart';
import 'package:untitled1/FarmerPages/profile/TermsScreen.dart';
import 'package:untitled1/StartPages/signup.dart'; // Import ProfileScreen

class ProjectList extends StatefulWidget {
  const ProjectList({super.key});

  @override
  _AgriculturalProjectsPageState createState() =>
      _AgriculturalProjectsPageState();
}

class _AgriculturalProjectsPageState extends State<ProjectList> {
  int _selectedTabIndex = 1; // Default to 'المشاريع الزراعية' tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("المشاريع الزراعية"),
        backgroundColor: Colors.green.shade800,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            color: Colors.green.shade100,
            child: Column(
              children: [
                const Text(
                  'يمكنك هنا متابعة حالة كل مشروع...',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _buildTabButton(0, "مكتملة"),
                    const SizedBox(width: 8),
                    _buildTabButton(1, "تحت المعالجة"),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: _selectedTabIndex == 0
                ? _buildCompletedProjects()
                : _buildProcessingProjects(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'الحساب الشخصي'),
          BottomNavigationBarItem(
              icon: Icon(Icons.nature), label: 'المشاريع الزراعية'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
        ],
        currentIndex: _selectedTabIndex,
        selectedItemColor: Colors.green,
        onTap: (index) {
          if (index == 0) {
            // Navigate to Profile Screen when 'الحساب الشخصي' is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProjectList()),
            );
          } else {
            setState(() {
              _selectedTabIndex = index;
            });
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
            _selectedTabIndex = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: _selectedTabIndex == index ? Colors.green : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: _selectedTabIndex == index ? Colors.white : Colors.black,
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
            itemCount: 4, // Example count, you can replace it with dynamic data
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
                child: Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Image.network(
                        "https://via.placeholder.com/100"), // Placeholder image
                    title: const Text('مشروع زراعة الطماطم'),
                    subtitle: const Text('المزيد...'),
                    trailing: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('100%'),
                        SizedBox(height: 5),
                        Text('ساجر'),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        // Add Project button for Completed Projects
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddProject()),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text("أضف مشروع"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
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
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
        // Add Project button for Processing Projects
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddProject()),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text("أضف مشروع"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}
