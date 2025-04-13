import 'package:flutter/material.dart';
import 'package:gradifi/screens/upload_landing.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<IconData> navIcons = [
  Icons.home_filled,
  Icons.cloud_upload_outlined,
  Icons.person_outline,
];

List<String> navTitles = ["Home", "Upload", "Profile"];
int selectedIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Colors.white, Color(0xFFCEFF02)],
                begin: Alignment(0.2, 0.0),
                end: Alignment(1.0, 0.0),
              ).createShader(bounds),
              child: const Text(
                'GradiFi',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              //---------------------------------------card one----------------------------
              color: Colors.grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExpandedInsightsPage(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Insights',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white70,
                            size: 20,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        '''Total Strength: 69
Absentees: 2
Total Failures: 12
Pass Percentage: 84.2%''',
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  'Files Uploaded',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFCEFF02),
                  ),
                  child: const Text(
                    "Add Files",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                //----------------------------------second card----------------------------------------
                color: Colors.grey[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'List',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('''Syllabus.pdf
Unit Content.pdf
Question Paper.pdf
Answer Key.pdf''', style: TextStyle(fontSize: 16, color: Colors.white70)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Align(alignment: Alignment.bottomCenter, child: _navBar()),
        ],
      ),
    );
  }

  Widget _navBar() {
    //----------------------------------------bottom nav bar--------------------------------
    return Container(
      height: 65,
      margin: EdgeInsets.only(right: 24, left: 24, bottom: 24),
      decoration: BoxDecoration(
        color: Color(0XFF1C1C1C),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: navIcons.map((icon) {
          int index = navIcons.indexOf(icon);
          bool isSelected = selectedIndex == index;
          return Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });

                if (index == 1) {
                  // "Upload" button tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UploadLandingPage(
                        documentType: 'Your Document Type', // Update this with your document type
                      ),
                    ),
                  );
                }
              },
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: 15,
                      bottom: 0,
                      left: 35,
                      right: 35,
                    ),
                    child: Icon(
                      icon,
                      color: isSelected ? Color(0xFFCEFF02) : Colors.white,
                    ),
                  ),
                  Text(
                    navTitles[index],
                    style: TextStyle(
                      color: isSelected ? Color(0xFFCEFF02) : Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ExpandedInsightsPage extends StatelessWidget {
  const ExpandedInsightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Insights',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Detailed insights will be shown here.',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
