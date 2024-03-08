import 'package:flutter/material.dart';

class NetworkSearch extends StatelessWidget {
  const NetworkSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const PhoneNumber(),
            //     ));
          },
          child: const Icon(
            Icons.arrow_back,
            size: 25,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Network detection',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
              top: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detecting sensor',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                Text(
                  'Network Near You.....',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    'This may take upto 5 minutes',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 38),
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://i.pinimg.com/originals/0e/a8/53/0ea853f400f474babbce8622499aa0b2.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
        ],
      )),
    );
  }
}
