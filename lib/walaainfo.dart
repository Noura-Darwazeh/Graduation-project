import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:soft/models/salonmodel.dart';
import 'package:soft/product_page.dart';
import 'package:soft/product_page_s.dart';
import 'package:soft/salon_page.dart';
import 'package:soft/salonmodel.dart';
import 'package:soft/salons_tags.dart';

import 'book.dart';
import 'googlemap.dart';
import 'salon_page.dart';

class salonsInfo1 extends StatelessWidget {
  final Salon salons;
  final Map<dynamic, dynamic> centre;
  const salonsInfo1({Key? key, required this.salons, required this.centre})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            centre['name'],
            style: Theme.of(context).textTheme.headline3?.copyWith(
                  color: Colors.pink,
                ),
          ),
          SizedBox(
            height: 10,
          ),
          //    salons_tags(salon:salons),
          SizedBox(
            height: 5,
          ),
          // Text(
          //     'Salon Information',style:
          // Theme.of(context).textTheme.headline5?.copyWith(
          //   color: Colors.black,
          // )),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.location_pin,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MapSample()));
                },
              ),
              Text(centre['city']),
              SizedBox(
                width: 100,
              ),
              Icon(
                Icons.timer,
                color: Colors.blue,
              ),
              Text("${centre['timesOfWork']}"),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink, // Background color
                  onPrimary: Colors.white, // Text Color (Foreground color)
                ),
                child: Text("Booking", style: TextStyle(fontSize: 15)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => book(
                            id: salons.id,
                            owner: salons.owner,
                            time: salons.timesOfWork,
                          )));
                }, //function
              ),
              SizedBox(
                width: 98,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink, // Background color
                  onPrimary: Colors.white, // Text Color (Foreground color)
                ),

                child: Text("Offers", style: TextStyle(fontSize: 15)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => product_page_s()));
                }, //function
              ),
            ],
          )
        ],
      ),
    );
  }
}
