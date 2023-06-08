// ignore_for_file: unnecessary_null_comparison

import 'package:data_table_2/data_table_2.dart';
import 'package:dr_crypto/models/portfolio_model.dart';
import 'package:dr_crypto/widgets/default_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dr_crypto/constant.dart';

import 'package:intl/intl.dart' as intl;
import 'package:overlay_support/overlay_support.dart';

import '../../utils/storage.dart';

class EditUserInfo extends StatefulWidget {
  static String routeName = "/userEdit";
  const EditUserInfo({
    super.key,
    required this.userName,
    required this.status,
    required this.email,
    required this.userImage,
    required this.id,
  });
  final String userName, userImage, status, email, id;
  @override
  State<EditUserInfo> createState() => _EditUserInfoState();
}

class _EditUserInfoState extends State<EditUserInfo> {
  List<dynamic> matchingData = []; // Matching data from Firebase and API

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  Storage storage = Storage();
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child('Users');

  var _listCoin = [];
  // final formatter = intl.NumberFormat.decimalPattern();
  final formatter = intl.NumberFormat("#,##0.0######"); // for price change
  final percentageFormat = intl.NumberFormat("##0.0#"); // for price change

  int _itemPerPage = 1, _currentMax = 10;
  bool _isLoading = true;

  final ScrollController _scrollController = ScrollController();

  List<String> cryptoCoins = [];
  List<dynamic> currentPriceList = [];

  getCoinList() async {
    Dio dio = Dio();
    Response response;
    try {
      response = await dio.get(
          "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=$_itemPerPage&sparkline=false");
      //  print("Response data : ${_response.data}");
      // _listCoin = _response.data;
      if (_listCoin == null) {
        _listCoin = List.generate(10, (i) => response.data[i]);
      } else {
        int j = 0;
        for (int i = _currentMax; i < _currentMax + 10; i++) {
          _listCoin.add(response.data[j]);
          cryptoCoins.add("${response.data[j]['symbol'].toUpperCase()}/USD");

          j++;
        }
      }
      print("Success");
      findMatchingData();
      _isLoading = false;

      setState(() {});
    } on DioError catch (e) {
      String errorMessage = e.response!.data.toString();
      print("Error message : $errorMessage");
      switch (e.type) {
        case DioErrorType.connectTimeout:
          break;
        case DioErrorType.sendTimeout:
          break;
        case DioErrorType.receiveTimeout:
          break;
        case DioErrorType.response:
          errorMessage = e.response!.data["error"];
          break;
        case DioErrorType.cancel:
          break;
        case DioErrorType.other:
          break;
      }
      _isLoading = false;
      setState(() {});
    }
  }

  _getMoreData() {
    print("Load more data");
    _itemPerPage = _itemPerPage + 1;
    _currentMax = _currentMax + 10;
    getCoinList();
  }

//Firebase
  var portfolioData = [];
  List<PortfolioModel> portfolioModel = [];
  int mIndex = 0;
  @override
  void initState() {
    super.initState();
    user = _auth.currentUser;
    // refreshWithTimer(10, true);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
    getCoinList();
    getCurrentUserData();
  }

