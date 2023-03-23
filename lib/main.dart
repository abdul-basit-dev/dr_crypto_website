import 'package:dr_crypto_website/screens/dashborad.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyC4OpK-cEmSXks_odrqt8l33nArF6Vv0W8",
    appId: "1:97891266362:web:81c690f735ff289db12a03",
    messagingSenderId: "97891266362",
    databaseURL: "https://drcrypto-1d034-default-rtdb.firebaseio.com",
    projectId: "drcrypto-1d034",
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  Dashboard(),
      ),
    );
  }
}
