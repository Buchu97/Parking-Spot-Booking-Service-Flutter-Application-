import 'package:flutter/material.dart';
import 'package:mvp_mq/Data/sqflite_database.dart';

class Confirmation extends StatelessWidget{
  const Confirmation({super.key, required this.id});
  final int id;
   
Future<Text> getUpdatedDuration() async {
  final Map<String, dynamic>? updatedPass = await DatabaseHelper.instance.getParkingPassById(id);
  if (updatedPass != null) {
    return Text("Updated Duration: ${updatedPass['duration']}");
  } else {
    return const Text("No updated duration found.");
  }
}

@override
Widget build(BuildContext context) {
  return FutureBuilder<Text>(
    future: getUpdatedDuration(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        return snapshot.data ?? const Text('No data available');
      }
    },
  );
}

}