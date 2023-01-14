import 'package:firebase_database/firebase_database.dart';

class PriceModel {
  String? _id;
  late String _pairName;
  late String _buyPrice;
  

  //constructor for add
  PriceModel(
    this._pairName,
    this._buyPrice,
  );

  //Constructor for edit
  PriceModel.withId(
    this._id,
    this._pairName,
    this._buyPrice,
  );
  

  //getters
  String? get id => _id;
  String get pairName => _pairName;
  String get buyPrice => _buyPrice;

 
//Converting snapshot back to class object
  PriceModel.fromSnapshot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _id = (snapshot.value as dynamic)["id"];
    _pairName = (snapshot.value as dynamic)["pairName"];
    _buyPrice = (snapshot.value as dynamic)["buyPrice"];
   

  }

//Converting class object to JSON
  Map<String, dynamic> toJson() {
    return {
      "id": _id,
      "pairName": _pairName,
      "buyPrice": _buyPrice,
    };
  }
}
