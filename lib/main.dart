// font followed throughout the app: gradifi heading--28, heading2-- 22, subheading--20, button text--18, hint text--16

import 'package:flutter/material.dart';
import 'package:gradifi/screens/home_page.dart';
import 'package:gradifi/screens/profile_page.dart';
import 'package:gradifi/screens/upload_answer.dart';
import 'package:gradifi/screens/upload_prerequisite.dart'; // Import your new screen
import 'package:gradifi/screens/reports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GradiFi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
      routes: {
        "/upload_prerequisite": (context) => const UploadPrerequisite(),
        "/upload_answer": (context) => const UploadAnswer(),
        "/reports": (context) => const Reports(),
        "/home": (context) => const HomePage(),
        "/profile": (context) => const ProfilePage(),
      },
    );
  }
}
