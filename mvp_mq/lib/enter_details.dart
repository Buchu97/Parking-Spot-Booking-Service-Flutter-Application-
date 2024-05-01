import 'package:flutter/material.dart';
import 'package:mvp_mq/service_button.dart';

class EnterDetails extends StatelessWidget {
  const EnterDetails({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.pink,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Enter Parking Location',
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Carpark - P South 2',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Enter Duration',
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '10 AM - 12 PM',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Enter Vehicle Number Plate',
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'ABC 6251 ALIA',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ServiceButton(text: "Continue", selectCampus: () {})
            ],
          ),
        ),
      ),
    );
  }
}
