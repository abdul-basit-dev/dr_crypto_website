import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:dr_crypto_website/constant.dart';
import 'package:dr_crypto_website/screens/responsive_screen.dart';
import 'package:dr_crypto_website/utils/responsive_layout.dart';

import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  static String routeName = "/";
  Dashboard({Key? key}) : super(key: key);
  ScrollController scrollcontrol = ScrollController();
  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AdaptiveNavBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          toolbarHeight: 150,
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
          navBarItems: [
            NavBarItem(
              text: "Home",
              onTap: () {
                //Navigator.pushNamed(context, "routeName");
                double startpositon = scrollcontrol.position.minScrollExtent;
                scrollcontrol.position.jumpTo(startpositon);
              },
            ),
            NavBarItem(
              text: "Services",
              onTap: () {
                double servicespositon = 610.0;
                scrollcontrol.position.jumpTo(servicespositon);
                //Navigator.pushNamed(context, "routeName");
              },
            ),
            NavBarItem(
              text: "About",
              onTap: () {
                double servicespositon = 1210.0;
                scrollcontrol.position.jumpTo(servicespositon);
                // Navigator.pushNamed(context, "routeName");
              },
            ),
            NavBarItem(
              text: "Try App",
              onTap: () {
                double servicespositon = 1810.0;
                scrollcontrol.position.jumpTo(servicespositon);
                //Navigator.pushNamed(context, "routeName");
              },
            ),
            NavBarItem(
              text: "Contact",
              onTap: () {
                double endposition = scrollcontrol.position.maxScrollExtent;
                scrollcontrol.position.jumpTo(endposition);
                // Navigator.pushNamed(context, "routeName");
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          controller: scrollcontrol,
          child: Column(
            children: const [
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
