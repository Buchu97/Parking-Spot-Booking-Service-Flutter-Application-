import 'package:flutter/material.dart';

class ServiceButton extends StatefulWidget {

  const ServiceButton({super.key, required this.text, required this.nextPage});
    final String text;
    final void Function() nextPage;



  @override
  State<ServiceButton> createState(){
    return _ServiceButtonState();
  }

  }

class _ServiceButtonState extends State<ServiceButton> {

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.pinkAccent,
          textStyle: const TextStyle(fontSize: 18),
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: widget.nextPage,
        child: Text(widget.text),
      ),
    );
  }
}
