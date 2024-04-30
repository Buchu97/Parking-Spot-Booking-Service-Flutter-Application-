import 'package:flutter/material.dart';
import 'package:mvp_mq/mq_home.dart';
import 'package:mvp_mq/select_campus.dart';

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
    activeScreen =  MQHome(selectCampus : selectCampus);
    super.initState();
  }
  void selectCampus(){
    setState(() {
       activeScreen = const SelectCampus();
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