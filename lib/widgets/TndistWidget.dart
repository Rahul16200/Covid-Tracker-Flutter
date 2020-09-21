import 'package:flutter/material.dart';

import 'package:covid_app/constants/constants.dart';

//import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TNdistWidget extends StatelessWidget {
  TNdistWidget({this.container});

  final Container container;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Container(
          width: 400,
          height: 60,
          decoration: BoxDecoration(
              color: Color(0xff1d2d50),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'TN District stats',
                style: kTNTitleStyle,
              ),
              SizedBox(
                width: 120.0,
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 30.0,
                color: Colors.white70,
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Scaffold.of(context).showBottomSheet<void>(
          (BuildContext context) {
            return Container(color: Color(0xff726a95), child: container);
          },
        );
      },
    );
  }
}
