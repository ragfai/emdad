import 'package:flutter/material.dart';
import 'package:untitled1/FarmerPages/home/projects_list.dart';
import 'package:untitled1/FarmerPages/profile/ProfilePage.dart';

class FarmerHomePage extends StatefulWidget {
  const FarmerHomePage({super.key});

  @override
  _FarmerHomePageState createState() => _FarmerHomePageState();
}

class _FarmerHomePageState extends State<FarmerHomePage> {
  int _selectedTabIndex = 2;
  int _currentPage = 0;
  final PageController _pageController = PageController();

  // Sample images (replace with your actual images)
  final List<String> _imagePaths = [
    'assets/images/homenews1.png',
    'assets/images/homenews2.png',
    'assets/images/homenews3.png',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAF9),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/farmerBG.png',
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
          Positioned.fill(
            child: Column(
              children: [
                const Spacer(),
                const SizedBox(height: 550),
                // News Carousel
                SizedBox(
                  height: 210,
                  width: 400,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _imagePaths.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        padding: const EdgeInsets.all(
                            16), // Add padding to make images smaller
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          // Background color behind image
                        ),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(30), // Match corner radius
                          child: Image.asset(
                            _imagePaths[index],
                            fit: BoxFit
                                .contain, // Make image smaller within padding
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                // Page Indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_imagePaths.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? Colors.green
                            : Colors.grey[400],
                      ),
                    );
                  }),
                ),
                const Spacer(),
              ],
            ),
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
        currentIndex: _selectedTabIndex,
        selectedItemColor: const Color(0xFF4B7960),
        unselectedItemColor: Colors.grey,
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
      ),
    );
  }
}
