import 'dart:async';

import 'package:dictionary/models/clsevents.dart';
import 'package:dictionary/services/eventservices.dart';
import 'package:dictionary/widget/events/eventsdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<ClsEvents>? eventsList;
  late String fromDate =
      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
  late String toDate =
      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';

  @override
  void initState() {
    super.initState();

    eventsList = ApiEvents.getEventList();
  }

  searchEvent(e) {
    setState(() {
      if (e == "") {
        eventsList = ApiEvents.getEventList();
      } else {
        eventsList = ApiEvents.getEventByName(e);
      }
    });
  }

  DateTime _fromDate = DateTime.now();
  DateTime _toDate = DateTime.now();

  Future<void> _selectFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _fromDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _fromDate) {
      setState(() {
        _fromDate = picked;
      });
    }
  }

  Future<void> _selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _toDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _toDate) {
      setState(() {
        _toDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            height: 160,
            child: Container(
              margin: const EdgeInsets.all(15),
              decoration: const BoxDecoration(),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    height: 50,
                    child: TextField(
                      onChanged: (e) {
                        searchEvent(e);
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        label: Text("Search Events"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: TextButton.icon(
                        //       onPressed: () {
                        //         setState(() {
                        //           _selectDate(context);
                        //         });
                        //       },
                        //       icon: const Icon(Icons.date_range),
                        //       label: Text("$_fromDate".split(' ')[0])),
                        // ),
                        Column(
                          children: [
                            const Text(
                              'From Date',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _selectFromDate(context);
                                  fromDate =
                                      '${_fromDate.day}/${_fromDate.month}/${_fromDate.year}';
                                });
                              },
                              child: Text(
                                fromDate,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'To Date',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () {
                                _selectToDate(context);
                                Timer timer =
                                    new Timer(new Duration(seconds: 2), () {
                                  setState(() {
                                    toDate =
                                        '${_toDate.day}/${_toDate.month}/${_toDate.year}';
                                  });
                                });
                                // setState(() {
                                //   toDate =
                                //       '${_toDate.day}/${_toDate.month}/${_toDate.year}';
                                // });
                              },
                              child: Text(
                                toDate,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              height: 50,
            ),
          ),
          SizedBox(
            height: 525,
            child: FutureBuilder<ClsEvents>(
                future: eventsList,
                builder: (context, snapshot) {
                  try {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push<void>(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          EventsDetails(
                                        id: snapshot.data!.data![index].eventId,
                                        date: snapshot.data!.data![index].date,
                                        description: snapshot
                                            .data!.data![index].description,
                                        title:
                                            snapshot.data!.data![index].title,
                                        image: snapshot
                                            .data!.data![index].eventImage,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                            height: 150,
                                            width: 150,
                                            child: Image.network(
                                                "${snapshot.data!.data![index].eventImage}")),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${snapshot.data!.data![index].title}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                          Text(
                                            '${snapshot.data!.data![index].date}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                          SizedBox(
                                            width: 170,
                                            child: Text(
                                              snapshot.data!.data![index]
                                                  .description
                                                  .toString()
                                                  .substring(1),
                                              textAlign: TextAlign.justify,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                            itemCount: snapshot.data!.data!.length),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Icon(
                        CupertinoIcons.wifi_exclamationmark,
                        size: 50,
                        color: Colors.indigoAccent.shade200,
                      ));
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                        color: Colors.deepOrange[200],
                      ));
                    }
                  } catch (e) {}
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