  String? valueText;
  final TextEditingController _textFieldController = TextEditingController();
  String? valueTextVol;
  final TextEditingController _textFieldControllerVol = TextEditingController();
  Future<void> _displayTextInputDialog(
    BuildContext context,
    String uid,
    String pairVolDB,
    String price,
    String pairId,
    String currentPrice,
    String high,
    String low,
    String volume,
  ) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Enter Buying Price'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const InkWell(child: Text("PAIR / VOL")),
                    InkWell(child: Text(pairVolDB)),
                  ],
                ),
                const SizedBox(height: 8),
                const Text("Volume"),
                const SizedBox(height: 8),
                TextField(
                  onChanged: (value) {
                    valueTextVol = value;
                  },
                  controller: _textFieldControllerVol,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Volume",
                  ),
                ),
                const SizedBox(height: 8),
                const Text("Buy Price"),
                const SizedBox(height: 8),
                TextField(
                  onChanged: (value) {
                    valueText = value;
                  },
                  controller: _textFieldController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Buy Price"),
                ),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  'CANCEL',
                  style: TextStyle(color: kSecondColor),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                child: const Text(
                  'OK',
                  style: TextStyle(color: kSecondColor),
                ),
                onPressed: () {
                  price = _textFieldController.text;
                  volume = _textFieldControllerVol.text;
                  if (_textFieldController.text.isNotEmpty &&
                      _textFieldControllerVol.text.isNotEmpty) {
                    // updatePrice(uid, pairVolDB, pairId, price);
                    final data = {
                      'uid': uid,
                      'pairVolDB': pairVolDB,
                      'pairId': 'pairId',
                      'buyPrice': price,
                      'currentPrice': currentPrice,
                      'high': high,
                      'low': low,
                      'volume': volume,
                    };
                    addDataToFirebase(data);
                    _textFieldController.text = '';
                    _textFieldControllerVol.text = '';

                    setState(() {});
                  } else {
                    showSimpleNotification(
                      const Text("Please enter all values"),
                      background: Colors.red,
                      autoDismiss: true,
                      position: NotificationPosition.bottom,
                    );
                  }
                },
              ),
            ],
          );
        });
  }

  Future<void> _displayTextInputDialogToUpdate(
    BuildContext context,
    String uid,
    String pairVolDB,
    String price,
    String pairId,
    String currentPrice,
    String high,
    String low,
    String key,
    String volume,
  ) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Enter Buying Price'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const InkWell(child: Text("PAIR / VOL")),
                    InkWell(child: Text(pairVolDB)),
                  ],
                ),
                const SizedBox(height: 8),
                const Text("Volume"),
                const SizedBox(height: 8),
                TextField(
                  onChanged: (value) {
                    valueTextVol = value;
                  },
                  controller: _textFieldControllerVol,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Volume",
                  ),
                ),
                const SizedBox(height: 8),
                const Text("Buy Price"),
                const SizedBox(height: 8),
                TextField(
                  onChanged: (value) {
                    valueText = value;
                  },
                  controller: _textFieldController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Buy Price"),
                ),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  'CANCEL',
                  style: TextStyle(color: kSecondColor),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                child: const Text(
                  'OK',
                  style: TextStyle(color: kSecondColor),
                ),
                onPressed: () {
                  price = _textFieldController.text;
                  volume = _textFieldControllerVol.text;
                  if (_textFieldController.text.isNotEmpty &&
                      _textFieldControllerVol.text.isNotEmpty) {
                    // updatePrice(uid, pairVolDB, pairId, price);
                    final data = {
                      'uid': uid,
                      'pairVolDB': pairVolDB,
                      'pairId': pairId,
                      'buyPrice': price,
                      'currentPrice': currentPrice,
                      'high': high,
                      'low': low,
                      'volume': volume,
                    };
                    updateDataToFirebase(data, key);
                    _textFieldController.text = '';
                    _textFieldControllerVol.text = '';
                  } else {
                    showSimpleNotification(
                      const Text("Please enter all values"),
                      background: Colors.red,
                      autoDismiss: true,
                      position: NotificationPosition.bottom,
                    );
                  }
                },
              ),
            ],
          );
        });
  }

  void addDataToFirebase(Map<String, dynamic> data) {
    DatabaseReference newPortfolioRef =
        _databaseReference.child(widget.id).child('newPortfolio').push();

    String pushValue = newPortfolioRef.key!; // Retrieve the generated key

    data['pushValue'] = pushValue; // Add the key to the data

    newPortfolioRef.set(data).then((value) {
      setState(() {
        matchingData.clear();
        findMatchingData();
      });
      Navigator.of(context).pop();
    });
  }

  void updateDataToFirebase(Map<String, dynamic> data, String key) {
    _databaseReference
        .child(widget.id)
        .child('newPortfolio')
        .child(key)
        .update(data)
        .then((value) {
      setState(() {
        matchingData.clear();
        findMatchingData();
      });
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: (_isLoading == true)
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildHeader(),
                    //const SizedBox(height: 24),
                    _buildSubHead('Add Currencies'),
                    Expanded(
                      child: DataTable2(
                        headingRowColor:
                            MaterialStateProperty.all(kPrimaryColor),
                        headingTextStyle: const TextStyle(color: kSecondColor),
                        columnSpacing: 12,
                        horizontalMargin: 12,
                        showBottomBorder: true,
                        showCheckboxColumn: true,

                        //minWidth: 600,
                        columns: const [
                          DataColumn2(
                            label: Text('Id'),
                            size: ColumnSize.S,
                            // fixedWidth: 24.0,
                          ),
                          DataColumn2(
                            label: Text('Username / Email'),
                            size: ColumnSize.L,
                          ),
                          DataColumn2(
                            size: ColumnSize.L,
                            //onSort: (columnIndex, ascending) {},
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Pair / Vol'),
                              ],
                            ),
                          ),
                          DataColumn2(
                            size: ColumnSize.M,
                            label: Text('Current Price'),
                          ),
                          DataColumn2(
                            size: ColumnSize.M,
                            label: Text('Modify'),
                          ),
                        ],
                        rows: List<DataRow>.generate(
                          1,
                          (index) => DataRow(
                            cells: [
                              //index
                              DataCell(Text("${mIndex + 1}")),
                              //email
                              DataCell(Text(widget.email)),
                              //pair-vol
                              DataCell(
                                Container(
                                  // height: 50,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  // margin: EdgeInsets.symmetric(vertical: 5),
                                  decoration: const BoxDecoration(
                                      color: Colors.white24),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(width: 5),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Center(
                                                child: DropdownButton<int>(
                                                  value: mIndex,
                                                  items: cryptoCoins
                                                      .asMap()
                                                      .entries
                                                      .map(
                                                          (MapEntry<int, String>
                                                              entry) {
                                                    return DropdownMenuItem<
                                                        int>(
                                                      value: entry.key,
                                                      child: Text(entry.value),
                                                    );
                                                  }).toList(),
                                                  onChanged: (int? newIndex) {
                                                    setState(() {
                                                      mIndex = newIndex!;
                                                      print(
                                                          'Selected Index: $mIndex');
                                                      print(
                                                          'Selected Item: ${cryptoCoins[mIndex]}');
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      //  Spacer(),
                                    ],
                                  ),
                                ),
                              ),

                              //Current Price
                              DataCell(
                                SizedBox(
                                  width: 80,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "\$ ${formatter.format(_listCoin[mIndex]['current_price'])}",
                                          style:
                                              const TextStyle(fontSize: 13.5),
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Row(
                                        children: [
                                          const Text("High",
                                              style: TextStyle(fontSize: 8)),
                                          const Spacer(),
                                          Text(
                                            "\$${_listCoin[mIndex]['high_24h']}",
                                            style: const TextStyle(
                                                fontSize: 9,
                                                color: Colors.green),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("Low",
                                              style: TextStyle(fontSize: 8)),
                                          const Spacer(),
                                          Text(
                                            "\$${_listCoin[mIndex]['low_24h']}",
                                            style: const TextStyle(
                                                fontSize: 9, color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              DataCell(Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: DefaultButton(
                                  press: () {
                                    setState(() {
                                      _textFieldController.text = "";
                                      _textFieldControllerVol.text = "";
                                      _displayTextInputDialog(
                                        context,
                                        widget.id, //uid
                                        "${_listCoin[mIndex]['symbol'].toUpperCase()}/USD", //pairvol
                                        "buyingPrice", //buyingPrice

                                        "pairid", //pairid
                                        formatter.format(_listCoin[mIndex]
                                            ['current_price']), //current
                                        "${_listCoin[mIndex]['high_24h']}", //high
                                        "${_listCoin[mIndex]['low_24h']}", //loe
                                        "Volume", //Volume
                                      );
                                    });
                                  },
                                  text: 'Add',
                                ),
                              )),
                              //email
                            ],
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(height: 24),/////////////////////////////////
                    ///////////////
                    /////////////////TODO:
                    ///////////////////TODO:
                    ////////////////////TODO:
                    /////////TODO:
                    _buildSubHead('Baught Currencies'),
                    Expanded(
                      child: DataTable2(
                        headingRowColor:
                            MaterialStateProperty.all(kPrimaryColor),
                        headingTextStyle: const TextStyle(color: kSecondColor),
                        columnSpacing: 12,
                        horizontalMargin: 12,
                        showBottomBorder: true,
                        showCheckboxColumn: true,

                        //minWidth: 600,
                        columns: const [
                          DataColumn2(
                            label: Text('Id'),
                            size: ColumnSize.S,
                            // fixedWidth: 24.0,
                          ),
                          DataColumn2(
                            size: ColumnSize.L,
                            //onSort: (columnIndex, ascending) {},
                            label: Text('Pair / Vol'),
                          ),
                          DataColumn2(
                            size: ColumnSize.M,
                            label: Text('Buy Price'),
                          ),
                          DataColumn2(
                            size: ColumnSize.M,
                            label: Text('Current Price'),
                          ),
                          DataColumn2(
                            size: ColumnSize.M,
                            label: Text('Profit / Loss'),
                          ),
                          DataColumn2(
                            size: ColumnSize.M,
                            label: Text('Modify'),
                          ),
                        ],
                        rows: List<DataRow>.generate(
                          portfolioModel.length,
                          (index) => DataRow(
                            cells: [
                              //index
                              DataCell(Text("${index + 1}")),

                              //pair-vol
                              DataCell(
                                Text(
                                  portfolioModel[index].pairName,
                                ),
                              ),

                              //Buy Price
                              DataCell(
                                SizedBox(
                                  width: 80,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "\$ ${portfolioModel[index].buyPrice}",
                                          style:
                                              const TextStyle(fontSize: 13.5),
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Flexible(
                                        child: Text(
                                          "Vol: \$ ${portfolioModel[index].buyVolume}",
                                          style: const TextStyle(fontSize: 9.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              //Current Price
                              DataCell(
                                SizedBox(
                                  width: 80,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          //TODO:
                                          "\$ ${formatter.format(matchingData[index]['current_price'])}",
                                          style:
                                              const TextStyle(fontSize: 13.5),
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Row(
                                        children: [
                                          const Text("High",
                                              style: TextStyle(fontSize: 8)),
                                          const Spacer(),
                                          Text(
                                            "\$${matchingData[index]['high_24h']}",
                                            style: const TextStyle(
                                                fontSize: 9,
                                                color: Colors.green),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("Low",
                                              style: TextStyle(fontSize: 8)),
                                          const Spacer(),
                                          Text(
                                            "\$${matchingData[index]['low_24h']}",
                                            style: const TextStyle(
                                                fontSize: 9, color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              //Profit and Loss
                              DataCell(
                                SizedBox(
                                  width: 90,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ProfitLossCalculator(
                                          buyingPrice: double.parse(
                                              portfolioModel[index].buyPrice),
                                          currentPrice: matchingData[index]
                                              ['current_price']),
                                      const SizedBox(height: 3),
                                    ],
                                  ),
                                ),
                              ),

                              DataCell(Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: DefaultButton(
                                  press: () {
                                    setState(() {
                                      _textFieldController.text =
                                          portfolioModel[index].buyPrice;
                                      _textFieldControllerVol.text =
                                          portfolioModel[index].buyVolume;
                                      _displayTextInputDialogToUpdate(
                                        context,
                                        widget.id, //uid
                                        "${matchingData[index]['symbol'].toUpperCase()}/USD", //pairvol
                                        portfolioModel[index].buyPrice,

                                        portfolioModel[index].pairName, //pairid
                                        formatter.format(matchingData[index]
                                            ['current_price']), //current
                                        "${matchingData[index]['high_24h']}", //high
                                        "${matchingData[index]['low_24h']}",
                                        portfolioModel[index].pushValue,
                                        portfolioModel[index]
                                            .buyVolume, //buying Volume
                                      );
                                    });
                                  },
                                  text: 'Update',
                                ),
                              )),
                              //email
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildSubHead(String message) {
    return Container(
      height: 72,
      width: double.infinity,
      alignment: Alignment.center,
      color: kPrimaryColor,
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(widget.userImage == 'empty'
              ? 'https://firebasestorage.googleapis.com/v0/b/drcrypto-1d034.appspot.com/o/user_images%2FBlack%20Minimalist%20Initial%20Font%20BE%20Logo.png?alt=media&token=a52a437f-8c22-4c89-87e9-6cdd04e102e1'
              : widget.userImage),
        ),
        const SizedBox(height: 10),
        Text(
          widget.userName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          widget.email,
          style: const TextStyle(
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        const Text(
          '',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Future<void> getCurrentUserData() async {
    _databaseReference
        .child(widget.id)
        .child('newPortfolio')
        .onValue
        .listen((DatabaseEvent event) {
      var snapshot = event.snapshot;

      portfolioData.clear();
      portfolioModel.clear();

      for (var data in snapshot.children) {
        portfolioData.add(data.value);
      }

      setState(() {
        if (snapshot.exists && portfolioData.isNotEmpty) {
          for (int x = 0; x < portfolioData.length; x++) {
            String uid = portfolioData[x]['uid'];
            String pairVolDB = portfolioData[x]['pairVolDB'];
            String pairId = portfolioData[x]['pairId'];
            String buyPrice = portfolioData[x]['buyPrice'];

            String currentPrice = portfolioData[x]['currentPrice'];
            String high = portfolioData[x]['high'];
            String low = portfolioData[x]['low'];
            String pushValue = portfolioData[x]['pushValue'] ?? '';
            String buyVolume = portfolioData[x]['volume'] ?? '';
            portfolioModel.add(PortfolioModel.withId(
              pairId,
              pairVolDB,
              buyPrice,
              currentPrice,
              high,
              low,
              uid,
              pushValue,
              buyVolume,
            ));
            // findMatchingData();
            print('call');
            findMatchingData();
          }

          // isLoading = true;
        } else {
          // isLoading = false;
          print('THis user has no data and has not baught any currencirs');
        }
      });
    });
  }

  void findMatchingData() {
    // Compare the 'pairName' field from Firebase and API data
    for (final firebaseItem in portfolioData) {
      final firebasePairName = firebaseItem['pairVolDB'];
      for (final apiItem in _listCoin) {
        final apiPairName = apiItem['symbol'];

        final String symbol = '${apiPairName.toString().toUpperCase()}/USD';

        if (firebasePairName == symbol) {
          print('call333======');
          setState(() {
            matchingData.add(apiItem);
            print('matchingData======');
            print("THIS IS THEE:::::" + matchingData.toString());
            print('=====matchingData');
          });
          break;
        }
      }
    }
  }
}

class ProfitLossCalculator extends StatelessWidget {
  final double buyingPrice;
  final double currentPrice;

  ProfitLossCalculator({required this.buyingPrice, required this.currentPrice});

  @override
  Widget build(BuildContext context) {
    double difference = currentPrice - buyingPrice;
    double percentage = (difference / buyingPrice) * 100;
    String result;
    String percentageResult;

    if (difference > 0) {
      result = '\$${difference.toStringAsFixed(2)}';
      percentageResult = '${percentage.toStringAsFixed(2)}%';
    } else if (difference < 0) {
      result = '\$${(-difference).toStringAsFixed(2)}';
      percentageResult = '${(-percentage).toStringAsFixed(2)}%';
    } else {
      result = 'No profit or loss';
      percentageResult = '0%';
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            result,
            style: TextStyle(
              fontSize: 10,
              color: difference > 0 ? Colors.green : Colors.red,
            ),
          ),
          Text(
            percentageResult,
            style: TextStyle(
              fontSize: 8,
              color: difference > 0 ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
