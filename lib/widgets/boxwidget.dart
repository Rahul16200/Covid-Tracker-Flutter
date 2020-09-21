import 'package:flutter/material.dart';

class BoxWidget extends StatelessWidget {
  BoxWidget({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          child: Text(text),
          height: 150.0,
          width: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Color(0x709794ad),
              borderRadius: BorderRadius.circular(10.0)),
        )
    );
  }
}