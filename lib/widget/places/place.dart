import 'package:dictionary/widget/places/placebody/placebody.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Place extends StatelessWidget {
  const Place({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Place's"),
      ),
      body: const Body(),
    );
  }
}
