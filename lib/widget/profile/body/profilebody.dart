import 'dart:developer';

import 'package:dictionary/models/clsprofile.dart';
import 'package:dictionary/services/profileload.dart';
import 'package:dictionary/widget/login/login.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  void initState() {
    super.initState();

    get();
  }

  late String? objmemberId = "";
  Future<ClsProfileLoad>? profile;
  dynamic details;
  TextStyle style = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

  get() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    try {
      objmemberId = sharedPreferences.getString('memberId');
      profile = ApiProfile.profile(id: objmemberId);
      setState(() {});
    } catch (e) {}
  }

  logout() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove('memberId');
    //sharedPreferences.remove('MemberDetails');
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ));
  }
//  @override
//   void setState(VoidCallback fn) {
//     get();
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            label: Row(
              children: const [
                Icon(Icons.directions_outlined),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "LOGOUT",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            onPressed: () {
              logout();
            },
          ),
        ],
      ),
      body: FutureBuilder<ClsProfileLoad>(
          future: profile,
          builder: (context, snapshot) {
            try {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 130),
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              // height: MediaQuery.of(context).size.height / 3.3,
                              height: 220,
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                  color: Colors.indigo.shade50,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      leftBox(),
                                      leftBox(),
                                      leftBox(),
                                      leftBox(),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    height: 330,
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Text(
                                            "${snapshot.data!.data!.fullName} ",
                                            style: style,
                                          ),
                                        ),
                                        Text(
                                          "${snapshot.data!.data!.email}",
                                          style: style,
                                        ),
                                        // Text(
                                        //   "${snapshot.data!.data!.memberId}",
                                        //   style: style,
                                        // ),
                                        Text(
                                          "${snapshot.data!.data!.mobile}",
                                          style: style,
                                        ),
                                        Text(
                                          "${snapshot.data!.data!.expiryStatus}",
                                          style: style,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border(
                                      bottom: BorderSide(color: Colors.black),
                                      top: BorderSide(color: Colors.black),
                                      right: BorderSide(color: Colors.black),
                                      left: BorderSide(color: Colors.black)),
                                  // border: Border(
                                  //   bottom: BorderSide(
                                  //       color: Colors.deepOrange, width: 10),
                                  //   top: BorderSide(
                                  //       color: Colors.deepOrange, width: 5),
                                  //   left: BorderSide(
                                  //       color: Colors.deepOrange, width: 5),
                                  //   right: BorderSide(
                                  //       color: Colors.deepOrange, width: 5),
                                  // ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    });
              }
            } catch (e) {
              inspect(e);
            }

            return const Center(child: CircularProgressIndicator());
          }),
    );

    //  Container(
    //   alignment: Alignment.center,
    //   margin: const EdgeInsets.all(20),
    //   child: Column(
    //     children: [
    //       Container(
    //         height: 150,
    //         width: 150,
    //         decoration: BoxDecoration(
    //           //  color: Colors.amber,
    //           borderRadius: BorderRadius.circular(200),
    //         ),
    //       ),
    //       Card(
    //         child: SizedBox(
    //           //   color: Colors.grey.shade50,
    //           height: 450,
    //           width: 400,
    //           child: Column(
    //             children: [
    //               Text(objmemberId),
    //               Row(
    //                 children: [
    //                   const Text("Name :"),
    //                   Text(
    //                     name,
    //                     style: style,
    //                   ),
    //                 ],
    //               ),
    //               Text(
    //                 email,
    //                 style: style,
    //               ),
    //               Text(
    //                 mobile,
    //                 style: style,
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       TextButton(
    //           onPressed: () {
    //             logout();
    //           },
    //           child: Container(
    //               padding: const EdgeInsets.symmetric(
    //                   vertical: 10, horizontal: 50),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(5),
    //                 color: Colors.indigo,
    //               ),
    //               child: const Text(
    //                 'Logout',
    //                 style: TextStyle(
    //                     color: Colors.white, fontWeight: FontWeight.bold),
    //               )))
    //     ],
    //   ),
    // ),
  }

  Container leftBox() {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      height: 20,
      width: 20,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
    );
  }
}
