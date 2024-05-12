import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvp_mq/map_view.dart';
import 'package:mvp_mq/parking_history.dart';
import 'package:mvp_mq/select_campus.dart';
import 'package:mvp_mq/service_button.dart';
import 'package:mvp_mq/sign_in.dart';
import 'package:mvp_mq/theme_provider.dart';
import 'package:provider/provider.dart';

class MQHome extends StatelessWidget {
  
   const MQHome({super.key});
  

  @override
  Widget build( context) {
    return 
      Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
           automaticallyImplyLeading: false,
          title: const Text('Welcome to MQ APP'),
          
          
          centerTitle: true,
          actions: [
            
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: ()  {final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    themeProvider.toggleTheme(themeProvider.themeMode == ThemeMode.light);},
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
              ServiceButton(text: 'Log Out', nextPage: 
                 () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                  
                ));
            
          
              }),
             
            ],
          ),
        ),
    
    );
  }
}