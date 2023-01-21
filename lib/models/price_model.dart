import 'package:firebase_database/firebase_database.dart';

class PriceModel {
  String? _pairId;
  late String _pairName;
  late String _buyPrice;
  

  //constructor for add
  PriceModel(
    this._pairName,
    this._buyPrice,
  );

  //Constructor for edit
  PriceModel.withId(
    this._pairId,
    this._pairName,
    this._buyPrice,
  );
  

  //getters
  String? get id => _pairId;
  String get pairName => _pairName;
  String get buyPrice => _buyPrice;

 
//Converting snapshot back to class object
  PriceModel.fromSnapshot(DataSnapshot snapshot) {
    _pairId = snapshot.key;
    _pairId = (snapshot.value as dynamic)["pairId"];
    _pairName = (snapshot.value as dynamic)["pairName"];
    _buyPrice = (snapshot.value as dynamic)["buyPrice"];
   

  }

//Converting class object to JSON
  Map<String, dynamic> toJson() {
    return {
      "pairId": _pairId,
      "pairName": _pairName,
      "buyPrice": _buyPrice,
    };
  }
}
