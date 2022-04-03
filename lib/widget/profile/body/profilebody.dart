import 'package:dictionary/widget/login/login.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  var objmemberId;

  @override
  void initState() {
    super.initState();
    get();
  }

  get() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    setState(() {
      objmemberId = sharedPreferences.getString('memberId');
    });
  }

  logout() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove('memberId');
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
    setState(() {
      // objmemberId = sharedPreferences.getString('memberId');
    });
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
                color: Colors.amber,
                borderRadius: BorderRadius.circular(200),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Shivraj Tiwaskar $objmemberId',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Card(
              child: Container(
                height: 450,
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
