import 'dart:convert';

import 'package:dictionary/models/ads.dart';
import 'package:http/http.dart' as http;

class ApiAdds {
  static Future<List<ClsAdds>> getAddsList() async {
    // print("start");

    //19/09/2021
    final url = Uri.parse(
      'http://koyaboliapi.pravinbhaiswar.com/api/advertisement/loadAdvertisement',
    );

    var response = await http.get(url);
    //inspect(response.body);
    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      return (res as List).map((e) => ClsAdds.fromJson(e)).toList();
    } else {
      return throw Exception("Api error");
    }
  }
}
// (responseJson['metcheckData']['forecastLocation']['forecast'] as List)
//       .map((p) => Post.fromJson(p))
//       .toList();