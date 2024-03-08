import 'package:flutter/material.dart';
import 'package:iitm_app/home/home.dart';
import 'package:iitm_app/profile/pages/profile_page.dart';
import 'package:iitm_app/weather/pages/weather.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  List<Widget> pages = <Widget>[
    const HomePage(),
    const WeatherPage(),
    const ProfilePage()
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.blue,
        ),
        useLegacyColorScheme: false,
        items: [
          BottomNavigationBarItem(
            icon: iconWidget(
              0,
              index,
              "assets/icons/home-100.png",
              "assets/icons/home-100-2.png",
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: iconWidget(1, index, "assets/icons/cloud-computing (1).png",
                "assets/icons/cloud-computing.png"),
            label: "Weather",
          ),
          BottomNavigationBarItem(
            icon: iconWidget(2, index, "assets/icons/user-outline.png",
                "assets/icons/user-filled.png"),
            label: "Profile",
          ),
        ],
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }

  CircleAvatar iconWidget(int defaultIndex, int currentIndex, String iconPath,
      String selectedIconPath) {
    return CircleAvatar(
      radius: 20,
      backgroundColor:
          currentIndex == defaultIndex ? Colors.blue : Colors.transparent,
      foregroundColor:
          currentIndex == defaultIndex ? Colors.white : Colors.grey,
      child: Center(
        child: Image.asset(
          currentIndex == defaultIndex ? selectedIconPath : iconPath,
          color: index == defaultIndex ? Colors.white : Colors.grey,
          height: 25,
          width: 25,
        ),
      ),
    );
  }
}
