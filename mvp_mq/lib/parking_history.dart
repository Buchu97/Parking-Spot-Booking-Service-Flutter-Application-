import 'package:flutter/material.dart';
import 'package:mvp_mq/Data/sqflite_database.dart';
class ParkingHistoryScreen extends StatefulWidget {
  const ParkingHistoryScreen({super.key});

  @override
 
  State<ParkingHistoryScreen> createState(){
    return _ParkingHistoryScreenState();
  }
}

class _ParkingHistoryScreenState extends State<ParkingHistoryScreen> {
  late Future<List<Map<String, dynamic>>> parkingHistory;

  @override
  void initState() {
    super.initState();
    parkingHistory = DatabaseHelper().getParkingPassHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: const Text('Parking History'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: parkingHistory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final parkingPass = data[index];
                return Card(
                  color: Colors.pink[50],
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.pink[300],
                      child: Text('${parkingPass['id']}'),
                    ),
               
                  title: Text(parkingPass['parkingLocation'] ?? 'Unknown Location'),
                  subtitle: Text('Spot No: ${parkingPass['parkingSpotNo']} - Date: ${parkingPass['date']}'),
                  trailing: Text('\$${parkingPass['amountPaid']}'),
                ),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
