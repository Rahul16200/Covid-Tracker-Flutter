import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  var item;

  Future getData() async {
    http.Response response =
    await http.get('https://api.rootnet.in/covid19-in/stats/latest');
    if (response.statusCode == 200) {
      String data = response.body;

//  Andhra Pradesh.districtData
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

//  Future <dynamic> getJsonData() async {
//    var response = await http.get(
//        'https://api.covid19india.org/v2/state_district_wise.json');
//    if (response.statusCode == 200) {
//      String info = jsonDecode(response.body)[32]['districtData'];
//      return info;
//    } else {
//      print(response.statusCode);
//    }
//  }
}