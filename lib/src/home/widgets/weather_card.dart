import 'package:flutter/material.dart';
import 'package:iitm_app/src/weather/pages/weather.dart';

class WeatherCard extends StatefulWidget {
  // final String location;
  // final String date;
  // final String temperature;
  // final String humidity;
  // final String status;
  const WeatherCard({
    super.key,
    // required this.location,
    // required this.date,
    // required this.temperature,
    // required this.humidity,
    // required this.status,
  });

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  var tmp = 0x00B0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WeatherPage(),
            ));
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue.shade400,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "தமிழ்நாடு, 27 Nov 2023",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "28°C",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "ஈரப்பதம் 82%",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      "assets/img/cloudy.png",
                      height: 90,
                      width: 90,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Colors.white,
            ),
            const Text(
              "பூச்சிக்கொல்லி மருந்துகளை பயன்படுத்த இன்று நல்ல நாள்",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
