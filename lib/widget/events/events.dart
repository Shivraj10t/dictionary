import 'package:dictionary/widget/events/body/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Event's"),
      ),
      body: const Body(),
    );
  }
}
