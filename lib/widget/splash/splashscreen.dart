// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';

import 'dart:io';

import 'package:dictionary/widget/base.dart';
import 'package:dictionary/widget/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashSrc extends StatefulWidget {
  const SplashSrc({Key? key}) : super(key: key);

  @override
  State<SplashSrc> createState() => _SplashSrcState();
}

class _SplashSrcState extends State<SplashSrc> {
  var finalmemberid;
  @override
  void initState() {
    super.initState();

    getValidData().whenComplete(() async {
      Future.delayed(const Duration(seconds: 3), () {
        // print(" Id : $finalmemberid");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => finalmemberid == null
                    ? const LoginPage()
                    : const BaseScreen()));
      });
    });
  }

  Future getValidData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var objmemberId = sharedPreferences.getString('memberId');

    setState(() {
      finalmemberid = objmemberId!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/photo.jpg',
              height: 130,
            ),
            const SizedBox(
              height: 30,
            ),
            if (Platform.isIOS)
              const CupertinoActivityIndicator(
                radius: 15,
              )
            else
              const CircularProgressIndicator(
                color: Colors.indigo,
              )
          ],
        ),
      ),
    );
  }
}
