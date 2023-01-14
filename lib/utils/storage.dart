import 'package:dr_crypto_website/models/price_model.dart';
import 'package:firebase_database/firebase_database.dart';

class Storage {
  Future<void> storePriceData(PriceModel priceModel, String id, String pairId) async {
    DatabaseReference databaseReference = FirebaseDatabase.instance
        .ref()
        .child('Users')
        .child(id)
        .child('price')
        .child(priceModel.id!);

    await databaseReference.update(priceModel.toJson()).then((_) {
      // Data saved successfully!
      print('Data saved successfully');
    }).catchError((error) {
      // The write failed...
      print('Data not saved successfully');
    });
  }
}
