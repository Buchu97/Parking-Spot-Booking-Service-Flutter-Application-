import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Prepare parking pass data correctly', () {
    final parkingPassData = {
      'campusLocation': 'Wallumattagal Campus Macquarie Park',
      'parkingLocation': 'P South 2',
      'parkingSpotNo': 'A10',
      'numberPlate': 'ABC 6251',
      'startTime': '10 AM',
      'duration': '2',
      'amountPaid': 50.00,
      'date': DateTime.now().toString()
    };

    expect(parkingPassData['campusLocation'],
        'Wallumattagal Campus Macquarie Park');
    expect(parkingPassData['parkingLocation'], 'P South 2');
    expect(parkingPassData['numberPlate'], 'ABC 6251');
  });
}
