import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:dr_crypto_website/constant.dart';
import 'package:dr_crypto_website/screens/responsive_screen.dart';
import 'package:dr_crypto_website/utils/responsive_layout.dart';
import 'package:dr_crypto_website/widgets/navbar.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AdaptiveNavBar(
          backgroundColor: kPrimaryColor,
          screenWidth: sw,
          centerTitle: false,
          title: Image.asset(
            'assets/images/logo.png',
          ),
          navBarItems: [
            NavBarItem(
              text: "Home",
              onTap: () {
                Navigator.pushNamed(context, "routeName");
              },
            ),
            NavBarItem(
              text: "About",
              onTap: () {
                Navigator.pushNamed(context, "routeName");
              },
            ),
            NavBarItem(
              text: "Contact",
              onTap: () {
                Navigator.pushNamed(context, "routeName");
              },
            ),
            NavBarItem(
              text: "App Download",
              onTap: () {
                Navigator.pushNamed(context, "routeName");
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //  NavBar(),
              Body(),
            ],
          ),
        ));
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      largeScreen: LargeChild(),
      smallScreen: SmallChild(),
    );
  }
}
