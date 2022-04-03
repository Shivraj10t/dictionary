import 'dart:convert';

import 'package:dictionary/services/register.dart';
import 'package:dictionary/widget/base.dart';
import 'package:dictionary/widget/login/login.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: RegisterBody(),
    );
  }
}

class RegisterBody extends StatefulWidget {
  const RegisterBody({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtmobile = TextEditingController();
  TextEditingController txtfullname = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  TextEditingController txtconpassword = TextEditingController();
  register() async {
    var data = {
      'Email': txtemail.text,
      'Mobile': txtmobile.text,
      'Password': txtpassword.text,
      'FullName': txtfullname.text,
      'DeviceId': 1
    };

    var res = await CallApi().postData(data, "api/member/memberRegistration");
    var body = json.decode(res.body);

    var i = body['status'];

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    var snackBar;
    if (i == 1) {
      // print(body['data']['memberId']);
      String id = body['data']['memberId'].toString();
      sharedPreferences.setString('memberId', id);
      snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content:
            Text('Register Sucess ${sharedPreferences.getString('memberId')}'),
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BaseScreen()));
    } else {
      snackBar = const SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('Invalid User'),
      );
    }

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade100,
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create an Account,Its free",
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
                        label: "Email",
                        t_controller: txtemail,
                        keyboardType: TextInputType.emailAddress),
                    makeInput(
                        label: "Mobile",
                        t_controller: txtmobile,
                        keyboardType: TextInputType.phone),
                    makeInput(label: "Full Name", t_controller: txtfullname),
                    makeInput(
                      label: "Password",
                      obsureText: true,
                      t_controller: txtpassword,
                    ),
                    makeInput(
                        label: "Confirm Pasword",
                        obsureText: true,
                        t_controller: txtconpassword)
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
                      register();
                    },
                    color: Colors.indigoAccent[400],
                    shape: RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.circular(40)),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: const Text(
                      "Login",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget makeInput({label, obsureText = false, t_controller, keyboardType}) {
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
        controller: t_controller,
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
        height: 20,
      )
    ],
  );
}
