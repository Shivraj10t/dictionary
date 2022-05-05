import 'package:dictionary/models/clsmeaning.dart';
import 'package:dictionary/services/meaningservices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DictionaryDetails extends StatefulWidget {
  const DictionaryDetails(
      {Key? key, this.firstlaunguage, this.secondlaunguage, this.word})
      : super(key: key);
  final firstlaunguage;
  final secondlaunguage;
  final word;
  @override
  State<DictionaryDetails> createState() => _DictionaryDetailsState();
}

class _DictionaryDetailsState extends State<DictionaryDetails> {
  late final firLan = widget.firstlaunguage;
  late final seclan = widget.secondlaunguage;
  late final world = widget.word;
  Future<ClsMeaning>? meaning;
  @override
  void initState() {
    super.initState();

    meaning =
        ApiMeaning.getMeanning(idFirst: firLan, idSecond: seclan, word: world);
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    meaning =
        ApiMeaning.getMeanning(idFirst: firLan, idSecond: seclan, word: world);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ClsMeaning>(
        future: meaning,
        // initialData: InitialData,
        builder: (context, snapshot) {
          try {
            if (snapshot.hasData) {
              print(snapshot.data);
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(45),
                      semanticContainer: true,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '${snapshot.data!.data!.wordLanguage}',
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'To',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  '${snapshot.data!.data!.meaningLanguage}',
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${snapshot.data!.data!.word}',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${snapshot.data!.data!.meaning}',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.nosign,
                      size: 50,
                      color: Colors.indigoAccent.shade200,
                    ),
                    const Text('No Data Found...')
                  ],
                )),
              );
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.deepOrange[200],
              ));
            }
          } catch (e) {}

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
