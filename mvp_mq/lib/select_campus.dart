import 'package:flutter/material.dart';
import 'package:mvp_mq/enter_details.dart';
import 'package:mvp_mq/service_button.dart';


class SelectCampus extends StatelessWidget {
  const SelectCampus({super.key});

 

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
               ), 
            onPressed: () => Navigator.of(context).pop(),
          ),
       
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Select a campus from below to proceed',
                style: TextStyle(
                    fontSize: 20,
                   ), 
                textAlign: TextAlign.center,
              ),
            ),
            ServiceButton(
                text: 'Wallumattagal Campus\nMacquarie Park',
                nextPage: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const EnterDetails(),
                ));
              }),
            ServiceButton(
                text: 'Macquarie City Campus\nSydney, Australia',
                nextPage: (){},
  
),
          ],
        ),
      
    );
  }
}
