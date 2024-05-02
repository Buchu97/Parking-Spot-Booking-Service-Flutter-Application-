import 'package:flutter/material.dart';
import 'package:mvp_mq/Data/sqflite_database.dart';
import 'package:mvp_mq/service_button.dart';

class Extension extends StatefulWidget {
  const Extension({super.key, required this.id});
  final int id;

  @override
  State<Extension> createState(){
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
  DatabaseHelper dbHelper = DatabaseHelper();

  // Fetch the existing parking pass
  Map<String, dynamic>? parkingPass = await dbHelper.getParkingPassById(id);
  if (parkingPass != null) {
    // Get the current duration and convert it to an integer
    int currentDuration = int.parse(parkingPass['duration']);

    // Calculate the new duration
    int newDuration = currentDuration + hoursToAdd;

    // Prepare the data to update
    Map<String, dynamic> newData = {
      'duration': newDuration.toString()  // Convert it back to a string if stored as a string
    };

    // Update the parking pass with the new duration
    await dbHelper.updateParkingPass(id, newData);
  } else {
    print("No parking pass found with id $id");
    // Handle the error or inform the user as needed
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: const Text('Extend Parking'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter how many hours you want to extend',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _hoursController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '2 Hours',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
           ServiceButton(text: "Continue", nextPage: () async {
              
                int? hours = int.tryParse(_hoursController.text);
                if (hours != null) {
                 Map<String, dynamic>? updatedPass = await DatabaseHelper().getParkingPassById(widget.id);
                  print("Updated Duration: ${updatedPass?['duration']}");
                 extendTime(hours, widget.id);
                 
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a valid number'))
                  );
                }
              },)
          ],
        ),
      ),
    );
  }
}
