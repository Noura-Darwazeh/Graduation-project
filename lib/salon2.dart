import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:soft/models/salonmodel.dart';
import 'package:soft/product_page.dart';

import 'package:soft/products.dart';
import 'package:soft/salon_page.dart';
import 'package:soft/salonmodel.dart';
import 'package:soft/walaaface.dart';
import 'package:soft/walaahair.dart';
import 'package:soft/walaainfo.dart';
import 'package:soft/walaanails.dart';
import 'package:soft/walaaparties.dart';
import 'package:soft/walaaskincare.dart';

class salonsdetails extends StatelessWidget {
  static const String routeName = '/salons-details1';
  Salon salon1;
  final Map<dynamic, dynamic> centre;

  salonsdetails({Key? key, required this.centre, required this.salon1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    salonmodel salon = salonmodel.salons[1];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.phone,
              color: Colors.black,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Phone Number'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(centre['phone']),
                        ],
                      ),
                    );
                  });
            },
          ),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Our Works'),
                        content:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => walahair()));
                            },
                            child: Text('Hair'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => walaface()));
                            },
                            child: Text('Face'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => walaaparties()));
                            },
                            child: Text('Parties'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => (walaskin())));
                            },
                            child: Text('Skin Care'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => walaanails()));
                            },
                            child: Text('Nails'),
                          ),
                        ]),
                      );
                    });
              },
              icon: Icon(
                Icons.photo,
                color: Colors.black,
              ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).accentColor,
                      shape: RoundedRectangleBorder(),
                      padding: EdgeInsets.symmetric(horizontal: 50)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => product_page(
                              centreName: salon1.name,
                            )));
                  },
                  child: Text('Our Products'))
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 50)),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(salon1.imageUrl)),
                )),
            salonsInfo1(salons: salon1, centre: centre),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: salon.tags.length,
              itemBuilder: (context, index) {
                return _buildserviceitem(salon, context, index);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildserviceitem(salonmodel salon, BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              salon.tags[index],
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Colors.pink,
                  ),
            )),
        Column(
          children: salon.Serviceitem.where(
                  (serviceitem) => serviceitem.category == salon.tags[index])
              .map((serviceitem) => Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            serviceitem.name,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '\₪${serviceitem.price}',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 20,
                      ),
                    ],
                  ))
              .toList(),
        ),
      ],
    );
  }
}
