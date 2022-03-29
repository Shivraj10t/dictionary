import 'package:dictionary/models/clsplace.dart';
import 'package:dictionary/services/placeservices.dart';
import 'package:dictionary/widget/places/placedetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<ClsPlace>? placeList;
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    super.initState();

    placeList = ApiPlace.getPlaceList();
  }

  searchPlace(e) {
    setState(() {
      if (e == "") {
        placeList = ApiPlace.getPlaceList();
      } else {
        placeList = ApiPlace.getPlaceListByName(e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          decoration: const BoxDecoration(),
          child: TextField(
            onChanged: (e) {
              searchPlace(e);
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Search Places"),
            ),
          ),
          height: 50,
        ),
        FutureBuilder<ClsPlace>(
            future: placeList,
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
                              // print(
                              //     '${snapshot.data!.data![index].placeImage.toString().replaceFirst(RegExp('/'), 'http')}');
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      PlaceDetails(
                                    id: snapshot.data!.data![index].placeId,
                                    description:
                                        snapshot.data!.data![index].description,
                                    title:
                                        snapshot.data!.data![index].placeName,
                                    image:
                                        snapshot.data!.data![index].placeImage,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(1, 2),
                                        blurRadius: 5,
                                        spreadRadius: 1)
                                  ],
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
                                            "${snapshot.data!.data![index].placeImage}")),
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
                                        '${snapshot.data!.data![index].placeName}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                      SizedBox(
                                        width: 170,
                                        child: Text(
                                          snapshot
                                              .data!.data![index].description
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
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                              height: 10,
                            ),
                        itemCount: snapshot.data!.data!.length),
                  );
                } else if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Center(
                        child: Column(
                      children: [
                        Icon(
                          CupertinoIcons.nosign,
                          size: 50,
                          color: Colors.indigoAccent.shade200,
                        ),
                        const Text('No Data Found...')
                      ],
                    )),
                  );
                } else {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.deepOrange[200],
                  ));
                }
                // ignore: empty_catches
              } catch (e) {}
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }),
      ],
    );
  }
}
