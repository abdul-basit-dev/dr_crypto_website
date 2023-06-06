import 'package:firebase_database/firebase_database.dart';

class PortfolioModel {
  String? _pairId;
  late String _uid;
  late String _pairName;
  late String _buyPrice;
  late String _currentPrice;
  late String _high;
  late String _low;
  late String _pushValue;
  late String _buyVolume;
  //constructor for add
  PortfolioModel(
    this._pairName,
    this._buyPrice,
  );

  //Constructor for edit
  PortfolioModel.withId(
      this._pairId,
      this._pairName,
      this._buyPrice,
      this._currentPrice,
      this._high,
      this._low,
      this._uid,
      this._pushValue,
      this._buyVolume);

  //getters
  String? get id => _pairId;
  String get uid => _uid;
  String get pairName => _pairName;
  String get buyPrice => _buyPrice;
  String get currentPrice => _currentPrice;
  String get high => _high;
  String get low => _low;
  String get pushValue => _pushValue;
  String get buyVolume => _buyVolume;

//Converting snapshot back to class object
  PortfolioModel.fromSnapshot(DataSnapshot snapshot) {
    _pairId = snapshot.key;
    _pairId = (snapshot.value as dynamic)["pairId"];
    _pairName = (snapshot.value as dynamic)["pairName"];
    _buyPrice = (snapshot.value as dynamic)["buyPrice"];
  }

//Converting class object to JSON
  Map<String, dynamic> toJson() {
    return {
      "uid": _uid,
      "pairVolDB": _pairName,
      "pairId": _pairId,
      "buyPrice": _buyPrice,
      "currentPrice": _currentPrice,
      "high": _high,
      "low": _low,
      "pushValue": _pushValue,
      "volume": _buyVolume,
    };
  }
}
