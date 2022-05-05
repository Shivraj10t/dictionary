import 'dart:convert';

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

  var objmemberId;
  var objmemdetails;
  dynamic details;
  TextStyle style = TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  late String name, email, mobile;
  get() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    try {
      objmemberId = sharedPreferences.getString('memberId');
      objmemdetails = sharedPreferences.getString('MemberDetails');
      details = jsonDecode(objmemdetails);
      setState(() {});
      name = details['fullName'];
      email = details['email'];
      mobile = details['mobile'];
      // setState(() {});
    } catch (e) {}

     
  }

  logout() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove('memberId');
    sharedPreferences.remove('MemberDetails');
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ));
  }

  @override
  void setState(VoidCallback fn) {
    get();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                //  color: Colors.amber,
                borderRadius: BorderRadius.circular(200),
              ),
            ),
            Card(
              child: SizedBox(
                //   color: Colors.grey.shade50,
                height: 450,
                width: 400,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text("Name :"),
                        Text(
                          name,
                          style: style,
                        ),
                      ],
                    ),
                    Text(
                      email,
                      style: style,
                    ),
                    Text(
                      mobile,
                      style: style,
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  logout();
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.indigo,
                    ),
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )))
          ],
        ),
      ),
    );
  }
}
