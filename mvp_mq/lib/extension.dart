import 'package:flutter/material.dart';
import 'package:mvp_mq/Data/sqflite_database.dart';
import 'package:mvp_mq/confirmation.dart';

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

 
  Map<String, dynamic>? parkingPass = await dbHelper.getParkingPassById(id);
  if (parkingPass != null) {
  
    int currentDuration = int.parse(parkingPass['duration']);

   
    int newDuration = currentDuration + hoursToAdd;

   
    Map<String, dynamic> newData = {
      'duration': newDuration.toString()  
    };

    
    await dbHelper.updateParkingPass(id, newData);
  } else {
    print("No parking pass found with id $id");
    
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
                  extendTime(hours, widget.id);
                 Map<String, dynamic>? updatedPass = await DatabaseHelper().getParkingPassById(widget.id);
                  
                 
                    print("Updated Duration: ${updatedPass?['duration']}");
                 
                 // ignore: use_build_context_synchronously
                 Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Confirmation(id: widget.id),
                  ));
                 
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
