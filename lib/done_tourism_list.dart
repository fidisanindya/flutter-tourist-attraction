import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layouting/models/tourism_place.dart';
import 'package:layouting/provider/done_tourism_provider.dart';
import 'package:provider/provider.dart';

class DoneTourismList extends StatelessWidget {
  const DoneTourismList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TourismPlace> doneTourismPlaceList =
        Provider.of<DoneTourismProvider>(
      context,
      listen: false,
    ).doneTourismPlaceList;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Has Been Visited'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final TourismPlace place = doneTourismPlaceList[index];
          return Card(
            color: Colors.white60,
            child: CardDone(place),
          );
        },
        itemCount: doneTourismPlaceList.length,
      ),
    );
  }

  Widget CardDone(place) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Image.asset(place.imageAsset),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  place.name,
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Location: " + place.location),
              ],
            ),
          ),
        ),
        const Icon(Icons.done_outline),
      ],
    );
  }
}
