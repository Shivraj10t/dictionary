import 'dart:convert';

import 'package:dictionary/services/register.dart';
import 'package:dictionary/widget/base.dart';
import 'package:dictionary/widget/signup/signup.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController txtmobile = TextEditingController();
  TextEditingController textPass = TextEditingController();
  login() async {
    var data = {
      'Mobile': txtmobile.text,
      'Password': textPass.text,
    };

    var res = await CallApi().postData(data, "api/member/memberLogin");
    var body = json.decode(res.body);
    var i = body['status'];
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    var snackBar;
    if (i == 1) {
      sharedPreferences.setString(
          'memberId', body['data']['memberId'].toString());
      print(sharedPreferences.getString('memberId'));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BaseScreen()));
    } else {
      snackBar = const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('Invalid User'),
      );
    }

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      color: Colors.grey.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Column(
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Welcome back ! Login with your credentials",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    makeInput(
                        label: "Mobile No.",
                        controller: txtmobile,
                        keyboardType: TextInputType.phone),
                    makeInput(
                        label: "Password",
                        obsureText: true,
                        controller: textPass),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    // border: Border(
                    //     bottom: BorderSide(color: Colors.black),
                    //     top: BorderSide(color: Colors.black),
                    //     right: BorderSide(color: Colors.black),
                    //     left: BorderSide(color: Colors.black)),
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      login();
                    },
                    color: Colors.indigoAccent[400],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupPage()));
                    },
                    child: const Text(
                      "Sign Up",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget makeInput({label, obsureText = false, controller, keyboardType}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obsureText,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400)),
        ),
      ),
      const SizedBox(
        height: 30,
      )
    ],
  );
}
