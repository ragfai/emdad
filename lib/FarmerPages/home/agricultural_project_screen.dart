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
  int _selectedBottomTabIndex =
      1; // Default selected tab (Agricultural Projects)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9F8),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FarmDetails(
                imageUrl:
                    'assets/images/farm1.png'), // Placeholder for farm image
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(), // Bottom navigation bar
    );
  }

  // Bottom navigation bar with three tabs
  BottomNavigationBar _buildBottomNavigation() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
        BottomNavigationBarItem(
            icon: Icon(Icons.nature), label: 'المشاريع الزراعية'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
      ],
      currentIndex: _selectedBottomTabIndex,
      selectedItemColor: const Color(0xFF4B7960),
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        if (index == 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfilePage()));
        } else if (index == 1) {
          setState(() => _selectedBottomTabIndex = index);
        } else if (index == 2) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const FarmerHomePage()),
            (route) => route.isFirst,
          );
        }
      },
    );
  }
}

class FarmDetails extends StatelessWidget {
  final String imageUrl;

  const FarmDetails({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // Background farm image
        Image.asset(
          imageUrl,
          width: double.infinity,
          height: screenHeight * 0.3,
          fit: BoxFit.cover,
        ),
        // Semi-transparent overlay
        Container(
          width: double.infinity,
          height: screenHeight * 0.3,
          color: Colors.black.withOpacity(0.1),
        ),
        // Back button at the top right corner
        Positioned(
          top: 50,
          right: 10,
          child: IconButton(
            icon:
                const Icon(Icons.arrow_forward, color: Colors.white, size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        // Farm details container positioned below the image
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 270.0),
          child: _buildDetailsContainer(context),
        ),
      ],
    );
  }

  // Container displaying project details and funding information
  Widget _buildDetailsContainer(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(screenWidth), // Header with project title and location
          const SizedBox(height: 10),
          _buildProjectDetailsGrid(), // Grid with project-specific details
          const SizedBox(height: 10),
          _buildFundingInformation(screenWidth), // Funding progress information
        ],
      ),
    );
  }

  // Header showing project title and location
  Widget _buildHeader(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end, // Align text to the right
      children: [
        _buildProjectTitle(screenWidth),
      ],
    );
  }

  // Project title and location
  Widget _buildProjectTitle(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'مشروع زراعة الطماطم', // Project title
          style: TextStyle(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.bold,
            color: Color(0xFF345E50),
          ),
          textAlign: TextAlign.right,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_on,
                size: 16, color: Color.fromARGB(255, 160, 165, 160)),
            const SizedBox(width: 2),
            Text(
              'المملكة العربية السعودية، ساجر',
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                color: Colors.grey,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ],
    );
  }

  // Grid displaying project-specific details
  Widget _buildProjectDetailsGrid() {
    return SizedBox(
      height: 280,
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 1.0,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: const [
          ProjectDetailItem(
              icon: Icons.timer, title: 'نوع الفرصة', value: 'قصيرة الأجل'),
          ProjectDetailItem(
              icon: Icons.calendar_today,
              title: 'تاريخ البداية',
              value: '2024-11'),
          ProjectDetailItem(
              icon: Icons.grain, title: 'نوع المحصول', value: 'الطماطم'),
          ProjectDetailItem(
              icon: Icons.production_quantity_limits,
              title: 'معدل الإنتاج',
              value: '5000 كجم'),
          ProjectDetailItem(
              icon: Icons.attach_money,
              title: 'سعر الوحدة',
              value: '1,000.00 ر.س'),
          ProjectDetailItem(
              icon: Icons.bar_chart, title: 'هامش الربح السنوي', value: '16%'),
        ],
      ),
    );
  }

  // Funding information with a progress bar
  Widget _buildFundingInformation(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'نسبة التمويل',
          style: TextStyle(
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF5B8263),
          ),
        ),
        const SizedBox(height: 8),
        // Progress bar showing funding percentage
        Container(
          height: 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                LinearProgressIndicator(
                  value: 0.8,
                  minHeight: 10,
                  backgroundColor: Colors.transparent,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Colors.transparent),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF335D4F), Color(0xFFA8B475)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '(مقدار التمويل الذي تم جمعه مقارنة بالهدف الإجمالي للمشروع)',
          style: TextStyle(fontSize: screenWidth * 0.035, color: Colors.grey),
        ),
      ],
    );
  }
}

// Widget for displaying individual project details in the grid
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
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12.0),
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: const Color.fromARGB(255, 131, 176, 134)),
          const SizedBox(height: 0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Color.fromARGB(255, 57, 98, 32),
            ),
          ),
          const SizedBox(height: 1),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 54, 88, 15),
            ),
          ),
        ],
      ),
    );
  }
}
