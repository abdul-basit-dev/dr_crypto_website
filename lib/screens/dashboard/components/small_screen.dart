import 'package:dr_crypto/constant.dart';
import 'package:dr_crypto/widgets/expendable_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/card_widget.dart';
import '../../../widgets/heading_widget.dart';



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
                // const Center(
                //   child: Padding(
                //     padding: EdgeInsets.all(18.0),
                //     child: Text(
                //       'Our Team',
                //       textAlign: TextAlign.center,
                //       style: TextStyle(
                //         fontSize: 40,
                //         fontWeight: FontWeight.bold,
                //         fontFamily: "Montserrat-Regular",
                //         color: kPrimaryColor,
                //       ),
                //     ),
                //   ),
                // ),

                //const Spacer(),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.30,
                    // height: 300,
                    child: ReadMoreCard(
                        description:
                            'Dr. Crypto is a cryptocurrency advisory platform that provides end-to-end solutions, from investment to liquidation, for a minimal fee. Initially, we started off by providing services to our personal contacts through WhatsApp. After receiving a great response from our clients, we are now looking to \nexpand with the vision of creating wealth for as many people as possible.\nKey Performance Indicators (KPIs)\n60+ Clients \n4 Countries covered',
                        icontype: Icons.groups_outlined,
                        title: "Who are we"),
                  ),
                ),
                //const Spacer(),
                Center(
                  child: SizedBox(
                    width: 300,
                    child: ReadMoreCard(
                        description:
                            '1).Free Consultancy:\nWe help first-time investors with expert guidance on the basics and importance of crypto currency investments as an asset class through video communication services.\n2:Advisory Plans: \nSelect our advisory plans, which are based on fundamental analysis of the cryptocurrency market and specific projects by our experienced analysts. We identify investment opportunities with a profit potential ranging from 100 to 1000%, and help simplify tax calculations thereafter. To avail this service, individuals can download our Android application from Google Play.\n3:Training and education:\nOur practical process provides individuals with the opportunity to gain in-depth knowledge and expertise in the dynamic world of cryptocurrency. We provide exclusive and updated news, breaking it down in such a way that even a layman can understand it.',
                        icontype: Icons.workspace_premium_sharp,
                        title: "What we do"),
                  ),
                ),
                //  const Spacer(),
                Center(
                  child: SizedBox(
                    width: 300,
                    child: ReadMoreCard(
                        description:
                            '1. Decentralization: Cryptocurrencies are not controlled by any central authority, making them more democratic and secure.\n2. Security: Transactions are secured through encryption and other security measures, making it difficult to hack or manipulate the system\n3. No borders: Cryptocurrencies can be used globally, without any restrictions or limitations based on geographical location.\n4. Transparency: Transactions made on a public blockchain are transparent and can be easily tracked, providing greater accountability.\n5. Innovation: Cryptocurrencies and blockchain technology are constantly evolving, creating new opportunities for innovation and growth..',
                        icontype: Icons.question_mark_outlined,
                        title: "Why Cryptocurrency?"),
                  ),
                ),
                const Spacer(),

              ],
            ),
          ),
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

          // // our services section..
          Container(
            color: kSecondColor,
            height: 600,
            child: const Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(18.0),
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

        

          // app download conatainer
          Container(
            height: 600,
            width: double.infinity,
            color: kPrimaryColor,
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
                            color: kSecondColor,
                          ),
                        ),
                      ),
                      const SizedBox(
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
                      const SizedBox(
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
                              backgroundColor: kSecondColor,
                              shape: const StadiumBorder(),
                              elevation: 2,
                            ),
                            label: const Text("Play Store",
                                style: TextStyle(
                                    color: kPrimaryColor,
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
                              backgroundColor: kSecondColor,
                              shape: const StadiumBorder(),
                              elevation: 2,
                            ),
                            label: const Text(
                              "App Store",
                              style: TextStyle(
                                  color: kPrimaryColor,
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
                  const SizedBox(
                    height: 10,
                  ),
                  
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
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/privacy');
                        },
                        child: const Text(
                          'Privacy Policy',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ), // Add some spacing between the texts
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/terms');
                        },
                        child: const Text(
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
