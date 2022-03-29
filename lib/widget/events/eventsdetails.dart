import 'package:flutter/material.dart';

class EventsDetails extends StatefulWidget {
  const EventsDetails({
    Key? key,
    required this.id,
    this.title,
    this.date,
    this.image,
    this.description,
  }) : super(key: key);
  final int? id;
  final String? title;
  final String? date;
  final dynamic image;
  final String? description;
  @override
  State<EventsDetails> createState() => _EventsDetailsState();
}

class _EventsDetailsState extends State<EventsDetails> {
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
            Text(
              '${widget.date}',
              style: const TextStyle(
                fontSize: 14,
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
        ))));
  }
}
