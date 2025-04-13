import 'package:flutter/material.dart';
import 'package:gradifi/screens/reports.dart';

class UploadAnswer extends StatefulWidget {
  const UploadAnswer({super.key});

  @override
  _UploadAnswerState createState() => _UploadAnswerState();
}

class _UploadAnswerState extends State<UploadAnswer> {
  // This screen is for uploading answer sheets
  int selectedIndex = 0;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Upload Answer Sheet",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFCEFF02),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Column(
                children: [
                  _uploadCard(Icons.camera_alt, "Open Camera", () {
                    // TODO
                  }),
                  const SizedBox(height: 32),
                  _uploadCard(Icons.folder_open, "Browse Device", () {
                    // TODO
                  }),
                ],
              ),
              const SizedBox(height: 50), // Add space between cards and button
              ElevatedButton(//------------------------------------------------------button--------------------------------------
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Reports(), // Navigate to the reports screen
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFCEFF02), // Button color
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Calculate marks",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
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

  Widget _uploadCard(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: AnimatedScale(
        scale: 1.05,
        duration: const Duration(milliseconds: 100),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF1C1C1C), Color(0xFF444444)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
                spreadRadius: 1,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: const Color(0xFFCEFF02), size: 56),
              const SizedBox(height: 18),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(
    BuildContext context,
    IconData icon,
    String label,
    bool isSelected,
    VoidCallback onTap,
  ) {
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
}
