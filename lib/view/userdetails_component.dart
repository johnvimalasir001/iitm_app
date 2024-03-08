import 'package:flutter/material.dart';

class UserdetailsComponent extends StatelessWidget {
  const UserdetailsComponent(
      {super.key,
      required this.names,
      required this.icons,
      required this.hintText});

  final String names, hintText;
  final icons;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            names,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: TextField(
            decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: Icon(
                  icons,
                  color: Colors.blue,
                ),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),
        ),
      ],
    );
  }
}
