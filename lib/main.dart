import 'package:dictionary/widget/splash/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const SplashSrc());
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String url = "https://owlbot.info/api/v4/dictionary/";
//   String token = "fd6c2e9a8fb520987b703ae7e10b7847701e2b01";

//   TextEditingController textEditingController = TextEditingController();

//   // Stream for loading the text as soon as it is typed
//   late StreamController streamController;
//   late Stream stream;

//   late Timer _debounce;

//   // search function
//   searchText() async {
//     try {
//       print(textEditingController.text);
//       if (textEditingController.text.isEmpty) {
//         streamController.add(null);
//         return;
//       }
//       print("1 c");
//       streamController.add("waiting");
//       http.Response response =
//           await http.get(Uri.parse(url + textEditingController.text),
//               // do provide spacing after Token
//               headers: {"Authorization": "Token " + token});
//       streamController.add(json.decode(response.body));
//       print(response.body);
//       print(streamController.stream);
//     } catch (e) {
//       print("ERROR");
//       print(e);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     streamController = StreamController();
//     stream = streamController.stream;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomAppBar(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             TextButton.icon(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.festival_outlined,
//                   color: Colors.black,
//                 ),
//                 label: const Text("festival")),
//             TextButton.icon(
//               onPressed: () {},
//               icon: const Icon(
//                 CupertinoIcons.calendar_today,
//                 color: Colors.black,
//               ),
//               label: Text("Test"),
//             ),
//             TextButton.icon(
//               onPressed: () {},
//               icon: const Icon(
//                 CupertinoIcons.tree,
//                 color: Colors.black,
//               ),
//               label: Text("Test"),
//             ),
//           ],
//         ),
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.brown.shade900,
//         title: const Text(
//           "Dictionary",
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(80),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   margin: const EdgeInsets.only(left: 12, bottom: 11.0),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(24.0),
//                       color: Colors.white),
//                   child: TextFormField(
//                     onChanged: (String text) {
//                       if (_debounce.isActive) _debounce.cancel();
//                       _debounce = Timer(const Duration(milliseconds: 1000), () {
//                         searchText();
//                       });
//                     },
//                     controller: textEditingController,
//                     decoration: const InputDecoration(
//                       hintText: "Search for a word",
//                       contentPadding: EdgeInsets.only(left: 24.0),

//                       // removing the input border
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin:
//                     const EdgeInsets.only(left: 12, bottom: 15.0, right: 10),
//                 child: IconButton(
//                   icon: const Icon(
//                     CupertinoIcons.search_circle_fill,
//                     color: Colors.white,
//                     size: 40,
//                   ),
//                   onPressed: () {
//                     searchText();
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       body: Container(
//         margin: const EdgeInsets.all(8),
//         child: StreamBuilder(
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.data == null) {
//               return const Center(
//                 child: Text("Enter a search word"),
//               );
//             }
//             if (snapshot.data == "waiting") {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }

//             // output
//             return ListView.builder(
//               itemCount: snapshot.data["definitions"].length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListBody(
//                   children: [
//                     Container(
//                       color: Colors.grey[300],
//                       child: ListTile(
//                         leading: snapshot.data["definitions"][index]
//                                     ["image_url"] ==
//                                 null
//                             ? null
//                             : CircleAvatar(
//                                 backgroundImage: NetworkImage(snapshot
//                                     .data["definitions"][index]["image_url"]),
//                               ),
//                         title: Text(textEditingController.text.trim() +
//                             "(" +
//                             snapshot.data["definitions"][index]["type"] +
//                             ")"),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                           snapshot.data["definitions"][index]["definition"]),
//                     )
//                   ],
//                 );
//               },
//             );
//           },
//           stream: stream,
//         ),
//       ),
//     );
//   }
// }




//
//
//















// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String url = "https://owlbot.info/api/v4/dictionary/";
//   String token = "fd6c2e9a8fb520987b703ae7e10b7847701e2b01";
//   TextEditingController txtSearchController = TextEditingController();
//   late StreamController? streamcontroller;

//   //stream for loading the text as soon as it is type
//   late Stream stream;
//   late Timer timer;
//   //

//   searchtext() async {
//     if (txtSearchController.text.isEmpty) {
//       streamcontroller!.add(null);
//       return;
//     }

//     streamcontroller!.add("Waiting..");

//     http.Response response = await http.get(
//         Uri.parse(url + txtSearchController.text.trim()),
//         headers: {"Authorization": "Token" + token});

//     streamcontroller!.add(jsonDecode(response.body));
//   }

//   @override
//   void initState() {
//     super.initState();
//     streamcontroller = StreamController();
//     stream = streamcontroller!.stream;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.brown.shade900,
//         title: const Text(
//           "Dictionary",
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         bottom: PreferredSize(
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     margin:
//                         const EdgeInsets.only(left: 12, right: 12, bottom: 11),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100),
//                         color: Colors.white),
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                         contentPadding: EdgeInsets.only(left: 24),
//                         hintText: "Search for a word",
//                         border: InputBorder.none,
//                       ),
//                       keyboardType: TextInputType.text,
//                       controller: txtSearchController,
//                       onChanged: (String text) {
//                         if (timer.isActive) timer.cancel();
//                         timer = Timer(const Duration(milliseconds: 1000), () {
//                           searchtext();
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(left: 1, right: 12, bottom: 11),
//                   child: IconButton(
//                     onPressed: () {
//                       searchtext();
//                     },
//                     icon: const Icon(CupertinoIcons.search_circle),
//                     iconSize: 30,
//                     color: Colors.white,
//                   ),
//                 )
//               ],
//             ),
//             preferredSize: const Size.fromHeight(80.0)),
//       ),
//       body: Container(
//         margin: const EdgeInsets.all(8),
//         color: Colors.black,
//         child: StreamBuilder(
//             builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.data == null) {
//             return const Center(
//               child: Text("Enter a search a word"),
//             );
//           }
//           if (snapshot.data == "waiting") {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           return ListView.builder(
//               itemCount: snapshot.data["definitions"].length,
//               itemBuilder: (context, index) {
//                 return ListBody(
//                   children: [
//                     Container(
//                       color: Colors.grey[400],
//                       child: ListTile(
//                         leading: snapshot.data[""][index]["image_url"] == null
//                             ? null
//                             : CircleAvatar(),
//                       ),
//                     )
//                   ],
//                 );
//               });
//         }),
//       ),
//     );
//   }
// }



