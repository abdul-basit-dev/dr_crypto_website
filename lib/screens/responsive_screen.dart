import 'package:dr_crypto_website/constant.dart';
import 'package:flutter/material.dart';

import '../widgets/card_widget.dart';
import '../widgets/heading_widget.dart';

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
                      "As the Value goes up,head starts to\nswivels, and spectics soften",
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
        //           HeadingWidget(
        //             textHeading: 'Our Team',
        //             color: kPrimaryColor,
        //             fontsize: 30,
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
                    HeadingWidget(
                      textHeading: 'Connect with us',
                      color: kPrimaryColor,
                      fontsize: 40,
                    ),
                    const SizedBox(height: 20),
                    HeadingWidget(
                      textHeading: 'Twitter',
                      fontsize: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8),
                      child: HeadingWidget(
                        textHeading: 'Facebook',
                        fontsize: 20,
                      ),
                    ),
                    HeadingWidget(
                      textHeading: 'Instragram',
                      fontsize: 20,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingWidget(
                      textHeading: 'Mailing Address',
                      color: kPrimaryColor,
                      fontsize: 20,
                    ),
                    const Text(
                      'abc anywhere St, And city\nState, Country 12345',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    HeadingWidget(
                      textHeading: 'Email Address',
                      color: kPrimaryColor,
                      fontsize: 20,
                    ),
                    const Text(
                      'hello@gmail.com',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    HeadingWidget(
                      textHeading: 'Phone Number',
                      color: kPrimaryColor,
                      fontsize: 20,
                    ),
                    HeadingWidget(
                      textHeading: '(123) 123456',
                    ),
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

          // Container(
          //   height: 600,
          //   color: kSecondColor,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: <Widget>[
          //       const Center(
          //         child: Padding(
          //           padding: EdgeInsets.all(18.0),
          //           child: Text(
          //             'Our Team',
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //               fontSize: 40,
          //               fontWeight: FontWeight.bold,
          //               fontFamily: "Montserrat-Regular",
          //               color: kPrimaryColor,
          //             ),
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(40.0),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Card(
          //               margin: const EdgeInsets.only(bottom: 100),
          //               elevation: 10,
          //               color: kSecondColor,
          //               shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(20)),
          //               child: Image.asset(
          //                 'assets/images/men.png',
          //                 width: MediaQuery.of(context).size.width * 0.30,
          //                 height: MediaQuery.of(context).size.height * 0.3,
          //               ),
          //             ),
          //             const SizedBox(
          //               width: 20,
          //             ),
          //             Card(
          //               margin: const EdgeInsets.only(top: 100),
          //               elevation: 10,
          //               color: kSecondColor,
          //               shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(20)),
          //               child: Image.asset(
          //                 'assets/images/men.png',
          //                 width: MediaQuery.of(context).size.width * 0.30,
          //                 height: MediaQuery.of(context).size.height * 0.3,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
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
                  HeadingWidget(
                    textHeading: 'Twitter',
                    color: kPrimaryColor,
                    fontsize: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: HeadingWidget(
                      textHeading: 'Facebook',
                      color: kPrimaryColor,
                      fontsize: 16,
                    ),
                  ),
                  HeadingWidget(
                    textHeading: 'Instagram',
                    color: kPrimaryColor,
                    fontsize: 16,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  HeadingWidget(
                    textHeading: 'Mailing Address',
                    color: kPrimaryColor,
                    fontsize: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: HeadingWidget(
                      textHeading:
                          'abc anywhere St, And city\nState, Country 12345',
                      fontsize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  HeadingWidget(
                    textHeading: 'Email Address',
                    color: kPrimaryColor,
                    fontsize: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: HeadingWidget(
                      textHeading: 'hello@gmail.com',
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
                      textHeading: '(123) 123456',
                      fontsize: 16,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
