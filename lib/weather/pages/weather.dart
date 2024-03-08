import 'package:flutter/material.dart';
import 'package:iitm_app/home/widgets/custom_text.dart';
import 'package:iitm_app/weather/pages/humidity.dart';
import 'package:iitm_app/weather/pages/soilmoisture.dart';
import 'package:iitm_app/weather/pages/temperature.dart';
import 'package:iitm_app/weather/widgets/app_bar.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage>
    with TickerProviderStateMixin {
  late TabController tabController;
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WeatherAppBar(),
              const Divider(
                thickness: 0.2,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomText(inputText: "Weather Report"),
              TabBar(
                padding: const EdgeInsets.all(10),
                labelColor: Colors.black,
                indicatorColor: Colors.blue,
                controller: tabController,
                tabs: const [
                  Tab(text: 'Temperature'),
                  Tab(
                    text: 'Soil Moisture',
                  ),
                  Tab(
                    text: 'Humidity',
                  ),
                ],
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
      ),
    );
  }
}
