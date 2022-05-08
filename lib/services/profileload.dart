import 'dart:convert';

import 'package:dictionary/models/clsprofile.dart';
import 'package:http/http.dart' as http;

class ApiProfile {
  static Future<ClsProfileLoad> profile({id}) async {
    final url = Uri.parse(
      'http://koyaboliapi.pravinbhaiswar.com/api/member/memberDetail?memberId=$id',
    );
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return ClsProfileLoad.fromJson(jsonDecode(response.body));
    } else {
      return throw Exception("Api error");
    }
  }
}
