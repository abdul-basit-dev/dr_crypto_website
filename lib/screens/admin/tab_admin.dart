import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:dr_crypto/screens/admin/admin_login.dart';
import 'package:dr_crypto/screens/admin/admin_panel.dart';
import 'package:dr_crypto/screens/admin/approved_requests.dart';
import 'package:dr_crypto/screens/admin/new_requests.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../utils/responsive_layout.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    user = _auth.currentUser;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  gotoAdminDashboard() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const AdminLogin(),
      ),
      (route) => false,
    );
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
        navBarItems: <NavBarItem>[
          NavBarItem(
            text: "Logout",
            onTap: () {
              if (user != null) {
                _auth.signOut();
                gotoAdminDashboard();
              }
            },
          ),
        ],
        bottom: TabBar(
          automaticIndicatorColorAdjustment: true,
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 5.0,
          tabs: const [
            Tab(text: 'New Approval Requests'),
            Tab(text: 'Portfolio'),
            Tab(text: 'Approved Requests'),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: const [NewRequests(), AdminPanel(), ApprovedRequests()],
      ),
    );
  }
}
