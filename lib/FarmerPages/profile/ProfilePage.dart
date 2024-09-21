import 'package:flutter/material.dart';
import 'package:untitled1/FarmerPages/home/projects_list.dart';
import 'package:untitled1/FarmerPages/profile/CustomerServiceScreen.dart';
import 'package:untitled1/FarmerPages/profile/FAQscreen.dart';
import 'package:untitled1/FarmerPages/profile/LanguageChangeScreen.dart';
import 'package:untitled1/FarmerPages/profile/TermsScreen.dart';
import 'package:untitled1/FarmerPages/profile/InfoScreen.dart';
import 'package:untitled1/StartPages/welcome.dart'; // Ensure InfoScreen is imported

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedTabIndex = 0; // Default to 'الحساب الشخصي' tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Colors.green.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Image and Name
            const Center(
              child: Column(
                children: [
                  Icon(Icons.account_circle, size: 80, color: Colors.green),
                  Text(
                    "محمد عبدالله",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // List of Options
            buildSettingsItem(context, "تغيير اللغة", Icons.language,
                const LanguageChangeScreen()),
            buildSettingsItem(context, "تواصل معنا", Icons.contact_support,
                const CustomerServiceScreen()),
            buildSettingsItem(
                context, "الأسئلة الشائعة", Icons.security, const FAQscreen()),
            buildSettingsItem(
                context, "الشروط والأحكام", Icons.rule, const TermsScreen()),
            buildSettingsItem(
                context, "عن إمداد", Icons.info, const InfoScreen()),
            buildSettingsItem(context, "حذف الحساب", Icons.delete,
                const Welcome()), // Placeholder for delete account

            const Spacer(),
            // Logout Button
            ElevatedButton(
              onPressed: () {
                // Implement your logout logic here
                // For example, navigate to the login page or clear user data
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade800,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              child: const Text("تسجيل الخروج"),
            ),
          ],
        ),
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
            // Navigate to Profile Screen when 'الحساب الشخصي' is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProjectList()),
            );
          } else {
            setState(() {
              _selectedTabIndex = index;
            });
            // Handle navigation for the other tabs
            // Add appropriate navigation logic for each tab
          }
        },
      ),
    );
  }

  Widget buildSettingsItem(
      BuildContext context, String title, IconData icon, Widget nextPage) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title, style: const TextStyle(fontSize: 18)),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.green),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => nextPage));
      },
    );
  }
}
