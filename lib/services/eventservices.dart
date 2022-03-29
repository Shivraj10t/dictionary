import 'dart:convert';

import 'package:dictionary/models/clsevents.dart';
import 'package:http/http.dart' as http;

class ApiEvents {
  static Future<ClsEvents> getEventList() async {
    //19/09/2021
    final url = Uri.parse(
      'http://koyaboliapi.pravinbhaiswar.com/api/event/loadTopTen',
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return ClsEvents.fromJson(json.decode(response.body));
    } else {
      return throw Exception("Api error");
    }
  }

  static Future<ClsEvents> getEventByName(eventTitle) async {
    //19/09/2021
    final url = Uri.parse(
      'http://koyaboliapi.pravinbhaiswar.com/api/event/loadEventByName?EventTitle=$eventTitle',
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return ClsEvents.fromJson(json.decode(response.body));
    } else {
      return throw Exception("Api error");
    }
  }
}
