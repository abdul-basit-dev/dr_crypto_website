import 'package:dr_crypto/constant.dart';
import 'package:flutter/material.dart';

class ReadMoreCard extends StatefulWidget {
  final String title;
  final String description;
  IconData icontype;

  ReadMoreCard(
      {required this.title,
      required this.description,
      required this.icontype}) {
    // TODO: implement ReadMoreCard
  }

  @override
  _ReadMoreCardState createState() => _ReadMoreCardState();
}

class _ReadMoreCardState extends State<ReadMoreCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        color: kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Icon(
                  widget.icontype,
                  size: 55,
                  color: kSecondColor,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                  child: Center(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 18,
                          color: kSecondColor,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
              // ListTile(
              //   title: Text(widget.title),
              // ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        widget.description,
                        maxLines: _isExpanded ? null : 3,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                            fontSize: 16,
                            color: kSecondColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    if (!_isExpanded)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [

                        // padding: const EdgeInsets.only(
                        //     left: 200.0, right: 10, top: 10, bottom: 10),
                       Text(
                          'Read more',
                          style: TextStyle(color: Colors.blue),
                        ),
                        ]
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
