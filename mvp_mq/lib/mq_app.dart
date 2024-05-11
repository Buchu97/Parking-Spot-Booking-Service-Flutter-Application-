import 'package:flutter/material.dart';
import 'package:mvp_mq/Data/theme_data.dart';

import 'package:mvp_mq/sign_in.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart'; 

class MQApp extends StatefulWidget{
  const MQApp({super.key});
  @override
  State<MQApp> createState(){
    return _MQApp();
  }
}
class _MQApp extends State<MQApp>{



 
  
@override
  Widget build(context){
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:  themeProvider.themeMode,
            home:  const LoginScreen(),
          );
        },
      ),
    );
  }
}