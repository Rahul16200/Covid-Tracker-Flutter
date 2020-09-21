import 'package:flutter/material.dart';
import 'package:covid_app/widgets/newwidget.dart';
import 'package:covid_app/constants/constants.dart';
import 'package:covid_app/services/network_data.dart';

NetworkHelper networkHelper = NetworkHelper();

class CTYBottomSheetWidget extends StatefulWidget {
  @override
  _CTYBottomSheetWidgetState createState() => _CTYBottomSheetWidgetState();
}

class _CTYBottomSheetWidgetState extends State<CTYBottomSheetWidget> {
  int confirm;
  int recovered;
  int deceased;


  var info;

  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI() async {
    info = await networkHelper.getData();
    setState(() {
      confirm = info['data']['regional'][30]['totalConfirmed'];
      recovered = info['data']['regional'][30]['discharged'];
      deceased = info['data']['regional'][30]['deaths'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Container(
          width: 400,
          height: 60,
          decoration: BoxDecoration(
              color: Color(0xff1d2d50),
        borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'India stats',
                style: kTNTitleStyle,
              ),
              SizedBox(width: 163.0,),
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
            return Container(
              height: 400,
              color: Color(0xff726a95),
              child: Container(
                height: 400,
                color: Color(0xff726a95),
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        NewWidget(
                          text: 'Confirm',
                          numText: confirm.toString(),

                        ),
                        NewWidget(text: 'Recovered',
                          numText: recovered.toString(),),
                      ],
                    ),
                    Row(
                      children: [
                        NewWidget(text: 'Deceased',
                          numText: deceased.toString(),),
                      ],
                    ),
//                    GestureDetector(
//                      child: const Text(
//                        'Close BottomSheet',
//                        style: TextStyle(color: Colors.black87),
//                      ),
//                      onTap: () => Navigator.pop(context),
//                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}








