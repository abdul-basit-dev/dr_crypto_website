import 'package:dr_crypto/models/price_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class Storage {
  Future<void> storePriceData(
      PriceModel priceModel, String id, String pairId) async {
    DatabaseReference databaseReference = FirebaseDatabase.instance
        .ref()
        .child('Users')
        .child(id)
        .child('portfolio')
        .child(priceModel.id!);

    await databaseReference.update(priceModel.toJson()).then((_) {
      // Data saved successfully!
      print('Data saved successfully');
       showSimpleNotification(
        const Text("Data saved successfully"),
        background: Colors.green,
        autoDismiss: true,
        position: NotificationPosition.bottom,
      );
    }).catchError((error) {
      // The write failed...
      print('Data not saved successfully');
       showSimpleNotification(
        const Text("Error. Try saving again"),
        background: Colors.red,
        autoDismiss: true,
        position: NotificationPosition.bottom,
      );
    });
  }
}
