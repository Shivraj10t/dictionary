import 'package:dictionary/models/ads.dart';
import 'package:dictionary/services/addsservices.dart';
import 'package:flutter/material.dart';

class AddsHome extends StatefulWidget {
  const AddsHome({
    Key? key,
  }) : super(key: key);

  @override
  State<AddsHome> createState() => _AddsHomeState();
}

class _AddsHomeState extends State<AddsHome> {
  Future<ClsAdds>? addsList;

  @override
  void initState() {
    super.initState();
    addsList = ApiAdds.getAddsList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ClsAdds>(
        future: addsList,
        builder: (context, snapshot) {
          return ListView.builder(
              itemBuilder: (context, index) {
                return Text("data");
              },
              itemCount: 5);
        });
  }
}
