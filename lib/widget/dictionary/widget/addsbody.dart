import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';

class AddsHome extends StatefulWidget {
  const AddsHome({
    Key? key,
  }) : super(key: key);

  @override
  State<AddsHome> createState() => _AddsHomeState();
}

class _AddsHomeState extends State<AddsHome> {
  List addsList = [];
  @override
  void initState() {
    super.initState();
    getAddsList();
  }

  getAddsList() async {
    try {
      final url = Uri.parse(
        'http://koyaboliapi.pravinbhaiswar.com/api/advertisement/loadAdvertisement',
      );
      var response =
          await http.get(url, headers: {'Aceept': 'application/json'});

      if (response.statusCode == 200) {
        var jsonBody = json.decode(response.body);

        addsList = jsonBody['data'];

        setState(() {});
      } else {
        return throw Exception("Api error");
      }
    } catch (e) {
      addsList = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return addsList.isEmpty
        ? Shimmer.fromColors(
            baseColor: Colors.grey.shade100,
            highlightColor: Colors.grey.shade300,
            child: Container(
              height: 390,
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          )
        : Container(
            height: 390,
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: SingleChildScrollView(
              child: CarouselSlider(
                  items: addsList.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.network(
                          '${i['image']}',
                          height: 500,
                          width: 500,
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 10))),
            ),
          );
  }
}
