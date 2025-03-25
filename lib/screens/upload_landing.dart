import 'package:flutter/material.dart';

class UploadLandingPage extends StatefulWidget {
  const UploadLandingPage({super.key});

  @override
  _UploadLandingPageState createState() => _UploadLandingPageState();
}

class _UploadLandingPageState extends State<UploadLandingPage> {
  int selectedIndex = 1; // Default to "Upload"

  List<IconData> navIcons = [Icons.home, Icons.upload, Icons.person];

  List<String> navTitles = ["Home", "Upload", "Profile"];

  Widget _navBar() {
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
        children:
            navIcons.map((icon) {
              int index = navIcons.indexOf(icon);
              bool isSelected = selectedIndex == index;
              return Material(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: () {
                    if (index != selectedIndex) {
                      setState(() {
                        selectedIndex = index;
                      });

                      if (index == 1) {
                        // Already on "Upload", do nothing
                      } else if (index == 0) {
                        Navigator.pushNamed(context, "/home");
                      } else if (index == 2) {
                        Navigator.pushNamed(context, "/profile");
                      }
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
                          color:
                              isSelected
                                  ? const Color(0xFFCEFF02)
                                  : Colors.white,
                        ),
                      ),
                      Text(
                        navTitles[index],
                        style: TextStyle(
                          color:
                              isSelected
                                  ? const Color(0xFFCEFF02)
                                  : Colors.white,
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

              //--------------------------------------- Card  ----------------------------
              Card(
                color: Colors.grey[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: StatefulBuilder(
                  builder: (context, setState) {
                    String? selectedCountry;
                    List<String> countries = [
                      "USA",
                      "UK",
                      "India",
                      "Canada",
                      "Germany",
                      "France",
                      "Japan",
                      "China",
                      "Russia",
                      "Italy",
                    ];

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Country',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white70),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedCountry,
                                hint: const Text(
                                  "Select grading standard",
                                  style: TextStyle(color: Colors.white70),
                                ),
                                isExpanded: true,
                                dropdownColor: Colors.black,
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                items:
                                    countries.map((String country) {
                                      return DropdownMenuItem<String>(
                                        value: country,
                                        child: Text(
                                          country,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCountry = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              //--------------------------------------- "Get Started with Uploading" ----------------------------
              const Icon(Icons.cloud_upload, size: 100, color: Colors.white70),
              const SizedBox(height: 20),
              const Text(
                "Get Started with Uploading",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "Upload scanned answer sheets for automated grading.",
                style: TextStyle(fontSize: 16, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/uploadPrerequisite");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFCEFF02),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Upload Now",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _navBar(),
    );
  }
}
