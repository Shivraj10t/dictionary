import 'dart:convert';

import 'package:http/http.dart' as http;

class SaveTransaction {
  final String url = 'http://koyaboliapi.pravinbhaiswar.com/';
  Future postData(data, apiUrl) async {
    final fullUrl = url + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }
}
