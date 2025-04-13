import 'package:flutter/material.dart';
import 'package:gradifi/screens/upload_landing.dart';
import 'package:gradifi/screens/home_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Profile Content Goes Here',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 30),
          // Add other content here as needed...
          const Spacer(),
          Align(alignment: Alignment.bottomCenter, child: _navBar(context)),
        ],
      ),
    );
  }

  Widget _navBar(BuildContext context) {
    return Container(
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
          _navItem(context, Icons.home_filled, 'Home', 0),
          _navItem(context, Icons.cloud_upload_outlined, 'Upload', 1),
          _navItem(context, Icons.person_outline, 'Profile', 2),
        ],
      ),
    );
  }

  Widget _navItem(BuildContext context, IconData icon, String title, int index) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UploadLandingPage(
                  documentType: 'Your Document Type',
                ),
              ),
            );
          } else if (index == 2) {
            Navigator.pushNamed(context, '/profile');
          }
        },
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                top: 15,
                bottom: 0,
                left: 35,
                right: 35,
              ),
              child: Icon(
                icon,
                color: index == 2 ? const Color(0xFFCEFF02) : Colors.white,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: index == 2 ? const Color(0xFFCEFF02) : Colors.white,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
