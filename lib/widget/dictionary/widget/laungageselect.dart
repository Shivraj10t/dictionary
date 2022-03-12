import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LaungageSelect extends StatefulWidget {
  const LaungageSelect({
    Key? key,
  }) : super(key: key);

  @override
  State<LaungageSelect> createState() => _LaungageSelectState();
}

class _LaungageSelectState extends State<LaungageSelect> {
  @override
  String url = "https://jsonplaceholder.typicode.com/todos";
  late final List data;

  Future<String> getSwdata() async {
    var res = await http.get(Uri.parse(Uri.encodeFull(url)),
        headers: {"Accept": "application/json"});
    var resBody = jsonDecode(res.body);
    setState(() {
      data = resBody;
      print(data.map((e) => e['title']).toList());
    });
    return "sucess";
  }

  @override
  void initState() {
    super.initState();
    getSwdata();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 11,
        decoration: BoxDecoration(
            color: Colors.brown.shade700,
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "English",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Icon(
              Icons.double_arrow_rounded,
              color: Colors.white,
            ),
            Text(
              "Hindi",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
