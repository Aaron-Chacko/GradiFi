import 'package:flutter/material.dart';
import 'package:gradifi/screens/profile_page.dart'; 
import 'package:gradifi/screens/home_page.dart'; 

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  int selectedIndex = -1;

  void _onNavTap(int index) {
    if (selectedIndex == index) return;

    setState(() {
      selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
        (route) => false,
      );
    } else if (index == 1) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const ProfilePage()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Color(0xFFCEFF02)),
        title: ShaderMask(
          shaderCallback:
              (bounds) => const LinearGradient(
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Reports',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: _buildMarksCard('11/50')
                ),

                SizedBox(width: 12), // spacing between cards
                Expanded(
                  flex: 6,
                  child: _buildCard(
                    'Marks split-up',
                    Icons.analytics,
                    Colors.grey[900]!,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20), // Space between the cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              color: Colors.grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Comments:',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFCEFF02),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Good student, but he is black, so I failed him.',
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const Spacer(),
        ],
      ),
      bottomNavigationBar: Container(
        //------------------------------------------------bottom nav bar------------------
        height: 65,
        margin: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
        decoration: BoxDecoration(
          color: const Color(0XFF1C1C1C),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _navItem(Icons.home, "Home", 0),
            _navItem(Icons.person, "Profile", 1),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    final isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => _onNavTap(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFFCEFF02) : Colors.white,
              size: 24,
              shadows:
                  isSelected
                      ? [
                        Shadow(
                          color: const Color(0xFFCEFF02).withOpacity(0.8),
                          blurRadius: 10,
                        ),
                      ]
                      : [],
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? const Color(0xFFCEFF02) : Colors.white,
                fontSize: 10,
                shadows:
                    isSelected
                        ? [
                          Shadow(
                            color: const Color(0xFFCEFF02).withOpacity(0.8),
                            blurRadius: 10,
                          ),
                        ]
                        : [],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, IconData icon, Color color) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: (MediaQuery.of(context).size.width - 60) / 2, // for side-by-side
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMarksCard(String marks) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        height: 150,
        child: Center(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              children: [
                TextSpan(text: marks.split('/')[0]),
                const TextSpan(text: '/'),
                TextSpan(
                  text: marks.split('/')[1],
                  style: const TextStyle(color: Color(0xFFCEFF02)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
