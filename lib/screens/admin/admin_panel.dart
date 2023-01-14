import 'dart:async';

import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:dio/dio.dart';
import 'package:dr_crypto_website/constant.dart';
import 'package:dr_crypto_website/models/price_model.dart';
import 'package:dr_crypto_website/models/user_model.dart';

import 'package:dr_crypto_website/utils/responsive_layout.dart';
import 'package:dr_crypto_website/widgets/default_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:overlay_support/overlay_support.dart';

import 'package:intl/intl.dart' as intl;

import '../../utils/storage.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  //Database
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  Storage storage = Storage();
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child('Users');
  final DatabaseReference _priceReference =
      FirebaseDatabase.instance.ref().child('Price');
  var isLoading = false;
  var isLoadingPrice = false;
  bool _isLoading = true;

  var userData = [];
  List<UserModel> userModel = [];
  //price from db
  var priceData = [];
  List<PriceModel> priceModel = <PriceModel>[];
//API
  var coinLists;
  var _listCoin = [];
  // final formatter = intl.NumberFormat.decimalPattern();
  final formatter = intl.NumberFormat("#,##0.0######"); // for price change
  final percentageFormat = intl.NumberFormat("##0.0#"); // for price change
  Timer? _timer;
  int _itemPerPage = 1, _currentMax = 10;

  final ScrollController _scrollController = ScrollController();

  int tableIndex = 0;

  getCoinList() async {
    Dio dio = Dio();
    Response response;
    try {
      response = await dio.get(
          "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=$_itemPerPage&sparkline=false");
      // print("Response data : ${response.data}");
      // _listCoin = _response.data;
      if (_listCoin == null) {
        _listCoin = List.generate(10, (i) => response.data[i]);
      } else {
        int j = 0;
        for (int i = _currentMax; i < _currentMax + 10; i++) {
          _listCoin.add(response.data[j]);
          j++;
        }
      }
      print("Success");
      // updatePrice();
      _isLoading = false;

      setState(() {});
    } on DioError catch (e) {
      String errorMessage = e.response!.data.toString();
      print("Error message : $errorMessage");
      showSimpleNotification(
        Text("Error message : $errorMessage"),
        background: Colors.red,
        autoDismiss: true,
        position: NotificationPosition.bottom,
      );
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

//field for dialog
  String? codeDialog;
  String? valueText;
  final TextEditingController _textFieldController = TextEditingController();
  Future<void> _displayTextInputDialog(
      BuildContext context, String uid, String pairVolDB, String price) async {
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
                  children: <Widget>[
                    const Text("PAIR / VOL"),
                    Text(pairVolDB),
                  ],
                ),
                const SizedBox(height: 8),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      valueText = value;
                      price = value;
                    });
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
                  setState(() {
                    //_textFieldController.text = '';
                    Navigator.pop(context);
                  });
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                child: const Text(
                  'OK',
                  style: TextStyle(color: kSecondColor),
                ),
                onPressed: () {
                  setState(() {
                    codeDialog = valueText;

                    if (_textFieldController.text.isNotEmpty) {
                      updatePrice(uid, pairVolDB);
                    } else {
                      showSimpleNotification(
                        const Text("Please enter price"),
                        background: Colors.red,
                        autoDismiss: true,
                        position: NotificationPosition.bottom,
                      );
                    }
                  });
                },
              ),
            ],
          );
        });
  }

  String idGenerator() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  Future<void> updatePrice(String uid, String pairName) async {
    double baughtPrice = double.parse(codeDialog!);
    PriceModel priceModel = PriceModel.withId(
      idGenerator(),
      pairName,
      baughtPrice.toString(),
    );
    if (user != null) {
      await storage
          .storePriceData(
        priceModel,
        uid,
        pairName,
      )
          .then((value) {
        Navigator.pop(context);
      });
    } else {
      showSimpleNotification(
        const Text("Error. Try saving again"),
        background: Colors.red,
        autoDismiss: true,
        position: NotificationPosition.bottom,
      );
    }
  }

