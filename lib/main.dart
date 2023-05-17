import 'package:dr_crypto/screens/admin/admin_login.dart';

import 'package:dr_crypto/screens/privacy_policy/privacy_policy.dart';
import 'package:dr_crypto/screens/terms_and_conditions/terms_and_conditions.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

import 'screens/dashboard/dashborad.dart';

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
        title: 'Dr Crypto',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: AdminLogin(),
        initialRoute: '/',
        routes: {
          '/': (context) => Dashboard(),
          '/terms_and_conditions': (context) => const TermsAndCondtions(),
          '/privacy_policy': (context) => const PrivacyPolicy(),
          '/admin': (context) => const AdminLogin(),
        },
      ),
    );
  }
}
