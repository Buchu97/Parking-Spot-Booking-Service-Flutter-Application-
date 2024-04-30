import 'package:flutter/material.dart';
import 'package:mvp_mq/service_button.dart';

class SelectCampus extends StatelessWidget {
  const SelectCampus({super.key, required this.enterDetails});
  final void Function() enterDetails;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:
            Colors.pink[100], // Background color of the entire screen
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Colors.white), // Back button in AppBar
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.pink,
          elevation: 0, // Removes shadow under the AppBar
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Select a campus from below to proceed',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white), // Style for the instruction text
                textAlign: TextAlign.center,
              ),
            ),
            ServiceButton(
                text: 'Wallumattagal Campus\nMacquarie Park',
                selectCampus: enterDetails),
            ServiceButton(
                text: 'Macquarie City Campus\nSydney, Australia',
                selectCampus: () {}),
          ],
        ),
      ),
    );
  }
}
