import 'package:flutter/material.dart';
import 'package:untitled1/FarmerPages/home/projects_list.dart';
import 'package:untitled1/FarmerPages/profile/ProfilePage.dart';

class FarmerHomePage extends StatefulWidget {
  const FarmerHomePage({super.key});

  @override
  _FarmerHomePageState createState() => _FarmerHomePageState();
}

class _FarmerHomePageState extends State<FarmerHomePage> {
  int _selectedTabIndex = 2; // Stores selected tab index
  final PageController _pageController =
      PageController(); // Controls the page view
  int _currentPage = 0; // Tracks the current page in PageView

  @override
  void initState() {
    super.initState();
    // Adds a listener to update the current page index
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background white color
          Container(color: Colors.white),
          // Gradient background covering the top part of the screen
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.33,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF335D4F), Color(0xFFA8B475)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                // Centered logo images
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/Logo1.png',
                        height: 70,
                      ),
                      SizedBox(height: 8),
                      Image.asset(
                        'assets/images/Logo2.png',
                        height: 50,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Search bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.56,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(2, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.search, color: Colors.grey, size: 20),
                          hintText: 'ابحث',
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 42),
                // Overview of agricultural projects
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'نظرة عامة عن مشاريعك الزراعية',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF48742C),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 250,
                      height: 0.6,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Agricultural project details
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProjectDetailItem(
                      icon: Icons.check_circle,
                      title: '5 مشاريع زراعية',
                      value: 'المشاريع الزراعية \nالمكتملة الأستثمار',
                    ),
                    ProjectDetailItem(
                      icon: Icons.sync,
                      title: '10 مشاريع زراعية',
                      value: 'المشاريع الزراعية \nالمفتوحة للأستثمار',
                    ),
                    ProjectDetailItem(
                      icon: Icons.list,
                      title: '15 مشروع زراعي',
                      value: 'إجمالي المشاريع \nالزراعية المطروحة',
                    ),
                  ],
                ),
                const SizedBox(height: 17),
                // Latest news and events
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'آخر الاخبار والأحداث',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF48742C),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 150,
                      height: 0.6,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ],
                ),
                // Horizontal scrollable card with dots
                SizedBox(
                  height: 220,
                  child: PageView(
                    controller: _pageController,
                    children: [
                      buildFarmCard(
                        imageUrl: 'assets/images/farm1.png',
                        date: '23/03/1446',
                        text:
                            '"البيئة": المملكة تسجل رقمًا قياسًا بإنتاج 558 مليون كجم من لحوم الدواجن خلال النصف الأول 2024م',
                        additionalText: 'قراءة المزيد',
                      ),
                      buildFarmCard(
                        imageUrl: 'assets/images/farm1.png',
                        date: '24/03/1446',
                        text:
                            '"البيئة": المملكة تسجل رقمًا قياسًا بإنتاج 558 مليون كجم من لحوم الدواجن خلال النصف الأول 2024م',
                        additionalText: 'قراءة المزيد',
                      ),
                    ],
                  ),
                ),
                // Dots indicator for PageView
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(2, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? Colors.green
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Bottom navigation bar for navigation between pages
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green.shade800,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedTabIndex,
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
          });

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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'حسابي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.nature),
            label: 'مشاريعي الزراعية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
        ],
      ),
    );
  }

  // Farm card widget
  Widget buildFarmCard({
    required String imageUrl,
    required String date,
    required String text,
    required String additionalText,
  }) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFE5EAE3),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Color(0xFF89A06E),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  additionalText,
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF89A06E),
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF89A06E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom widget for displaying project detail items
class ProjectDetailItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProjectDetailItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 120,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: Colors.green.shade800),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
