import 'package:flutter/material.dart';

class MyDropdown extends StatefulWidget {
  const MyDropdown({super.key});

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String selectedUnit = 'data'; // Initial value for the selected unit

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              selectedUnit,
            ), // Display the currently selected unit
            PopupMenuButton<String>(
              splashRadius: 1,
              icon: const Icon(Icons.keyboard_arrow_down),
              onSelected: (String item) {
                setState(() {
                  selectedUnit = item; // Update the selected unit state
                });
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  value: "Cent",
                  child: Text("Cent"),
                ),
                const PopupMenuItem(
                  value: "Sqft",
                  child: Text("Sqft"),
                ),
                const PopupMenuItem(
                  value: "acre",
                  child: Text("Acre"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
