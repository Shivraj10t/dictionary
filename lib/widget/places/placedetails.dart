import 'package:flutter/material.dart';

class PlaceDetails extends StatefulWidget {
  const PlaceDetails({
    Key? key,
    this.id,
    this.title,
    this.image,
    this.description,
  }) : super(key: key);
  final int? id;
  final String? title;
  final dynamic image;
  final String? description;
  @override
  State<PlaceDetails> createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${widget.title}'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: SizedBox(
                    child: Image.network(
                  "${widget.image}",
                  width: 400,
                  height: 250,
                )),
              ),
              Text(
                '${widget.title}',
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  '${widget.description}',
                  style: const TextStyle(wordSpacing: 10, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
