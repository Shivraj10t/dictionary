// import 'dart:math';

import 'dart:ui';

import 'package:dictionary/widget/dictionary/widget/laungageselect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DictionaryBody extends StatefulWidget {
  const DictionaryBody({
    Key? key,
  }) : super(key: key);

  @override
  State<DictionaryBody> createState() => _DictionaryBodyState();
}

class _DictionaryBodyState extends State<DictionaryBody> {
  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    return Container(
      color: Colors.white12,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const Spacer(),
          Container(
            height: 500,
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.all(25),
            //padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 25,
                ),
                const LaungageSelect(),
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        // color: Colors.amberAccent,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: TextField(
                            keyboardType: TextInputType.multiline,
                            controller: myController,
                            decoration: const InputDecoration(
                                // suffixIcon: Icon(Icons.ac_unit),
                                label: Text("Search.... "),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            onChanged: (value) {
                              setState(() {
                                // myController.text = value;
                                //  print(myController.text);
                              });
                            }),
                      ),
                      const SizedBox(
                        height: 250,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.brown,
                          ),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                CupertinoIcons.search_circle,
                                size: 32,
                                color: Colors.white,
                              )))
                    ],
                  ),
                ),
                // const Spacer(),
                // const Placeholder(),
                // const Spacer(),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class DBody extends StatelessWidget {
  const DBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _s = 0;
    late int a = 0;
    return Container(
      height: MediaQuery.of(context).size.height / 1.1,
      color: Colors.white70,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 50),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //   const Spacer(),
          const SizedBox(
            height: 30,
          ),
          //MAin Box Container Blue
          Container(
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

                      //  fontFamily: Fontfami,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: const [
                //     Text(
                //       "English",
                //       style: TextStyle(
                //           fontStyle: FontStyle.italic,

                //           //  fontFamily: Fontfami,

                //           fontSize: 15,
                //           fontWeight: FontWeight.w300,
                //           color: Colors.white),
                //     ),
                //     Text(
                //       "Marathi",
                //       style: TextStyle(
                //           fontStyle: FontStyle.italic,

                //           //  fontFamily: Fontfami,

                //           fontSize: 15,
                //           fontWeight: FontWeight.w300,
                //           color: Colors.white),
                //     ),
                //   ],
                // ),
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
                      child: Center(
                          child: DropdownButton(
                              value: _s,
                              onChanged: (value) => _s,
                              alignment: Alignment.bottomLeft,
                              dropdownColor: Colors.blueAccent,
                              items: const [
                            DropdownMenuItem(
                              child: Text("English",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              value: 0,
                            ),
                            DropdownMenuItem(
                              child: Text("Tamil"),
                              value: 2,
                            )
                          ])
                          // Text(
                          //   "Marathi",
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.bold, color: Colors.white),
                          // ),
                          ),
                    ),

                    // Container(
                    //   height: 35,
                    //   width: 130,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(2),
                    //     color: Colors.indigo.shade400,
                    //   ),
                    //   child: const Center(
                    //       child: Text(
                    //     "English",
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold, color: Colors.white),
                    //   )),
                    // ),
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
                              value: _s,
                              onChanged: (value) => _s,
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
                          ])
                          // Text(
                          //   "Marathi",
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.bold, color: Colors.white),
                          // ),
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
                    //width: MediaQuery.of(context).size.width / 1.3,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextField(
                        keyboardType: TextInputType.multiline,
                        //  controller: myController,
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                                highlightColor: Colors.red,
                                child: const Icon(CupertinoIcons.search),
                                onTap: () {
                                  print(a++);
                                }),
                            hintText: "Search.... ",
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none
                                // borderRadius:
                                //     BorderRadius.all(Radius.circular(10)),
                                )),
                        onChanged: (value) {
                          // setState(() {
                          //   // myController.text = value;
                          //   //  print(myController.text);
                          // });
                        }),
                  ),
                ),
                //TextBox Container End

                // const Spacer(),
              ],
            ),
          ),
          const Spacer(),
          const SizedBox(
            width: 300,
            child: Placeholder(
              strokeWidth: 0.6,
              color: Colors.amber,
              fallbackWidth: 100,
              fallbackHeight: 300,
            ),
          )
        ],
      ),
    );
  }
}
