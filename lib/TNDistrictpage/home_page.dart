import 'package:flutter/material.dart';
import 'package:covid_app/services/network_data.dart';
import 'package:covid_app/widgets/TndistWidget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:covid_app/constants/constants.dart';

NetworkHelper networkHelper = NetworkHelper();

class TnDist extends StatefulWidget {
  @override
  _TnDistState createState() => _TnDistState();
}

class _TnDistState extends State<TnDist> {
  List datas = [];
  var data;
  final String url = 'https://api.covid19india.org/v2/state_district_wise.json';

  void initState() {
    super.initState();
    finalData();
  }

  void getJsonData() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        datas = jsonDecode(response.body)[32]['districtData'];
//        32.districtData[0].district
//        32.state
      });
      print(datas);
    } else {
      print(response.statusCode);
    }
  }

  Future<void> finalData() async {
    setState(() {
      getJsonData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TNdistWidget(
        container: Container(
          child: Column(
            children: [
              Container(


                child: Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Text(
                    'TamilNadu Districts',
                    style: kDistNumStyle.copyWith(fontSize: 40.0),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              datas.length != 0
                  ? Expanded(
                      child: ListView.builder(
                          itemCount: datas.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                
                                elevation: 10.0,
                                color: Color(0xff1d2d50),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      ExpansionTile(
                                        title: Text(
                                          datas[index]['district'].toString(),
                                          style:kDistNumStyle,
                                        ),
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                    "Confirmed : " +
                                                        datas[index]
                                                                ['confirmed']
                                                            .toString(),
                                                    style:kDistNumStyle
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Text(
                                                    "Recovered : " +
                                                        datas[index]
                                                                ['recovered']
                                                            .toString(),
                                                    style:kDistNumStyle ,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Text(
                                                    "Deceased : " +
                                                        datas[index]['deceased']
                                                            .toString(),
                                                    style: kDistNumStyle,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
//
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  : Center(
                      child:
//
                          Text(
                        'Sorry',
                        style: TextStyle(color: Colors.black, fontSize: 30.0),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
