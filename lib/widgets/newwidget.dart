
import 'package:flutter/material.dart';
import 'package:covid_app/constants/constants.dart';



class NewWidget extends StatelessWidget {
  NewWidget({this.text,this.numText});

  final String text;
  final String numText;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Center(
        child: Container(
          height: 150.0,
          width: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Color(0xff1d2d50),
              borderRadius: BorderRadius.circular(10.0)),
          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Text(text,
                  style: kDistNumStyle.copyWith(fontSize: 23.0),),
              ),
              SizedBox(height: 10.0,),
              Text('$numText',style:kDistNumStyle ,),
            ],
          ),
        ),
      ),
    );
  }
}