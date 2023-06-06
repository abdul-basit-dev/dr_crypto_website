import 'dart:async';

import 'package:dr_crypto/constant.dart';

import 'package:dr_crypto/models/user_model.dart';
import 'package:dr_crypto/screens/admin/edit_user_screen.dart';

import 'package:dr_crypto/widgets/default_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

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

  var isLoading = false;
  var isLoadingPrice = false;
  var userData = [];
  List<UserModel> userModel = [];
  int tableIndex = 0;

  @override
  void initState() {
    super.initState();
    //priceData.clear();
    user = _auth.currentUser;

    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == false
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
                      // //pair-vol

                      //Edit
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: DefaultButton(
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditUserInfo(
                                      userName: userData[index]['userName'],
                                      userImage: userData[index]['photoUrl'],
                                      status: userData[index]['status'],
                                      email: userData[index]['email'],
                                      id: userData[index]['id'],
                                    ),
                                  ));
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
            String name = userData[x]['userName'] ?? '';
            String phone = userData[x]['phone'] ?? '';
            String email = userData[x]['email'] ?? '';
            //String address = userData[x]['address'];
            String photoUrl = userData[x]['photoUrl'] ?? '';
            String status = userData[x]['status'] ?? '';
            String token = userData[x]['token'] ?? '';
            String screentshotUrl = userData[x]['screentshotUrl'] ?? '';

            userModel.add(UserModel.editwithId(id, name, phone, email, photoUrl,
                status, token, screentshotUrl));

            Future.delayed(const Duration(milliseconds: 200), () {});

            print('call');
          }

          isLoading = true;
        } else {
          isLoading = false;
        }
      });
    });
  }
}
