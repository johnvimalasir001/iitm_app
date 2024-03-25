import 'package:flutter/material.dart';
import 'package:iitm_app/src/features/home/widgets/custom_text.dart';
import 'package:iitm_app/src/features/weather/controller/weather_controller.dart';
import 'package:iitm_app/src/features/weather/pages/humidity.dart';
import 'package:iitm_app/src/features/weather/pages/soilmoisture.dart';
import 'package:iitm_app/src/features/weather/pages/temperature.dart';
import 'package:iitm_app/src/features/weather/widgets/app_bar.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  final WeatherController weatherController = WeatherController();
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: WeatherAppBar(),
            ),
            const Divider(
              thickness: 0.2,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: CustomText(inputText: "வானிலை அறிக்கை"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TabBar(
                padding: const EdgeInsets.all(10),
                labelColor: Colors.black,
                indicatorColor: Colors.blue,
                controller: tabController,
                tabs: const [
                  Tab(text: 'தட்பவெப்ப நிலை'),
                  Tab(
                    text: 'மண்ணின் ஈரப்பதம்',
                  ),
                  Tab(
                    text: 'ஈரம்',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  Temperature(),
                  SoilMoisture(),
                  Humidity(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
