import 'package:dictionary/models/clslanguage.dart';
import 'package:dictionary/services/languageservi.dart';
import 'package:dictionary/widget/dictionary/widget/laungageselect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DBody extends StatelessWidget {
  const DBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.1,
      color: Colors.white70,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 50),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          //   const Spacer(),
          SizedBox(
            height: 30,
          ),
          //MAin Box Container Blue
          LanguageView(),
          Placeholder()
          // SingleChildScrollView(
          //     child: Column(
          //   children: [
          //     Placeholder(),
          //     Placeholder(),
          //   ],
          // )),
        ],
      ),
    );
  }
}
