import 'dart:convert';

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
  late List language;
  String _mySelection = '';
  final url = Uri.parse(
    'http://koyaboliapi.pravinbhaiswar.com/api/language/loadLanguage',
  );
  //edited line
  Future<String> getSWData() async {
    var res = await http.get(url, headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);

    setState(() {
      language = resBody.data['data'];
    });

    print(resBody);

    return "Sucess";
  }

  @override
  void initState() {
    super.initState();
    this.getSWData();
    //  language = ApiLanguage.getLanguageList();
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
                child: Center(child: Text('data')),
                // DropdownButton(
                //     value: _s,
                //     onChanged: (value) => _s,
                //     alignment: Alignment.bottomLeft,
                //     dropdownColor: Colors.blueAccent,
                //     items: const [
                //       DropdownMenuItem(
                //         child: Text("English",
                //             style: TextStyle(
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.white)),
                //         value: 0,
                //       ),
                //       DropdownMenuItem(
                //         child: Text("Tamil"),
                //         value: 2,
                //       )
                //     ]),
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
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                          highlightColor: Colors.red,
                          child: const Icon(CupertinoIcons.search),
                          onTap: () {
                            ///
                          }),
                      hintText: "Search.... ",
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none)),
                  onChanged: (value) {}),
            ),
          ),
        ],
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
