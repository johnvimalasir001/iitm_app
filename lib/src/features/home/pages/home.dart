import 'package:flutter/material.dart';
import 'package:iitm_app/src/features/home/widgets/custom_text.dart';
import 'package:iitm_app/src/features/home/widgets/home_app_bar_widget.dart';
import 'package:iitm_app/src/features/home/widgets/recent_activity_card.dart';
import 'package:iitm_app/src/features/home/widgets/weather_card.dart';
import 'package:iitm_app/src/features/report/widgets/todaytask.dart';
import 'package:iitm_app/src/features/weather/pages/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> fieldName = ['வானிலை', 'நீரோட்டம்', 'வெப்பநிலை', 'ஈரப்பதம்'];
  List<String> imgPath = [
    "assets/img/cloudy.png",
    "assets/img/cloudy.png",
    "assets/img/cloudy.png",
    "assets/img/cloudy.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
                const SizedBox(height: 15),
                const CustomText(inputText: "இன்றைய வானிலை"),
                const SizedBox(height: 15),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WeatherPage(),
                          ));
                    },
                    child: const WeatherCard()),
                const SizedBox(height: 15),
                const CustomText(inputText: "இன்றைய டாஸ்க்"),
                const SizedBox(height: 12),
                const Todaytask(),
                const SizedBox(height: 12),
                const CustomText(inputText: "சமீபத்திய நடவடிக்கை"),
                const SizedBox(height: 10),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: RecentActivityCard(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
