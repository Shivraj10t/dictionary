import 'dart:convert';
import 'dart:developer';

import 'package:dictionary/models/clslanguage.dart';
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
  String? _mySelection;
  Future<ClsMeaning>? meaning;
  List data = []; //edited line
  TextEditingController txtSearch = TextEditingController();
  Future<ClsLanguage> getlanguageList() async {
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

  searchWorld(e) {
    setState(() {
      meaning = ApiMeaning.getMeanning(word: e, idFirst: 1, idSecond: 2);
      inspect('');
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
                child: DropdownButton(
                  items: data.map((item) {
                    return DropdownMenuItem(
                      child: Text(item['item_name']),
                      value: item['id'].toString(),
                    );
                  }).toList(),
                  onChanged: (a) {
                    setState(() {
                      _mySelection = a as String;
                    });
                  },
                  value: _mySelection,
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
                child: Center(
                    child: DropdownButton(
                        // value: widget._s,
                        // onChanged: (value) => ,
                        alignment: Alignment.bottomLeft,
                        dropdownColor: Colors.blueAccent,
                        items: const [
                      DropdownMenuItem(
                        child: Text("Hindi",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text("Tamil"),
                        value: 2,
                      )
                    ])),
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
                      suffixIcon: InkWell(
                          highlightColor: Colors.red,
                          child: const Icon(CupertinoIcons.search),
                          onTap: () {
                            inspect('a');

                            ///
                            FutureBuilder<ClsMeaning>(
                                future: meaning,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    inspect(snapshot.data!.data!.word);
                                    return Text('${snapshot.data!.data!.word}');
                                  } else if (snapshot.hasError) {
                                    return Text('${snapshot.error}');
                                  }

                                  // By default, show a loading spinner.
                                  return const CircularProgressIndicator();
                                });
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
