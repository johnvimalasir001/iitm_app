import 'package:flutter/material.dart';

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
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
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
                height: 110,
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
                      height: 8,
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
                      height: 8,
                    ),
                    Text(
                      "ஈரப்பதம் 82%",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  "assets/img/cloudy.png",
                  height: 100,
                  width: 100,
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
    );
  }
}
