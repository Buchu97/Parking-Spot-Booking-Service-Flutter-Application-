import 'package:flutter/material.dart';
import 'package:mvp_mq/map_view.dart';
import 'package:mvp_mq/parking_history.dart';
import 'package:mvp_mq/select_campus.dart';
import 'package:mvp_mq/service_button.dart';

class MQHome extends StatelessWidget {
  
  const MQHome({super.key,required this.toggleTheme});
   final void Function(bool) toggleTheme;
  // final void Function() selectCampus;
  @override
  Widget build( context) {
    return 
      Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: const Text('Welcome to MQ APP'),
          
          // backgroundColor: Colors.pink,
          centerTitle: true,
          actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () => toggleTheme(Theme.of(context).brightness == Brightness.light),
          ),
        ],
        ),

        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ServiceButton(text: 'Parking Spot',nextPage:  () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SelectCampus(),
                ));
              }),
              ServiceButton(text: 'Wallumattagal Campus Map', nextPage: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MapWidget(imagePath: 'lib/assets/mq_campus_map.jpeg'),
                ));
              }),
              ServiceButton(text: 'Parking History', nextPage: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ParkingHistoryScreen(),
                ));
              }),
              ServiceButton(text: 'Submit a Query', nextPage: (){}),
              ServiceButton(text: 'Message',nextPage: (){}),
            ],
          ),
        ),
    
    );
  }
}