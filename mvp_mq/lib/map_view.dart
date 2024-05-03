import 'package:flutter/material.dart';


class MapWidget extends StatelessWidget {
  const MapWidget({super.key,required this.imagePath});
  final String imagePath;
  
  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('B'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.pink,
      ),
      
       
       
        body: Container(
          color: Colors.pink[100],
          child: Center( 
           
          child: InteractiveViewer( 
            
            
            // boundaryMargin: const EdgeInsets.all(50.0), // Margin around the content 
            minScale: 0.5, // Minimum scale (zoom out) 
            maxScale: 2.0, // Maximum scale (zoom in) 
            child: Image.network( 
             imagePath, 
              width: 1000.0, // Width of the initial image 
              height: 700.0, // Height of the initial image 
              fit: BoxFit.cover, // BoxFit to fill the available space 
            ), 
          ), 
                ),
        ), 
          
        );
      
    
  }
}

