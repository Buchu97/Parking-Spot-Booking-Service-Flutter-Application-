import 'package:flutter/material.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
       
      ),
      body: Center(
        
        child: InteractiveViewer(
          
          boundaryMargin: const EdgeInsets.all(20.0),
          minScale: 0.5,
          maxScale: 2.0,
          child: AspectRatio(
            aspectRatio: 11 / 11,
            child: Image.asset(
              
              imagePath,
             
              fit: BoxFit.fill,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    if (stackTrace != null) {
                    }
                    return const Text('Failed to load image');
                },
            ),
          ),
        ),
      ),
    );
  }
}
