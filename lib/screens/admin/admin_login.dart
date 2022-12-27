import 'package:dr_crypto_website/screens/admin/admin_panel.dart';
import 'package:dr_crypto_website/utils/responsive_layout.dart';
import 'package:dr_crypto_website/widgets/default_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  String? email, password;
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  //firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? uid;
  String? userEmail;

  //check auth
  Future<void> checkAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        if (prefs.getBool('auth') == true) {
          gotoAdminDashboard();
        }
      }
    });
  }

  Future getUser() async {
    // Initialize Firebase

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool authSignedIn = prefs.getBool('auth') ?? false;

    final User? user = _auth.currentUser;

    if (authSignedIn == true) {
      if (user != null) {
        userEmail = user.email;
        print(userEmail);
        if (userEmail == "admin@gmail.com") {
          gotoAdminDashboard();
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor.withOpacity(0.1),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Wrap(
            // height: 72,
            children: [
              Container(
                width: ResponsiveLayout.isSmallScreen(context)
                    ? MediaQuery.of(context).size.width / 2
                    : MediaQuery.of(context).size.width / 3,
                child: Card(
                  elevation: 8,
                  color: kSecondColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            buildEmailFormField(),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8)),
                            buildPasswordFormField(),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 24)),
                            DefaultButton(
                              press: () {
                                signInWithEmailPassword(
                                    emailCtrl.text, passwordCtrl.text);
                              },
                              text: 'Login',
                            ),
                          ]),
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

  //Login with firebaase
  Future<User?> signInWithEmailPassword(String email, String password) async {
    // await Firebase.initializeApp();
    User? user;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;

      if (user != null) {
        uid = user.uid;
        userEmail = user.email;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('auth', true);
        //await _auth.setPersistence(Persistence.LOCAL);
        gotoAdminDashboard();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }

    return user;
  }

  gotoAdminDashboard() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AdminPanel(),
        ));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      cursorColor: kPrimaryColor,
      controller: passwordCtrl,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          ;
          return kPassNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        labelStyle: const TextStyle(color: kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const Icon(
          Icons.lock_rounded,
          color: kPrimaryColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailCtrl,
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          ;
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          ;
          return kInvalidEmailError;
        }
        return null;
      },
      decoration: InputDecoration(
        errorStyle: const TextStyle(color: Colors.red),
        labelText: "Email",
        labelStyle: const TextStyle(color: kPrimaryColor),
        focusColor: kPrimaryColor,
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const Icon(
          Icons.email,
          color: kPrimaryColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
      ),
    );
  }
}
