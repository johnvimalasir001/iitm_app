import 'package:flutter/material.dart';
import 'package:iitm_app/src/home/widgets/current_working_status_card.dart';
import 'package:iitm_app/src/home/widgets/custom_cards.dart';
import 'package:iitm_app/src/home/widgets/custom_text.dart';
import 'package:iitm_app/src/home/widgets/home_app_bar_widget.dart';
import 'package:iitm_app/src/home/widgets/recent_activity_card.dart';
import 'package:iitm_app/src/home/widgets/weather_card.dart';

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
                const WeatherCard(),
                const SizedBox(height: 15),
                const CurrentStatusCard(),
                const SizedBox(height: 15),
                const CustomText(inputText: "Commodities"),
                const SizedBox(height: 10),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: fieldName.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomCard(
                        cardName: fieldName[index],
                        imgPath: imgPath[index],
                      );
                    },
                  ),
                ),
                const CustomText(inputText: "சமீபத்திய நடவடிக்கை"),
                const SizedBox(height: 15),
                ListView.builder(
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
