import 'dart:convert';

import 'package:dictionary/models/clslanguage.dart';
import 'package:http/http.dart' as http;
//  api/language/loadLanguage

class ApiLanguage {
  static Future<ClsLanguage> getLanguageList() async {
    // print("start");

    //19/09/2021
    final url = Uri.parse(
      'http://koyaboliapi.pravinbhaiswar.com/api/language/loadLanguage',
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return ClsLanguage.fromJson(json.decode(response.body));
    } else {
      return throw Exception("Api error");
    }
  }
}
