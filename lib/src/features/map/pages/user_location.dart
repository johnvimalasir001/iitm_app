import 'package:flutter/material.dart';
import 'package:iitm_app/src/features/map/widgets/map.dart';
import 'package:iitm_app/src/features/map/widgets/map_below.dart';

class UserLocationpage extends StatefulWidget {
  const UserLocationpage({super.key});

  @override
  State<UserLocationpage> createState() => _UserLocationpageState();
}

class _UserLocationpageState extends State<UserLocationpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("User Location"),
      ),
      body: const Stack(
        alignment: Alignment.center,
        children: [
          MapPage(),
          MapBelow(),
        ],
      ),
    );
  }
}
