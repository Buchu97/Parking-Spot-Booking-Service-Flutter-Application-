import 'package:flutter/material.dart';
// import 'package:mvp_mq/enter_details.dart';
import 'package:mvp_mq/mq_home.dart';
import 'package:mvp_mq/parking_pass.dart';
// import 'package:mvp_mq/select_campus.dart';

class MQApp extends StatefulWidget{
  const MQApp({super.key});
  @override
  State<MQApp> createState(){
    return _MQApp();
  }
}
class _MQApp extends State<MQApp>{
  Widget? activeScreen;
  @override
   void initState() {
    activeScreen =  const MQHome();
    super.initState();
  }
  // void selectCampus(){

  //   setState(() {
  //      activeScreen =  const SelectCampus();
  //   });
   
  // }
  // void enterDetails(){
    
  //   // setState(() {
  //     Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => EnterDetails(parkingPass: parkingPass)),
  //           );
  //   //   activeScreen =  EnterDetails(parkingPass: parkingPass);
  //   // });
  // }
  void parkingPass(){
    setState(() {
      activeScreen = const ParkingPass();
    });
  }
@override
  Widget build(context){
    return MaterialApp( 
      home: Scaffold(
        body: Container(
         
          child: activeScreen
          )
      ),
    );
  
  }
}