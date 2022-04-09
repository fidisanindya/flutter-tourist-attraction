import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layouting/models/tourism_place.dart';
import 'package:layouting/detail_screen.dart';
import 'package:layouting/list_item.dart';
import 'package:layouting/provider/done_tourism_provider.dart';
import 'package:provider/provider.dart';

class TourismList extends StatefulWidget{
  const TourismList({Key? key}) : super(key: key);

  @override
  _TourismListState createState() => _TourismListState();
}

class _TourismListState extends State<TourismList>{
  final List<TourismPlace> tourismPlaceList = [
    TourismPlace(
        name: 'Submarine Monument Surabaya',
        location: 'Surabaya',
        imageAsset: 'assets/images/submarine.jpg',
        day: 'Every Day',
        time: '08:00 - 16:00',
        price: 'Rp. 10.000',
        description: "Museum inside a decommissioned Russian war submarine with tours & an adjacent park with cafes. Clean and Well maintained. Car park cost 10k, entrance fee 15k/person. You can see KRI Pasopati there, it's a russian whiskey class. You can also watch the video about the Indonesian Navy at the building beside the submarine.",
        subImage1: 'assets/images/monkasel1.jpg',
        subImage2 : 'assets/images/monkasel2.jpg',
        subImage3: 'assets/images/monkasel3.jpg'
    ),
    TourismPlace(
        name: 'House of Saompoerna',
        location: 'Surabaya',
        imageAsset: 'assets/images/sampoerna.jpg',
        day: 'Every Day',
        time: '09:00 - 18:00',
        price: 'Free',
        description: "This museum packs together national history, local economy, and personal stories and presents its collection inside a heritage building that’s a landmark in itself. It represents the story of Indonesia’s earliest and most popular clover cigarette (or kretek) brands, along with the owning family’s wealth and glam — we’re talking Rolls Royce collection and glamorous traditional heirlooms. Tourists can also sign up for their bus tour through the city’s historical landmark called Surabaya Heritage Track.",
        subImage1: 'assets/images/hos1.jpg',
        subImage2 : 'assets/images/hos2.jpg',
        subImage3: 'assets/images/hos3.jpg'
    ),
    TourismPlace(
        name: 'Sanggar Agung Temple',
        location: 'Surabaya',
        imageAsset: 'assets/images/sanggung2.jpg',
        day: 'Every Day',
        time: '09:00 - 17:00',
        price: 'Rp. 15.000',
        description: "This temple, also known as Hong San Tan Temple, is eclectic in its style and function. As a house of worship for Buddhist, Tao, and Kong Hu Cu followers, this temple shows influences from Chinese, Javanese, Balinese, and Thai cultures in its architecture. The grand temple’s complex features a monumental statue of Guan Yin that’s 20 metres tall, supported by gigantic statues of dragons with the sea in the background.",
        subImage1: 'assets/images/sanggung1.jpg',
        subImage2 : 'assets/images/sanggar.jpg',
        subImage3: 'assets/images/sanggung3.jpg'
    ),
    TourismPlace(
        name: 'Heroes Monument',
        location: 'Surabaya',
        imageAsset: 'assets/images/heroes.jpg',
        day: 'Tuesday - Sunday',
        time: '08:00 - 15:00',
        price: 'Rp. 5.000',
        description: "Due to its importance in the movement for independence, Surabaya is nicknamed the ‘City of Heroes’. Not much of the independence struggles can still be seen in the modern city, but the Heroes Monument is an unmissable landmark dedicated to the people who fought for the country. Tourists can also visit the 10 November Museum in the lower part of the monument, commemorating the Battle of Surabaya on 10th November 1945, which is still celebrated nationwide as the Day of Heroes.",
        subImage1: 'assets/images/tupal1.jpg',
        subImage2 : 'assets/images/tupal2.jpg',
        subImage3: 'assets/images/tupal3.jpg'
    ),
    TourismPlace(
        name: 'Suramadu Bridge',
        location: 'Surabaya',
        imageAsset: 'assets/images/suramadu.jpg',
        day: 'Every Day',
        time: 'Every Time',
        price: 'Free',
        description: "Perhaps more than its functionality, this bridge is appreciated for its architectural beauty and constructional feat. Suramadu Bridge, which is the longest in Southeast Asia by far, connects Surabaya with the island of Madura. Not only can you cross over to the previously inaccessible island in about 30 minutes, you’ll also get to enjoy the scenic journey.",
        subImage1: 'assets/images/srmd1.jpg',
        subImage2 : 'assets/images/srmd2.jpg',
        subImage3: 'assets/images/srmd3.jpg'
    ),
    TourismPlace(
        name: 'Cheng Hoo Mosque',
        location: 'Surabaya',
        imageAsset: 'assets/images/chenghoo.jpg',
        day: 'Every Day',
        time: '04:00 - 22:00',
        price: 'Free',
        description: "Surabaya holds a huge Chinese population living and assimilating among locals. This cultural interaction begets unique customs and landmarks, including the Cheng Hoo Mosque, a stunning pagoda-style mosque with a very vivid oriental architecture and Muslim religious symbols. This mosque was built to honour the Chinese admiral who helped spread Islam in the country.",
        subImage1: 'assets/images/cheng1.jpg',
        subImage2 : 'assets/images/cheng2.jpg',
        subImage3: 'assets/images/cheng3.jpg'
    ),
    TourismPlace(
        name: 'Ria Kenjeran Beach',
        location: 'Surabaya',
        imageAsset: 'assets/images/beach.jpg',
        day: 'Every Day',
        time: '09:00 - 18:00',
        price: 'Rp. 15.000',
        description: "Faced with a sprawling and dynamic urban area like Surabaya, people can easily forget the city also has splendid natural beauty. As a coastal town, Surabaya has its share of idyllic beaches, including the popular and well-developed Ria Kenjeran half an hour away from the city centre. Besides the magnificent sunrise and sunset views, the beach area also has various entertainment, rides, facilities, and accommodation.",
        subImage1: 'assets/images/ria1.jpg',
        subImage2 : 'assets/images/ria2.jpg',
        subImage3: 'assets/images/ria3.jpg'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemBuilder: (context, index){
        final TourismPlace place = tourismPlaceList[index];
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailScreen(place: place);
            }));
          },
          child: Consumer<DoneTourismProvider>(
            builder: (context, DoneTourismProvider data, widget){
              return ListItem(
                  place: place,
                  isDone: data.doneTourismPlaceList.contains(place),
                  onCheckboxClick: (bool? value){
                    setState(() {
                      if(value != null){
                        value ? data.doneTourismPlaceList.add(place) : data.doneTourismPlaceList.remove(place);
                      }
                    });
                  }
              );
            }
          )
        );
      },
      itemCount: tourismPlaceList.length,
    );
  }
}