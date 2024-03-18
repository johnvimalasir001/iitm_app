import 'package:flutter/material.dart';

class Days extends StatelessWidget {
  const Days({
    super.key,
    required this.time,
  });
  final String time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 2,
        right: 2,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 40,
          width: 68,
          decoration: const BoxDecoration(

              // color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Text(
              time,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45),
            ),
          ),
        ),
      ),
    );
  }
}
