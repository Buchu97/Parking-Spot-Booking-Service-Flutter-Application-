import 'package:flutter/material.dart';

class Extension extends StatefulWidget {
  const Extension({super.key});

  @override
  State<Extension> createState(){
    return _ExtensionState();
  }
}

class _ExtensionState extends State<Extension> {
  final TextEditingController _hoursController = TextEditingController();

  @override
  void dispose() {
    _hoursController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: const Text('Extend Parking'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter how many hours you want to extend',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _hoursController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '2 Hours',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Example: Process the input or navigate
                int? hours = int.tryParse(_hoursController.text);
                if (hours != null) {
                  print("Extend by $hours hours.");  // You can handle navigation or logic here
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a valid number'))
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.pink,
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
