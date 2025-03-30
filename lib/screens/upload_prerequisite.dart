import 'package:flutter/material.dart';
import 'package:gradifi/screens/upload_landing.dart';

class UploadPrerequisite extends StatefulWidget {
  const UploadPrerequisite({super.key});

  @override
  _UploadPrerequisiteState createState() => _UploadPrerequisiteState();
}

class _UploadPrerequisiteState extends State<UploadPrerequisite> {
  int selectedIndex = 0; // 0 for Home, 1 for Profile

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Color(0xFFCEFF02)),
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Upload Prerequisite Documents",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFCEFF02),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 65,
        margin: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
        decoration: BoxDecoration(
          color: const Color(0XFF1C1C1C),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _navItem(context, Icons.home, "Home", selectedIndex == 0, () {
              setState(() {
                selectedIndex = 0;
              });
            }),
            _navItem(context, Icons.person, "Profile", selectedIndex == 1, () {
              setState(() {
                selectedIndex = 1;
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget _navItem(BuildContext context, IconData icon, String label, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFFCEFF02) : Colors.white,
              size: 24,
              shadows: isSelected
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
                shadows: isSelected
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
}
