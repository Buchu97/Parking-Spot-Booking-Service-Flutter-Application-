// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mvp_mq/Data/sqflite_database.dart';
import 'package:mvp_mq/parking_pass.dart';
import 'package:mvp_mq/service_button.dart';
// import 'package:mvp_mq/mq_app.dart';

class EnterDetails extends StatefulWidget {
  const EnterDetails({super.key});
  // final void Function() parkingPass;
  // Future<int> key;

  @override
  State<EnterDetails> createState() {
    return _EnterDetails();
  }
}

class _EnterDetails extends State<EnterDetails> {
  final _locationTextController = TextEditingController();
  final _startTimeTextController = TextEditingController();
  final _durationTextController = TextEditingController();
  final _vehicleNumTextController = TextEditingController();

  @override
  void dispose() {
    _locationTextController.dispose();
    _durationTextController.dispose();
    _vehicleNumTextController.dispose();
    _startTimeTextController.dispose();
    super.dispose();
  }

  void insertDataAndRetrieveId() async {
    Map<String, dynamic> parkingPassData = {
      'campusLocation': 'Wallumattagal Campus Macquarie Park',
      'parkingLocation': _locationTextController.text,
      'parkingSpotNo': 'A10',
      'numberPlate': _vehicleNumTextController.text,
      'startTime': _startTimeTextController.text,
      'duration': _durationTextController.text,
      'amountPaid': 50.00,
      'date': DateTime.now().toString()
    };

    int id = await DatabaseHelper.instance.insertParkingPass(parkingPassData);
    print(id);

    if (!mounted) return;

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ParkingPass(id: id)));
  }

  @override
  Widget build(context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.pink,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Enter Parking Location',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _locationTextController,
                  // style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Carpark - P South 2',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 191, 188, 188)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const Text(
                  'Enter Start Time',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _startTimeTextController,
                  // style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '10 AM',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 191, 188, 188)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Enter Duration(In Hours)',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _durationTextController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '2',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 191, 188, 188)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Enter Vehicle Number Plate',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _vehicleNumTextController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'ABC 6251 ALIA',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 191, 188, 188)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ServiceButton(
                    text: "Continue", nextPage: insertDataAndRetrieveId),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
