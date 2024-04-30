import 'package:flutter/material.dart';
import 'package:mvp_mq/service_button.dart';

class MQHome extends StatelessWidget {
  
  const MQHome({super.key,required this.selectCampus});
  final void Function() selectCampus;
  @override
  Widget build( context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: AppBar(
          title: const Text('Welcome to MQ APP'),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),

        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ServiceButton(text: 'Parking Spot',selectCampus:  selectCampus),
              ServiceButton(text: 'Get a Coffee', selectCampus: (){}),
              ServiceButton(text: 'Book a Room', selectCampus: (){}),
              ServiceButton(text: 'Submit a Query', selectCampus: (){}),
              ServiceButton(text: 'Message',selectCampus: (){}),
            ],
          ),
        ),
      ),
    );
  }
}