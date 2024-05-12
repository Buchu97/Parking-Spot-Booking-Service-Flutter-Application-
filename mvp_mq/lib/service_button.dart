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
        style:  Theme.of(context).elevatedButtonTheme.style,
       
        onPressed: widget.nextPage,
        child: Text(widget.text),
      ),
    );
  }
}

 