import 'package:dr_crypto_website/constant.dart';
import 'package:dr_crypto_website/widgets/expendable_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/card_widget.dart';
import '../widgets/heading_widget.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';

class LargeChild extends StatelessWidget {
  const LargeChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          color: kPrimaryColor,
          height: 600,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Empowering you to make informed \ndecisions in the crypto currency market.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat-Regular",
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: HeadingWidget(
                            color: kPrimaryColor,
                            fontsize: 16,
                            textHeading: 'Learn more',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Image.asset(
                  'assets/images/hand.png',
                  alignment: Alignment.bottomRight,
                ),
              ),
            ],
          ),

          // child: Column(
          //   // fit: StackFit.expand,
          //   children: <Widget>[

          //     FractionallySizedBox(
          //       alignment: Alignment.bottomRight,
          //       // widthFactor: .6,
          //       child: Image.asset(
          //         'assets/images/hand.png',
          //       ),
          //     ),
          //     FractionallySizedBox(
          //       alignment: Alignment.centerLeft,
          //       widthFactor: .5,
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: <Widget>[
          //           const Text(
          //             "As the Value goes up,head starts to swivels, and spectics soften",
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //               fontSize: 40,
          //               fontWeight: FontWeight.bold,
          //               fontFamily: "Montserrat-Regular",
          //               color: Colors.white,
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(18.0),
          //             child: Center(
          //               child: ElevatedButton(
          //                 style: ElevatedButton.styleFrom(
          //                   shape: RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.circular(20)),
          //                   backgroundColor: Colors.white,
          //                 ),
          //                 onPressed: () {},
          //                 child: Padding(
          //                   padding: const EdgeInsets.symmetric(
          //                       horizontal: 20, vertical: 10),
          //                   child: HeadingWidget(
          //                     color: kPrimaryColor,
          //                     fontsize: 16,
          //                     textHeading: 'Learn more',
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //           const SizedBox(
          //             height: 40,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        ),
        // end of first screen
        //start of OurTeam section

        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 8.0),
        //   child: Container(
        //     height: 600,
        //     color: kSecondColor,
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 38),
        //       child: Row(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               HeadingWidget(
        //                 textHeading: 'Who are we',
        //                 color: kPrimaryColor,
        //                 fontsize: 30,
        //               ),
        //               SizedBox(
        //                 height: 20,
        //               ),
        //               Text(
        //                 "Dr. Crypto is a cryptocurrency advisory platform that provides end-to-end \nsolutions, from investment to liquidation, for a minimal fee. Initially, we \nstarted off by providing services to our personal contacts through WhatsApp.\n After receiving a great response from our clients, we are now \nlooking to expand with the vision of creating wealth for\n as many people as possible.",
        //                 style: TextStyle(fontWeight: FontWeight.bold),
        //               )
        //             ],
        //           ),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Card(
        //                 margin: const EdgeInsets.only(bottom: 100),
        //                 elevation: 8,
        //                 color: Color(0xFFF0E9E1),
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(20)),
        //                 child: Image.asset(
        //                   'assets/images/men.png',
        //                 ),
        //               ),
        //               const SizedBox(
        //                 width: 30,
        //               ),
        //               Card(
        //                 margin: const EdgeInsets.only(top: 100),
        //                 elevation: 8,
        //                 color: Color(0xFFEAE6E3),
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(20)),
        //                 child: Image.asset(
        //                   'assets/images/men.png',
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        Container(
          height: 700,
          color: kSecondColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            child: Column(
              children: [
                HeadingWidget(
                  textHeading: 'Our Team',
                  color: kPrimaryColor,
                  fontsize: 30,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    // const Spacer(),
                    Expanded(
                      child: Container(
                        width: 350,
                        // height: 300,
                        child: ReadMoreCard(
                            description:
                                'Dr. Crypto is a cryptocurrency advisory platform that provides end-to-end solutions, from investment to liquidation, for a minimal fee. Initially, we started off by providing services to our personal contacts through WhatsApp. After receiving a great response from our clients, we are now looking to \nexpand with the vision of creating wealth for as many people as possible.\nKey Performance Indicators (KPIs)\n60+ Clients \n4 Countries covered',
                            icontype: Icons.groups_outlined,
                            title: "Who are we"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    //  const Spacer(),
                    Expanded(
                      child: Container(
                        width: 360,
                        child: Expanded(
                          child: ReadMoreCard(
                              description:
                                  '1).Free Consultancy:\nWe help first-time investors with expert guidance on the basics and importance of crypto currency investments as an asset class through video communication services.\n2:Advisory Plans: \nSelect our advisory plans, which are based on fundamental analysis of the cryptocurrency market and specific projects by our experienced analysts. We identify investment opportunities with a profit potential ranging from 100 to 1000%, and help simplify tax calculations thereafter. To avail this service, individuals can download our Android application from Google Play.\n3:Training and education:\nOur practical process provides individuals with the opportunity to gain in-depth knowledge and expertise in the dynamic world of cryptocurrency. We provide exclusive and updated news, breaking it down in such a way that even a layman can understand it.',
                              icontype: Icons.workspace_premium_sharp,
                              title: "What we do"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    //  const Spacer(),
                    Expanded(
                      child: Container(
                        width: 350,
                        child: Expanded(
                          child: ReadMoreCard(
                              description:
                                  '1. Decentralization: Cryptocurrencies are not controlled by any central authority, making them more democratic and secure.\n2. Security: Transactions are secured through encryption and other security measures, making it difficult to hack or manipulate the system\n3. No borders: Cryptocurrencies can be used globally, without any restrictions or limitations based on geographical location.\n4. Transparency: Transactions made on a public blockchain are transparent and can be easily tracked, providing greater accountability.\n5. Innovation: Cryptocurrencies and blockchain technology are constantly evolving, creating new opportunities for innovation and growth..',
                              icontype: Icons.question_mark_outlined,
                              title: "Why Cryptocurrency?"),
                        ),
                      ),
                    ),
                    // const Spacer(),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        //third page...
        //Our services..
        Container(
          height: 600,
          color: kSecondColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            child: Column(
              children: [
                HeadingWidget(
                  textHeading: 'Our Services',
                  color: kPrimaryColor,
                  fontsize: 30,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    const Spacer(),
                    CardsWidget(
                      icontype: Icons.message,
                      textHeading: 'App consultancy',
                      discription:
                          'We help you define\nthe best features for your app',
                    ),
                    const Spacer(),
                    CardsWidget(
                      icontype: Icons.category,
                      textHeading: 'Crypto Services',
                      discription:
                          'We provide\noutstanding app\ndesign for your app',
                    ),
                    const Spacer(),
                    CardsWidget(
                      icontype: Icons.add_box,
                      textHeading: 'Subscription',
                      discription:
                          'We help you define\nthe best features for\n your app',
                    ),
                    const Spacer(),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            height: 600,
            color: kPrimaryColor,
            child: Center(
              child: SizedBox(
                width: 800,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 38),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        text: 'Technology ',
                        style: TextStyle(
                          color: kSecondColor,
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                'isnt about the latest\ngadgets or apps. Its about what these things do for people. Its about bringing people together and\n',
                            style: TextStyle(color: kSecondColor, fontSize: 28),
                          ),
                          TextSpan(
                            text: ' making lives better',
                            style: TextStyle(
                                color: kSecondColor,
                                fontSize: 38,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ),
        ),
        // app download conatainer
        Container(
          height: 600,
          color: kSecondColor,
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Image.asset('assets/images/hand.png',
                    alignment: Alignment.centerLeft),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 150),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Download this App",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat-Regular",
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    const Text(
                      " Apps will become even more tailored to individual\n users, with algorithms and machine learning being used\n to create customized experiences based on user \npreferences and behaviors.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat-Regular",
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.20,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/images/playstore.png",
                            height: 30,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            shape: const StadiumBorder(),
                            elevation: 2,
                          ),
                          label: Text("Play Store",
                              style: TextStyle(
                                  color: kSecondColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.20,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/images/appstore.png",
                            height: 30,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            shape: const StadiumBorder(),
                            elevation: 2,
                          ),
                          label: Text(
                            "App Store",
                            style: TextStyle(
                                color: kSecondColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(18.0),
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(20)),
                    //       backgroundColor: Colors.white,
                    //     ),
                    //     onPressed: () {},
                    //     child: Padding(
                    //       padding: const EdgeInsets.symmetric(
                    //           horizontal: 20, vertical: 10),
                    //       child: HeadingWidget(
                    //         color: kPrimaryColor,
                    //         fontsize: 16,
                    //         textHeading: 'Learn more',
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //end of domload container
        SizedBox(
          height: 10,
        ),
        Container(
          height: 600,
          color: kSecondColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 38),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'For any queries or other information \n',
                          style: new TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        new TextSpan(
                          text: 'Contact us',
                          style: new TextStyle(
                              color: kPrimaryColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                    // HeadingWidget(

                    //   textHeading: 'Connect with us',
                    //   color: kPrimaryColor,
                    //   fontsize: 40,
                    // ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () => launchUrl(Uri.parse(
                          "https://twitter.com/doctorcryptolab?t=8FIQIGG_-nIk3AZ1VnxS4Q&s=09")),
                      child: HeadingWidget(
                        textHeading: 'Twitter',
                        fontsize: 20,
                        color: kPrimaryColor,
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 8.0, bottom: 8),
                    //   child: HeadingWidget(
                    //     textHeading: 'Facebook',
                    //     fontsize: 20,
                    //   ),
                    // ),
                    const SizedBox(height: 20),

                    InkWell(
                      onTap: () => launchUrl(Uri.parse(
                          "https://instagram.com/doctorcryptolabs?igshid=YmMyMTA2M2Y")),
                      child: HeadingWidget(
                        textHeading: 'Instragram',
                        fontsize: 20,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // HeadingWidget(
                    //   textHeading: 'Mailing Address',
                    //   color: kPrimaryColor,
                    //   fontsize: 20,
                    // ),
                    // const Text(
                    //   'abc anywhere St, And city\nState, Country 12345',
                    //   style: TextStyle(fontSize: 16, color: Colors.black),
                    // ),
                    // const SizedBox(height: 20),
                    HeadingWidget(
                      textHeading: 'Email Address',
                      color: kPrimaryColor,
                      fontsize: 20,
                    ),
                    InkWell(
                      // onTap:()=>launchUrl(""),
                      child: const Text(
                        'doctorcrypto94@gmail.com',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 20),
                    HeadingWidget(
                        textHeading: 'Phone Number',
                        color: kPrimaryColor,
                        fontsize: 20),
                    HeadingWidget(
                      textHeading: '(+91)9967406320',
                    ),
                    SizedBox(height: 40),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/privacy_policy');
                          },
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: kPrimaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                            width: 30), // Add some spacing between the texts
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/terms_and_conditions');
                          },
                          child: Text(
                            'Terms & Condition',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: kPrimaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class SmallChild extends StatelessWidget {
  const SmallChild({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 600,
            width: double.infinity,
            color: kPrimaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "As the Value goes up,head starts to swivels, and spectics soften",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat-Regular",
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: HeadingWidget(
                      color: kPrimaryColor,
                      fontsize: 16,
                      textHeading: 'Learn more',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/images/hand.png',
                  alignment: Alignment.bottomRight,
                  height: 400,
                ),
              ],
            ),
          ),

          // end of first page...

          Container(
            height: 700,
            color: kSecondColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      'Our Team',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat-Regular",
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),

                //const Spacer(),
                Center(
                  child: Container(
                    width: 300,
                    // height: 300,
                    child: Expanded(
                      child: ReadMoreCard(
                          description:
                              'Dr. Crypto is a cryptocurrency advisory platform that provides end-to-end solutions, from investment to liquidation, for a minimal fee. Initially, we started off by providing services to our personal contacts through WhatsApp. After receiving a great response from our clients, we are now looking to \nexpand with the vision of creating wealth for as many people as possible.\nKey Performance Indicators (KPIs)\n60+ Clients \n4 Countries covered',
                          icontype: Icons.groups_outlined,
                          title: "Who are we"),
                    ),
                  ),
                ),
                //const Spacer(),
                Center(
                  child: Container(
                    width: 300,
                    child: Expanded(
                      child: ReadMoreCard(
                          description:
                              '1).Free Consultancy:\nWe help first-time investors with expert guidance on the basics and importance of crypto currency investments as an asset class through video communication services.\n2:Advisory Plans: \nSelect our advisory plans, which are based on fundamental analysis of the cryptocurrency market and specific projects by our experienced analysts. We identify investment opportunities with a profit potential ranging from 100 to 1000%, and help simplify tax calculations thereafter. To avail this service, individuals can download our Android application from Google Play.\n3:Training and education:\nOur practical process provides individuals with the opportunity to gain in-depth knowledge and expertise in the dynamic world of cryptocurrency. We provide exclusive and updated news, breaking it down in such a way that even a layman can understand it.',
                          icontype: Icons.workspace_premium_sharp,
                          title: "What we do"),
                    ),
                  ),
                ),
                //  const Spacer(),
                Center(
                  child: Container(
                    width: 300,
                    child: Expanded(
                      child: ReadMoreCard(
                          description:
                              '1. Decentralization: Cryptocurrencies are not controlled by any central authority, making them more democratic and secure.\n2. Security: Transactions are secured through encryption and other security measures, making it difficult to hack or manipulate the system\n3. No borders: Cryptocurrencies can be used globally, without any restrictions or limitations based on geographical location.\n4. Transparency: Transactions made on a public blockchain are transparent and can be easily tracked, providing greater accountability.\n5. Innovation: Cryptocurrencies and blockchain technology are constantly evolving, creating new opportunities for innovation and growth..',
                          icontype: Icons.question_mark_outlined,
                          title: "Why Cryptocurrency?"),
                    ),
                  ),
                ),
                const Spacer(),

                // Padding(
                //   padding: const EdgeInsets.all(40.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Card(
                //         margin: const EdgeInsets.only(bottom: 100),
                //         elevation: 10,
                //         color: kSecondColor,
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(20)),
                //         child: Image.asset(
                //           'assets/images/men.png',
                //           width: MediaQuery.of(context).size.width * 0.30,
                //           height: MediaQuery.of(context).size.height * 0.3,
                //         ),
                //       ),
                //       const SizedBox(
                //         width: 20,
                //       ),
                //       Card(
                //         margin: const EdgeInsets.only(top: 100),
                //         elevation: 10,
                //         color: kSecondColor,
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(20)),
                //         child: Image.asset(
                //           'assets/images/men.png',
                //           width: MediaQuery.of(context).size.width * 0.30,
                //           height: MediaQuery.of(context).size.height * 0.3,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          // // our services section..
          Container(
            color: kSecondColor,
            height: 600,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: HeadingWidget(
                        textHeading: 'Our Services',
                        color: kPrimaryColor,
                        fontsize: 40,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CardsWidget(
                          icontype: Icons.message,
                          textHeading: 'App consultancy',
                          discription:
                              'We help you define\nthe best features for your app',
                        ),
                      ),
                      Expanded(
                        child: CardsWidget(
                          icontype: Icons.category,
                          textHeading: 'Crypto Services',
                          discription:
                              'We provide\noutstanding app\ndesign for your app',
                        ),
                      ),
                      Expanded(
                        child: CardsWidget(
                          icontype: Icons.add_box,
                          textHeading: 'Subscription',
                          discription:
                              'We help you define\nthe best features for\n your app',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          //end of our services..

          Container(
            height: 600,
            color: kPrimaryColor,
            child: Center(
              child: SizedBox(
                width: 800,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 38),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        text: 'Technology ',
                        style: TextStyle(
                          color: kSecondColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                'isnt about the latest gadgets or apps. Its about what these things do for people. Its about bringing people together and',
                            style: TextStyle(color: kSecondColor, fontSize: 20),
                          ),
                          TextSpan(
                            text: ' making lives better',
                            style: TextStyle(
                                color: kSecondColor,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ),

          // app download conatainer
          Container(
            height: 600,
            width: double.infinity,
            color: kSecondColor,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Image.asset('assets/images/hand.png',
                      alignment: Alignment.centerLeft),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ignore: prefer_const_constructors
                      Center(
                        child: const Text(
                          "Download this App",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat-Regular",
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      const Text(
                        " Apps will become even more tailored to individual\n users, with algorithms and machine learning being used\n to create customized experiences based on user \npreferences and behaviors.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Montserrat-Regular",
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.30,
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/images/playstore.png",
                              height: 30,
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              shape: const StadiumBorder(),
                              elevation: 2,
                            ),
                            label: Text("Play Store",
                                style: TextStyle(
                                    color: kSecondColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.30,
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/images/appstore.png",
                              height: 30,
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              shape: const StadiumBorder(),
                              elevation: 2,
                            ),
                            label: Text(
                              "App Store",
                              style: TextStyle(
                                  color: kSecondColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(18.0),
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(20)),
                      //       backgroundColor: Colors.white,
                      //     ),
                      //     onPressed: () {},
                      //     child: Padding(
                      //       padding: const EdgeInsets.symmetric(
                      //           horizontal: 20, vertical: 10),
                      //       child: HeadingWidget(
                      //         color: kPrimaryColor,
                      //         fontsize: 16,
                      //         textHeading: 'Learn more',
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),

// app download end

          Container(
            color: kSecondColor,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Center(
                    child: HeadingWidget(
                      textHeading: 'Connect with us',
                      color: kPrimaryColor,
                      fontsize: 40,
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () => launch(
                        "https://twitter.com/doctorcryptolab?t=8FIQIGG_-nIk3AZ1VnxS4Q&s=09"),
                    child: HeadingWidget(
                      textHeading: 'Twitter',
                      color: kPrimaryColor,
                      fontsize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(20.0),
                  //   child: HeadingWidget(
                  //     textHeading: 'Facebook',
                  //     color: kPrimaryColor,
                  //     fontsize: 16,
                  //   ),
                  // ),
                  InkWell(
                    onTap: () => launch(
                        "https://instagram.com/doctorcryptolabs?igshid=YmMyMTA2M2Y"),
                    child: HeadingWidget(
                      textHeading: 'Instagram',
                      color: kPrimaryColor,
                      fontsize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // HeadingWidget(
                  //   textHeading: 'Mailing Address',
                  //   color: kPrimaryColor,
                  //   fontsize: 20,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: HeadingWidget(
                  //     textHeading:
                  //         'abc anywhere St, And city\nState, Country 12345',
                  //     fontsize: 16,
                  //   ),
                  // ),
                  const SizedBox(height: 20),
                  HeadingWidget(
                    textHeading: 'Email Address',
                    color: kPrimaryColor,
                    fontsize: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: HeadingWidget(
                      textHeading: 'doctorcrypto94@gmail.com',
                      fontsize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  HeadingWidget(
                    textHeading: 'Phone Number',
                    color: kPrimaryColor,
                    fontsize: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: HeadingWidget(
                      textHeading: '(+91)9967406320',
                      fontsize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/privacy');
                        },
                        child: Text(
                          'Privacy Policy',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ), // Add some spacing between the texts
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/terms');
                        },
                        child: Text(
                          'Terms & Condition',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
