import 'package:flutter/material.dart';
import 'package:untitled1/FarmerPages/home/projects_list.dart';
import 'package:untitled1/FarmerPages/profile/CustomerServiceScreen.dart';
import 'package:untitled1/FarmerPages/profile/FAQscreen.dart';
import 'package:untitled1/FarmerPages/profile/TermsScreen.dart';
import 'package:untitled1/FarmerPages/profile/InfoScreen.dart';
import 'package:untitled1/StartPages/welcome.dart';

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
      backgroundColor: const Color(0xFFF9FAF9),
      body: Stack(
        children: [
          // Linear gradient background at the top
          Container(
            height: 200, // Adjust height as needed
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
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                // Profile Image and Name in Center
                const Center(
                  child: Column(
                    children: [
                      Icon(Icons.account_circle,
                          size: 80,
                          color: Colors.white), // Changed icon to white
                      SizedBox(height: 8),
                      Text(
                        "محمد عبدالله",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Markazi Text',
                          color: Colors
                              .white, // Changed text color to white for visibility
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                // Rounded Container for Profile Settings
                Container(
                  padding: const EdgeInsets.all(16.0),
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
                      buildSettingsItem(
                        context,
                        "تغيير اللغة",
                        Icons.language,
                        () => _showLanguageChangeDialog(context), // Open dialog
                      ),
                      buildSettingsItem(
                        context,
                        "تواصل معنا",
                        Icons.contact_support,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CustomerServiceScreen()),
                        ),
                      ),
                      buildSettingsItem(
                        context,
                        "الأسئلة الشائعة",
                        Icons.security,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FAQscreen()),
                        ),
                      ),
                      buildSettingsItem(
                        context,
                        "الشروط والأحكام",
                        Icons.rule,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TermsScreen()),
                        ),
                      ),
                      buildSettingsItem(
                        context,
                        "عن إمداد",
                        Icons.info,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InfoScreen()),
                        ),
                      ),
                      buildSettingsItem(
                        context,
                        "حذف الحساب",
                        Icons.delete,
                        () => _showDeleteAccountConfirmationDialog(
                            context), // Show delete confirmation
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Gradient Logout Button
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF4B7960),
                        Color(0xFF728F66),
                        Color(0xFFA2AA6D),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ElevatedButton(
                    onPressed: () => _showLogoutConfirmationDialog(context),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Text(
                      "تسجيل الخروج",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Markazi Text',
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          } else if (index == 1) {
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

  // Function to build each settings item
  Widget buildSettingsItem(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
      leading: Icon(icon, color: const Color(0xFF4B7960)),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: Color(0xFF4B7960),
          fontFamily: 'Markazi Text',
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF4B7960)),
      onTap: onTap,
    );
  }

  // Function to show Language Change Dialog
  void _showLanguageChangeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "تغيير اللغة",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4B7960),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text("العربية", style: TextStyle(fontSize: 18)),
                  onTap: () {
                    // Switch to Arabic logic
                    Navigator.of(context).pop();
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text("English", style: TextStyle(fontSize: 18)),
                  onTap: () {
                    // Switch to English logic
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Function to show Logout Confirmation Dialog
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "هل أنت متأكد من تسجيل الخروج؟",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4B7960),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Cancel button
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF4B7960),
                              Color(0xFF728F66),
                              Color(0xFFA2AA6D),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close dialog
                          },
                          child: const Text(
                            "الرجوع",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Confirm logout button
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF4B7960),
                              Color(0xFF728F66),
                              Color(0xFFA2AA6D),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close dialog
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Welcome()),
                              (route) => false,
                            ); // Navigate to Welcome screen
                          },
                          child: const Text(
                            "تسجيل الخروج",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Function to show Delete Account Confirmation Dialog
  void _showDeleteAccountConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "هل أنت متأكد من حذف الحساب؟",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4B7960),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Cancel button
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF4B7960),
                              Color(0xFF728F66),
                              Color(0xFFA2AA6D),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close dialog
                          },
                          child: const Text(
                            "الرجوع",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Confirm delete account button
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF4B7960),
                              Color(0xFF728F66),
                              Color(0xFFA2AA6D),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close dialog
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Welcome()),
                              (route) => false,
                            ); // Navigate to Welcome screen
                          },
                          child: const Text(
                            "حذف الحساب",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
