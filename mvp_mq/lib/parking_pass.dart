import 'package:flutter/material.dart';

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
  );

}

}