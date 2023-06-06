import 'dart:async';

import 'package:dr_crypto/constant.dart';
import 'package:dr_crypto/models/user_model.dart';
import 'package:dr_crypto/screens/admin/full_page_image.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:overlay_support/overlay_support.dart';


import '../../utils/storage.dart';

class NewRequests extends StatefulWidget {
  const NewRequests({super.key});

  @override
  State<NewRequests> createState() => _NewRequestsState();
}

class _NewRequestsState extends State<NewRequests> {
  //Database
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  Storage storage = Storage();
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child('Users');
  var isLoading = false;
  var userData = [];
  List<UserModel> userModel = [];
  int tableIndex = 0;
  @override
  void initState() {
    super.initState();
    //priceData.clear();
    user = _auth.currentUser;
    if (user != null) {
      getCurrentUser();
    } else {
      print('No User Found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: userModel.isEmpty
                  ? const Center(
                      child: Text('No New Requests'),
                    )
                  : DataTable2(
                      headingRowColor: MaterialStateProperty.all(kPrimaryColor),
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
                          size: ColumnSize.M,
                          label: Text('Payment status'),
                        ),
                        DataColumn2(
                          size: ColumnSize.M,
                          label: Text('Payment Image'),
                        ),
                        DataColumn2(
                          size: ColumnSize.L,
                          label: Text('Action'),
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
                            //payment status
                            DataCell(userModel[index].status != 'true'
                                ? const Text(
                                    'Pending',
                                    style: TextStyle(
                                      color: Colors.amber,
                                    ),
                                  )
                                : const Text(
                                    'Approved',
                                    style: TextStyle(
                                      color: Colors.green,
                                    ),
                                  )),
                            DataCell(InkWell(
                                onTap: () {
                                  print('Clicked');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FullPageImage(
                                          image:
                                              userModel[index].screentshotUrl,
                                        ),
                                      ));
                                },
                                child: Image.network(
                                    userModel[index].screentshotUrl))),
                            //Edit
                            DataCell(
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Visibility(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              disabledForegroundColor: Colors.red.withOpacity(0.38), disabledBackgroundColor: Colors.red.withOpacity(0.12),
                                              textStyle: const TextStyle(
                                                fontFamily: 'Poppins-Bold',
                                                fontSize: 18,
                                                color: Color(0xffffffff),
                                                height: 1.2,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              side: const BorderSide(
                                                  color: Colors.red),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8.0))),
                                              minimumSize: Size.infinite,
                                              maximumSize: Size.infinite),
                                          onPressed: () {
                                            userModel[index].status == 'false'
                                                ? updateStatus(
                                                    userModel[index].id!,
                                                    'false',
                                                    "Account Denied")
                                                : () {};
                                          },
                                          child: Text(
                                              userModel[index].status == 'false'
                                                  ? 'Rejected'
                                                  : 'Reject'),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Visibility(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: kPrimaryColor,
                                              disabledForegroundColor: kPrimaryColor.withOpacity(0.38), disabledBackgroundColor: kPrimaryColor.withOpacity(0.12),
                                              textStyle: const TextStyle(
                                                fontFamily: 'Poppins-Bold',
                                                fontSize: 18,
                                                color: Color(0xffffffff),
                                                height: 1.2,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              side: const BorderSide(
                                                  color: kPrimaryColor),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8.0))),
                                              minimumSize: Size.infinite,
                                              maximumSize: Size.infinite),
                                          onPressed: () {
                                            userModel[index].status != 'true'
                                                ? updateStatus(
                                                    userModel[index].id!,
                                                    'true',
                                                    "Account Approved")
                                                : () {};
                                          },
                                          child: Text(
                                              userModel[index].status != 'true'
                                                  ? 'Approve'
                                                  : 'Approved'),
                                        ),
                                      ),
                                    ),
                                  ],
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

  Future<void> updateStatus(String uid, String status, String message) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("Users");
    try {
      await ref.child(uid).update({
        "status": status,
      }).then((value) => {
            showSimpleNotification(
              Text(
                message,
              ),
              background: Colors.green,
              autoDismiss: true,
              position: NotificationPosition.bottom,
            ),
          });

      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }

  //Get Users
  Future<void> getCurrentUser() async {
    setState(() {
      isLoading = true;
    });
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
            if (userData[x]['status'] == 'pending') {
              String id = userData[x]['id'].toString();
              String name = userData[x]['userName'];
              String phone = userData[x]['phone'];
              String email = userData[x]['email'];
              //String address = userData[x]['address'];
              String photoUrl = userData[x]['photoUrl'];
              String status = userData[x]['status'];
              String token = userData[x]['token'];
              String screentshotUrl = userData[x]['screentshotUrl'];
              userModel.add(UserModel.editwithId(id, name, phone, email,
                  photoUrl, status, token, screentshotUrl));

              Future.delayed(const Duration(milliseconds: 200), () {});

              print('call');
            } else {
              print('No Request');
            }
          }

          isLoading = false;
        } else {
          setState(() {
            isLoading = true;
          });
        }
      });
    });
  }
}
