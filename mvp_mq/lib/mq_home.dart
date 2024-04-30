import 'package:flutter/material.dart';
import 'package:mvp_mq/service_button.dart';

class MQHome extends StatelessWidget {
  const MQHome({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: AppBar(
          title: const Text('Welcome to MQ APP'),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ServiceButton(text: 'Parking Spot'),
              ServiceButton(text: 'Get a Coffee'),
              ServiceButton(text: 'Book a Room'),
              ServiceButton(text: 'Submit a Query'),
              ServiceButton(text: 'Message'),
            ],
          ),
        ),
      ),
    );
  }
}