import 'package:flutter/material.dart';
import 'package:mvp_mq/service_button.dart';

class MQHome extends StatelessWidget {
  
  const MQHome({super.key,required this.selectCampus});
  final void Function() selectCampus;
  @override
  Widget build( context) {
    return 
      Scaffold(
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
              ServiceButton(text: 'Parking Spot',nextPage:  selectCampus),
              ServiceButton(text: 'Get a Coffee', nextPage: (){}),
              ServiceButton(text: 'Book a Room', nextPage: (){}),
              ServiceButton(text: 'Submit a Query', nextPage: (){}),
              ServiceButton(text: 'Message',nextPage: (){}),
            ],
          ),
        ),
    
    );
  }
}