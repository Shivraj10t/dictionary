import 'dart:convert';
import 'dart:developer';

import 'package:dictionary/models/clsmeaning.dart';
import 'package:dictionary/services/meaningservices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LanguageView extends StatefulWidget {
  const LanguageView({
    Key? key,
  }) : super(key: key);

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  String? _mySelection1, _mySelection2;
  Future<ClsMeaning>? meaning;
  List data = []; //edited line
  List languagedata = []; //edited line
  TextEditingController txtSearch = TextEditingController();
  getlanguageList() async {
    final url = Uri.parse(
      'http://koyaboliapi.pravinbhaiswar.com/api/language/loadLanguage',
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var l = json.decode(response.body);

      languagedata = l['data'];
      inspect(languagedata.length);
      for (var i = 0; i < languagedata.length; i++) {
        data.add(languagedata[i]['languageName']);
      }
      _mySelection1 = data[0].toString();
      _mySelection2 = data[0].toString();

      setState(() {});
    } else {
      return throw Exception("Api error");
    }
  }

  searchWorld(e) {
    setState(() {
      meaning = ApiMeaning.getMeanning(word: e, idFirst: 1, idSecond: 2);
    });
  }

  @override
  void initState() {
    super.initState();
    getlanguageList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 500,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Colors.indigo.shade400,

        gradient: LinearGradient(colors: [
          Colors.indigo.shade400,
          Colors.indigo.shade400,
        ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Koyaboli",
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Colors.white),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 35,
                width: 135,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.indigo.shade400,
                ),
                child: DropdownButton<dynamic>(
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                  dropdownColor: Colors.white,
                  focusColor: Colors.red,
                  items: data.map((item) {
                    return DropdownMenuItem(
                      child: Text(
                        item,
                        style: const TextStyle(color: Colors.black),
                      ),
                      value: item,
                    );
                  }).toList(),
                  onChanged: (a) {
                    setState(() {
                      _mySelection1 = a;
                    });
                  },
                  value: _mySelection1,
                ),
              ),
              Container(
                height: 40,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  // color: Colors.white,
                ),
                child: const Center(
                    child: Icon(CupertinoIcons.arrow_left_right_circle,
                        color: Colors.white)),
              ),
              Container(
                height: 35,
                width: 135,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.indigo.shade400,
                ),
                child: DropdownButton<dynamic>(
                  //  underline: SizedBox(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                  dropdownColor: Colors.white,
                  focusColor: Colors.red,
                  items: data.map((item) {
                    return DropdownMenuItem(
                      child: Text(
                        item,
                        style: TextStyle(color: Colors.black),
                      ),
                      value: item,
                    );
                  }).toList(),
                  onChanged: (a) {
                    setState(() {
                      _mySelection2 = a;
                    });
                  },
                  value: _mySelection2,
                ),
              ),
            ],
          ),

          //TextBox Container Start
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextField(
                  controller: txtSearch,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          child: Container(
                              height: 100,
                              decoration: const BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: const Icon(CupertinoIcons.search,
                                  color: Colors.white)),
                          onTap: () {
                            inspect('1: $_mySelection1 || 2: $_mySelection2');
                            inspect(txtSearch.text);
                          }),
                      hintText: "Search.... ",
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none)),
                  onChanged: (value) {
                    searchWorld(value);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
