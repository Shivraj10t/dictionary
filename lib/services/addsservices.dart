import 'dart:convert';
import 'package:dictionary/models/ads.dart';
import 'package:http/http.dart' as http;

class ApiAdds {
  static Future<ClsAdds> getAddsList() async {
    // print("start");

    //19/09/2021
    final url = Uri.parse(
      'http://koyaboliapi.pravinbhaiswar.com/api/advertisement/loadAdvertisement',
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return ClsAdds.fromJson(json.decode(response.body));
    } else {
      return throw Exception("Api error");
    }
  }
}
