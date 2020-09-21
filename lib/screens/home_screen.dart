import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:covid_app/services/network_data.dart';
import 'package:covid_app/constants/constants.dart';
import 'package:covid_app/widgets/Tnbottomsheet.dart';
import 'package:covid_app/widgets/TndistWidget.dart';
import 'package:covid_app/TNDistrictpage/home_page.dart';
import 'package:covid_app/widgets/Ctybottomsheet.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:covid_app/services/list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

NetworkHelper networkHelper = NetworkHelper();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List imgList = [
    'images/1.png',
    'images/2.png',
    'images/3.png',
    'images/4.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerWidget(),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                    fit: FlexFit.loose,
                    child: ClipPath(
                        clipper: OvalBottomBorderClipper(),
                        child: Container(
                            width: 900,
                            height: 400,
                            color: Color(0xff1d2d50),
//
//                            child: CarouselSlider(
//                              options: CarouselOptions(
////                                height: 600,
//
//                                autoPlay: true,
//                              ),
//                              items: [
//                                Container(
////                                  width: 800,
//                                  child: Image.asset(
//                                    'images/1.png',
//                                    fit: BoxFit.cover,
//                                    width: 2000,
//                                    height: 1000,
//                                  ),
//                                ),
//                                Image.asset(
//                                  'images/2.png',
//                                  width: 1000,
//                                  fit: BoxFit.cover,
//                                ),
//                                Image.asset(
//                                  'images/3.png',
//                                  width: 1000,
//                                  fit: BoxFit.cover,
//                                ),
//                                Image.asset(
//                                  'images/4.png',
//                                  width: 1000,
//                                  fit: BoxFit.cover,
//                                ),
//                              ].toList(),
//                            )
                        child: Image.asset('images/2.png'),
                        ))),

                SizedBox(
                  height: 50.0,
                ),
                Container(
                    padding: EdgeInsets.all(10.0),
                    width: 400.0,
                    decoration: BoxDecoration(
//                  color: Color(0x989794ad),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: TNBottomSheetWidget()),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                    padding: EdgeInsets.all(10.0),
                    width: 400.0,
                    decoration: BoxDecoration(
//                  color: Color(0x989794ad),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: CTYBottomSheetWidget()),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  width: 400.0,
                  decoration: BoxDecoration(
//                  color: Color(0x989794ad),
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  ),
                  child: TnDist(),
                ),

//
//
              ]),
        ));
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          color: Color(0xff726a95),
        child: ListView(

          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(child: Text('TN Covid',style: kTNTitleStyle,)),
              decoration: BoxDecoration(
                color: Color(0xff1d2d50),
              ),
            ),

            ListTile(

              title: Text('About Us',style: kTNTitleStyle,),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Share',style: kTNTitleStyle,),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BoxDetails extends StatelessWidget {
  BoxDetails({this.text, this.name});

  final int text;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            name,
            style: kTextStyle,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          '$text',
          style: kNumberStyle,
        ),
        SizedBox(
          height: 40.0,
        ),
      ],
    );
  }
}
