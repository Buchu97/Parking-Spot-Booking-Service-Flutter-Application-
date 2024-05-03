import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key,required this.imagePath});
  final String imagePath;

  

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: AssetImage(imagePath),
      minScale: PhotoViewComputedScale.contained * 0.8,
      maxScale: PhotoViewComputedScale.covered * 2,
      backgroundDecoration: const BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}
