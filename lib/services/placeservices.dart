import 'dart:convert';
import 'package:dictionary/models/clsplace.dart';
import 'package:http/http.dart' as http;

class ApiPlace {
  static Future<ClsPlace> getPlaceList() async {
    // print("start");

    //19/09/2021
    final url = Uri.parse(
      'http://koyaboliapi.pravinbhaiswar.com/api/places/loadPlaces',
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return ClsPlace.fromJson(json.decode(response.body));
    } else {
      return throw Exception("Api error");
    }
  }

  static Future<ClsPlace> getPlaceListByName(place) async {
    // print("start");

    //19/09/2021
    final url = Uri.parse(
      'http://koyaboliapi.pravinbhaiswar.com/api/places/SearchPlaces?place=$place',
    );

    var response = await http.get(url);
    print(response);
    if (response.statusCode == 200) {
      return ClsPlace.fromJson(json.decode(response.body));
    } else {
      return throw Exception("Api error");
    }
  }
}
