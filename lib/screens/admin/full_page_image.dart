import 'package:flutter/material.dart';

class FullPageImage extends StatefulWidget {
  const FullPageImage({super.key, required this.image});
  final String image;
  @override
  State<FullPageImage> createState() => _FullPageImageState();
}

class _FullPageImageState extends State<FullPageImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SizedBox(
        width: double.infinity,
        height: 600,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
          Image.network(
            widget.image,
            width: double.infinity,
            height: 600,
          )
        ]),
      ),
    );
  }
}
