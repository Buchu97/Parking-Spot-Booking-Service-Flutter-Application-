import 'package:flutter/material.dart';
import 'package:mvp_mq/Data/sqflite_database.dart';

import 'package:mvp_mq/service_button.dart';

class Extension extends StatefulWidget {
  const Extension({super.key, required this.id});
  final int id;

  @override
  State<Extension> createState() {
    return _ExtensionState();
  }
}

class _ExtensionState extends State<Extension> {
  final TextEditingController _hoursController = TextEditingController();

  @override
  void dispose() {
    _hoursController.dispose();
    super.dispose();
  }

  void extendTime(int hoursToAdd, int id) async {
    DatabaseHelper dbHelper = DatabaseHelper.instance;

    Map<String, dynamic>? parkingPass = await dbHelper.getParkingPassById(id);
    if (parkingPass != null) {
      int currentDuration = int.parse(parkingPass['duration']);

      int newDuration = currentDuration + hoursToAdd;

      Map<String, dynamic> newData = {'duration': newDuration.toString()};

      await dbHelper.updateParkingPass(id, newData);
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extend Parking'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter how many hours you want to extend',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _hoursController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '2 Hours',
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ServiceButton(
                text: "Continue",
                nextPage: () async {
                  int? hours = int.tryParse(_hoursController.text);
                  if (hours != null) {
                    extendTime(hours, widget.id);
                    Map<String, dynamic>? updatedPass = await DatabaseHelper
                        .instance
                        .getParkingPassById(widget.id);

                    if (updatedPass != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Your time has been extended.'),
                          duration: Duration(seconds: 2),
                        ),
                      );

                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.of(context).pop();
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text('Failed to retrieve updated parking pass.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a valid number of hours.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
