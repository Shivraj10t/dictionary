import 'dart:convert';
import 'dart:developer';

import 'package:dictionary/models/clsmeaning.dart';
import 'package:http/http.dart' as http;

class ApiMeaning {
  static Future<ClsMeaning> getMeanning({word, idFirst, idSecond}) async {
    final url = Uri.parse(
      'http://koyaboliapi.pravinbhaiswar.com/api/Meaning/searchmeaning?word=$word&wordLanguage=$idFirst&MeaningLanguage=$idSecond',
    );
//api/Meaning/searchmeaning?word={word}&wordLanguage={wordLanguage}&MeaningLanguage={MeaningLanguage}
    var response = await http.get(url);
    inspect(response);
    if (response.statusCode == 200) {
      return ClsMeaning.fromJson(json.decode(response.body));
    } else {
      return throw Exception("Api error");
    }
  }
}