// Function to calculate Profit.
  double profit(double cp, bp) {
    double profit = bp - cp;
    return profit;
  }

  // Function to calculate Loss.
  double loss(double cp, bp) {
    double loss = cp - bp;
    return loss;
  }

  @override
  void initState() {
    super.initState();

    user = _auth.currentUser;
    if (user != null) {
      getCurrentUser();
      //GETTING COINS
      _scrollController.addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          _getMoreData();
        }
      });
      getCoinList();
    } else {
      print('No User Found');
    }
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: kPrimaryColor,
      appBar: AdaptiveNavBar(
        elevation: 0.0,
        toolbarHeight: 150,
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        screenWidth: sw,
        centerTitle: false,
        title: ResponsiveLayout.isSmallScreen(context)
            ? Image.asset(
                'assets/images/dclogo.png',
                width: 120,
                height: 120,
                isAntiAlias: true,
                fit: BoxFit.fill,
              )
            : Image.asset(
                'assets/images/dclogo.png',
                width: 250,
                height: 250,
                isAntiAlias: true,
                fit: BoxFit.cover,
              ),
        navBarItems: const <NavBarItem>[],
      ),
      body: _isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: DataTable2(
                headingRowColor: MaterialStateProperty.all(kPrimaryColor),
                headingTextStyle: const TextStyle(color: kSecondColor),
                columnSpacing: 12,
                horizontalMargin: 12,
                showBottomBorder: true,
                showCheckboxColumn: true,

                //minWidth: 600,
                columns: [
                  const DataColumn2(
                    label: Text('Id'),
                    size: ColumnSize.S,
                    // fixedWidth: 24.0,
                  ),
                  const DataColumn2(
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
                        const Text('Pair / Vol'),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (tableIndex >= 1) {
                                    tableIndex--;
                                    for (int i = 0; i < userModel.length; i++) {
                                      getCurrentUserPrice(userModel[i].id!,
                                          "${_listCoin[tableIndex]['symbol'].toUpperCase()}/USD");
                                    }
                                  }
                                });
                              },
                              child: const Icon(
                                Icons.arrow_left_rounded,
                                color: kSecondColor,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  tableIndex++;

                                  for (int i = 0; i < userModel.length; i++) {
                                    getCurrentUserPrice(userModel[i].id!,
                                        "${_listCoin[tableIndex]['symbol'].toUpperCase()}/USD");
                                  }

                                  if (tableIndex == 10) {
                                    tableIndex = 0;
                                  }
                                });
                              },
                              child: const Icon(
                                Icons.arrow_right_rounded,
                                color: kSecondColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const DataColumn2(
                    size: ColumnSize.M,
                    label: Text('Buy Price'),
                  ),
                  const DataColumn2(
                    size: ColumnSize.M,
                    label: Text('Current Price'),
                  ),
                  const DataColumn2(
                    size: ColumnSize.M,
                    label: Text('Profit / Loss'),
                  ),
                  const DataColumn2(
                    size: ColumnSize.M,
                    label: Text('Modify'),
                  ),
                ],
                rows: List<DataRow>.generate(
                  userModel.length,
                  (index) => DataRow(
                    cells: [
                      //index
                      DataCell(Text("${index + 1}")),
                      //email
                      DataCell(Text(userModel[index].email)),
                      //pair-vol
                      DataCell(
                        Container(
                          // height: 50,
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          // margin: EdgeInsets.symmetric(vertical: 5),
                          decoration:
                              const BoxDecoration(color: Colors.white24),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 5),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${_listCoin[tableIndex]['symbol'].toUpperCase()}/USD",
                                  ),
                                  //Volume
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      "Vol: \$ ${_listCoin[tableIndex]['total_volume']}",
                                      style: const TextStyle(
                                          fontSize: 10, color: kPrimaryColor),
                                    ),
                                  ),
                                  // (_listCoin[tableIndex]['price_change_24h'] >
                                  //         0)
                                  //     ? Row(
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.start,
                                  //         children: [
                                  //           Icon(Icons.arrow_drop_up_sharp,
                                  //               color: Colors.green[600]),
                                  //           Text(
                                  //             // "${_listCoin[i]['price_change_24h']}",
                                  //             (_listCoin[tableIndex]
                                  //                         ['current_price'] <
                                  //                     2)
                                  //                 ? formatter.format(
                                  //                     _listCoin[tableIndex]
                                  //                         ['price_change_24h'])
                                  //                 : percentageFormat.format(
                                  //                     _listCoin[tableIndex]
                                  //                         ['price_change_24h']),
                                  //             style: const TextStyle(
                                  //                 color: Colors.green,
                                  //                 fontSize: 11),
                                  //           ),
                                  //           Text(
                                  //             " (${percentageFormat.format(_listCoin[tableIndex]['price_change_percentage_24h'])}%)",
                                  //             style: const TextStyle(
                                  //                 color: Colors.green,
                                  //                 fontSize: 11),
                                  //           ),
                                  //         ],
                                  //       )
                                  //     : Row(
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.start,
                                  //         children: [
                                  //           const Icon(
                                  //               Icons.arrow_drop_down_sharp,
                                  //               color: Colors.red),
                                  //           Text(
                                  //             // "${_listCoin[i]['price_change_24h']}",
                                  //             (_listCoin[tableIndex]
                                  //                         ['current_price'] <
                                  //                     2)
                                  //                 ? formatter.format(
                                  //                     _listCoin[tableIndex]
                                  //                         ['price_change_24h'])
                                  //                 : percentageFormat.format(
                                  //                     _listCoin[tableIndex]
                                  //                         ['price_change_24h']),
                                  //             style: const TextStyle(
                                  //                 color: Colors.red,
                                  //                 fontSize: 10.5),
                                  //           ),
                                  //           Text(
                                  //             " (${percentageFormat.format(_listCoin[tableIndex]['price_change_percentage_24h'])}%)",
                                  //             style: const TextStyle(
                                  //                 color: Colors.red,
                                  //                 fontSize: 11),
                                  //           ),
                                  //         ],
                                  //       ),
                                ],
                              ),
                              //  Spacer(),
                            ],
                          ),
                        ),
                      ),
                      //TODO:Buy Price
                      DataCell(
                        isLoadingPrice == true && isLoading == true
                            ? Text(
                                "${_listCoin[tableIndex]['symbol'].toUpperCase()}/USD" ==
                                        "${priceData[index]['pairName']}"
                                    ? "\$${priceData[index]['buyPrice']} ${priceData[index]['pairName']} "
                                    : '--',
                                style: const TextStyle(fontSize: 13.5),
                              )
                            : const CircularProgressIndicator(),
                      ),
                      //Current Price
                      DataCell(
                        Container(
                          width: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  "\$ ${formatter.format(_listCoin[tableIndex]['current_price'])}",
                                  style: const TextStyle(fontSize: 13.5),
                                ),
                              ),
                              const SizedBox(height: 3),
                              Row(
                                children: [
                                  const Text("High",
                                      style: TextStyle(fontSize: 8)),
                                  const Spacer(),
                                  Text(
                                    "\$${_listCoin[tableIndex]['high_24h']}",
                                    style: const TextStyle(
                                        fontSize: 9, color: Colors.green),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text("Low",
                                      style: TextStyle(fontSize: 8)),
                                  const Spacer(),
                                  Text(
                                    "\$${_listCoin[tableIndex]['low_24h']}",
                                    style: const TextStyle(
                                        fontSize: 9, color: Colors.red),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      //Profit Loss
                      DataCell(
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            // margin: EdgeInsets.symmetric(vertical: 5),
                            decoration:
                                const BoxDecoration(color: Colors.white24),
                            child: Container()),
                      ),
                      //Edit
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: DefaultButton(
                            press: () {
                              setState(() {
                                _displayTextInputDialog(
                                  context,
                                  userModel[index].id!,
                                  "${_listCoin[tableIndex]['symbol'].toUpperCase()}/USD",
                                  "${priceData[index]['buyPrice']}",
                                );
                              });
                            },
                            text: 'Edit',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  //Get Users

  Future<void> getCurrentUser() async {
    _databaseReference.onValue.listen((DatabaseEvent event) {
      var snapshot = event.snapshot;

      userData.clear();
      userModel.clear();

      for (var data in snapshot.children) {
        userData.add(data.value);
      }

      setState(() {
        if (snapshot.exists && userData.isNotEmpty) {
          for (int x = 0; x < userData.length; x++) {
            String id = userData[x]['id'].toString();
            String name = userData[x]['userName'];
            String phone = userData[x]['phone'];
            String email = userData[x]['email'];
            //String address = userData[x]['address'];
            String photoUrl = userData[x]['photoUrl'];
            String status = userData[x]['status'];
            String token = userData[x]['token'];

            userModel.add(UserModel.editwithId(
              id,
              name,
              phone,
              email,
              photoUrl,
              status,
              token,
            ));

            Future.delayed(const Duration(milliseconds: 200), () {});
            priceData.clear();
            if (userModel.length > 0 && x < userModel.length) {
              getCurrentUserPrice(userModel[x].id!, "BTC/USD");
            }

            print('call');
          }

          isLoading = true;
        } else {
          isLoading = false;
        }
      });
    });
  }

  Future<void> getCurrentUserPrice(String uid, String pair) async {
    _databaseReference
        .child(uid)
        .child('price')
        .onValue
        .listen((DatabaseEvent event) {
      var snapshot = event.snapshot;

      setState(() {
        for (var data in snapshot.children) {
          priceData.add(data.value);
        }

        isLoadingPrice = true;
      });

      // setState(() {
      //   if (snapshot.exists && priceData.isNotEmpty) {
      //     for (int index = 0; index < priceData.length; index++) {
      //       if (priceData[index]['pairName'] == pair) {
      //         String id = priceData[index]['id'].toString();
      //         String pairName = priceData[index]['pairName'];
      //         String price = priceData[index]['buyPrice'];
      //         // print(pairName);
      //         print(priceData[index]['pairName']);
      //         priceModel.add(PriceModel.withId(
      //           id,
      //           pairName,
      //           price,
      //         ));
      //         isLoadingPrice = true;
      //       }
      //     }
      //   } else {
      //     isLoadingPrice = false;
      //   }
      // });
    });
  }
}
