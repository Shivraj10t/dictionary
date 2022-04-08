import 'package:dictionary/widget/dictionary/widget/addsbody.dart';
import 'package:dictionary/widget/dictionary/widget/laungageselect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DBody extends StatelessWidget {
  const DBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height / 1.05,
        color: Colors.white70,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 50),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(
              height: 30,
            ),
            LanguageView(),
            SizedBox(
              height: 30,
            ),
            AddsHome()
            // Placeholder()
          ],
        ),
      ),
    );
  }
}
