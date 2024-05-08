import 'package:flutter/material.dart';
import 'package:mvp_mq/Data/theme_data.dart';
import 'package:mvp_mq/sign_in.dart';

class MQApp extends StatefulWidget{
  const MQApp({super.key});
  @override
  State<MQApp> createState(){
    return _MQApp();
  }
}
class _MQApp extends State<MQApp>{


   ThemeMode _themeMode = ThemeMode.system; // Default to system theme

  void toggleTheme(bool isDarkMode) {
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }
  
@override
  Widget build(context){
    return MaterialApp( 
       theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      home:   Scaffold(
        body: LoginScreen(toggleTheme: toggleTheme), 
          
      ),
    );
  
  }
}