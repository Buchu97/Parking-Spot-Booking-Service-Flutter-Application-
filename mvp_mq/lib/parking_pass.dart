import 'package:flutter/material.dart';
import 'package:mvp_mq/mq_app.dart';
import 'package:mvp_mq/service_button.dart';

class ParkingPass extends StatelessWidget{
  const ParkingPass({super.key});

@override
  Widget build(context){
  return  Scaffold(
       appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.pink,
          elevation: 0,
        ),
         body: Container(
        color: Colors.pink[100], // Set background color
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Your Parking Pass',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _infoCard("Campus Location:", "Wallumattagal Campus Macquarie Park"),
            _infoCard("Parking Location:", "Carpark - P South 2"),
            _infoCard("Parking Spot No:", "A10"),
            _infoCard("Number Plate:", "ABC 6251"),
            _infoCard("Duration:", "10 AM - 12 PM"),
            _infoCard("To Pay:", "\$50"),
            _infoCard("Date:", "05/04/2024"),
            const Padding(
              padding:  EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Note: Exceeding the time on your Parking Pass will result in \$10 fine for every 10 minutes\nYou can still choose to extend the time limit on your parking pass!',
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            ServiceButton(
              text: "Extend Time",nextPage: (){},
              // style: ElevatedButton.styleFrom(
              //   foregroundColor: Colors.pink, backgroundColor: Colors.white, // Text color
              // ),
              // onPressed: () {},
              // child:const Text('Extend Time'),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ServiceButton(
                  text: "Cancel",nextPage: (){
                    Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MQApp(),
                ));
                  },

                  // style: ElevatedButton.styleFrom(
                  //   foregroundColor: Colors.pink, backgroundColor: Colors.white, // Text color
                  // ),
                  // onPressed: () => Navigator.of(context).pop(),
                  // child: const Text('Cancel'),
                ),
                ServiceButton(
                  text: "Pay",nextPage: (){},
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RichText(
        text: TextSpan(
          text: '$title ',
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          children: <TextSpan>[
            TextSpan(
              text: value,
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
  );

}

}