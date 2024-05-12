import 'package:flutter/material.dart';
import 'package:mvp_mq/Data/sqflite_database.dart';
import 'package:mvp_mq/extension.dart';
import 'package:mvp_mq/mq_home.dart';
import 'package:mvp_mq/service_button.dart';

class ParkingPass extends StatefulWidget {
  const ParkingPass({super.key, required this.id});
  final int id;

  @override
  State<ParkingPass> createState() {
    return _ParkingPass();
  }

  navigateAndRefresh() {}
}

class _ParkingPass extends State<ParkingPass> {
  Map<String, dynamic>? parkingPassData;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    var data = await DatabaseHelper.instance.getParkingPassById(widget.id);
    if (data != null) {
      setState(() {
        parkingPassData = data;
      });
    }
  }

  Future<void> navigateAndRefresh() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Extension(id: widget.id)),
    );
    loadData();
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FutureBuilder<Map<String, dynamic>?>(
                future: DatabaseHelper.instance.getParkingPassById(widget.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return buildParkingPassContent(context, snapshot.data!);
                    } else {
                      return const Center(child: Text('No Parking Pass Found'));
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              ServiceButton(text: "Extend Time", nextPage: navigateAndRefresh),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ServiceButton(
                    text: "Cancel",
                    nextPage: () async {
                      int deletedCount = await DatabaseHelper.instance
                          .deleteParkingPass(widget.id);
                      if (deletedCount != 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Your parking pass has been deleted'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MQHome(),
                          ));
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Deleting Parking Pass was unsuccessful'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                  ),
                  ServiceButton(
                    text: "Home",
                    nextPage: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MQHome(),
                      ));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildParkingPassContent(
      BuildContext context, Map<String, dynamic> data) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Your Parking Pass',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _infoCard("Campus Location:", data['campusLocation']),
          _infoCard("Parking Location:", data['parkingLocation']),
          _infoCard("Parking Spot No:", data['parkingSpotNo']),
          _infoCard("Number Plate:", data['numberPlate']),
          _infoCard("Start Time:", data['startTime']),
          _infoCard("Duration:", data['duration']),
          _infoCard("To Pay:", "\$${data['amountPaid']}"),
          _infoCard("Date:", data['date']),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Note: Exceeding the time on your Parking Pass will result in \$10 fine for every 10 minutes\nYou can still choose to extend the time limit on your parking pass!',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoCard(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RichText(
        text: TextSpan(
          text: '$title ',
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            TextSpan(
              text: value,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
