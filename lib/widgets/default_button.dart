import 'package:dr_crypto/constant.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          press();
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: kSecondColor,
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          backgroundColor: kPrimaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
