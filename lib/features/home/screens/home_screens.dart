import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soft/bottom_bar.dart';
import 'package:soft/chat/pages/chatpage.dart';
import 'package:soft/models/salonmodel.dart';
import 'package:soft/providers/user_provider.dart';

import '../../../main.dart';
import '../../../salon2.dart';
import '../../auth/services/centres.services.dart';
import '../../../NavigationDrawer.dart';
import 'Dashbord.dart';

class salons extends StatefulWidget {
  static const String routeName = '/salons';

  @override
  State<salons> createState() => _salonsState();
}

class _salonsState extends State<salons> {
  late Future<List<dynamic>> centres;
  late String currentCity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentCity = "";
    centres = getCentres();
  }

  @override
  Widget build(BuildContext context) {
    return
        // bottomNavigationBar: bar(),
        // appBar: AppBar(
        //   leading: IconButton(
        //     icon: Icon(Icons.menu),
        //     onPressed: () {},
        //   ),
        //   title: Text(
        //     'Saloonati',
        //     style: TextStyle(
        //       fontWeight: FontWeight.bold,
        //       fontSize: 20,
        //     ),
        //   ),
        //   actions: [
        //     IconButton(
        //       icon: Icon(Icons.logout),
        //       onPressed: () async {
        //         var sp = await SharedPreferences.getInstance();
        //         await sp.setBool('isLogged', false);
        //         Navigator.of(context).pushReplacement(
        //             new MaterialPageRoute(builder: (BuildContext context) {
        //           return MyApp(
        //             isLogged: false,
        //           );
        //         }));
        //       },
        //     ),
        //   ],
        // ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   backgroundColor: Color(0xFFF17532),
        //   child: Icon(Icons.shopping_bag),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // drawer:const NavigationDrawer(),

        SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      //MyWidget:const MyWidget();
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: imageSliders,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cities',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 100,
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                currentCity = "tulkram";
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      border: Border.all(
                                          width: .5, color: Colors.red),
                                    ),
                                    child: Icon(
                                      Icons.pin_drop,
                                      size: 40,
                                      color: currentCity == "tulkram"
                                          ? Colors.red
                                          : Colors.grey,
                                    )),
                                Text(
                                  "Tulkarm",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                currentCity = "Nablus";
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      border: Border.all(
                                          width: .5, color: Colors.red),
                                    ),
                                    child: Icon(
                                      Icons.pin_drop,
                                      size: 40,
                                      color: currentCity == "Nablus"
                                          ? Colors.red
                                          : Colors.grey,
                                    )),
                                Text(
                                  "Nablus",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                currentCity = "Nablus";
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      border: Border.all(
                                          width: .5, color: Colors.red),
                                    ),
                                    child: Icon(
                                      Icons.pin_drop,
                                      size: 40,
                                      color: currentCity == "Ramallah"
                                          ? Colors.red
                                          : Colors.grey,
                                    )),
                                Text(
                                  "Ramallah",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            )),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                currentCity = "jenin";
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      border: Border.all(
                                          width: .5, color: Colors.red),
                                    ),
                                    child: Icon(
                                      Icons.pin_drop,
                                      size: 40,
                                      color: currentCity == "jenin"
                                          ? Colors.red
                                          : Colors.grey,
                                    )),
                                Text(
                                  "Jenin",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                currentCity = "Quds";
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      border: Border.all(
                                          width: .5, color: Colors.red),
                                    ),
                                    child: Icon(
                                      Icons.pin_drop,
                                      size: 40,
                                      color: currentCity == "Quds"
                                          ? Colors.red
                                          : Colors.grey,
                                    )),
                                Text(
                                  "Alquds",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   width: 20,
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    " Salons",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: FutureBuilder(
                      future: centres,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData && !snapshot.hasError) {
                          List data1;
                          if (currentCity != "") {
                            data1 = (snapshot.data as List)
                                .where(
                                    (element) => element['city'] == currentCity)
                                .toList();
                          } else {
                            data1 = snapshot.data;
                          }
                          List<Salon> data =
                              data1.map((e) => Salon.fromMap(e)).toList();

                          return ListView.builder(
                            shrinkWrap: true,
                            controller: ScrollController(),
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index) {
                              var user = Provider.of<UserProvider>(context,
                                      listen: false)
                                  .user;

                              return Container(
                                height: 220,
                                child: Card(
                                  margin: EdgeInsets.only(bottom: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: const EdgeInsets.all(5.0),
                                          width: double.infinity,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    data[index].imageUrl)),
                                          )),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextButton.icon(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              salonsdetails(
                                                                  salon1: data[
                                                                      index],
                                                                  centre: data1[
                                                                      index])));
                                                },
                                                icon: Container(
                                                  width: 25,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.transparent,
                                                    border: Border.all(
                                                        width: .5,
                                                        color: Colors.red),
                                                  ),
                                                ),
                                                label: Text(
                                                  data[index].name,
                                                  style: TextStyle(
                                                    color: Colors.pink,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    print(data[index].id);
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                HomePageChat(
                                                                    namme: data[
                                                                            index]
                                                                        .name,
                                                                    senderplusrecieve:
                                                                        data[index]
                                                                            .owner)));
                                                  },
                                                  icon: Icon(
                                                    Icons.chat,
                                                    size: 30,
                                                    color: Colors.pink,
                                                  ))
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Icon(
                                                Icons.location_pin,
                                                size: 20,
                                                color: Colors.blue,
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                data[index].city,
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 20),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          clipBehavior: Clip.antiAlias,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Image.network(
                item,
                width: 300,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                ),
              ),
            ],
          ),
        ))
    .toList();

final List<String> imgList = [
  'https://images.unsplash.com/photo-1580421383874-7e60f05f64b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
  'https://mostaql.hsoubcdn.com/uploads/thumbnails/835649/5fb1c7c34bc0a/Beauty-Centre-1.jpg',
  // 'https://kevsbest.com/wp-content/uploads/2019/06/Best-Beauty-Services-in-New-York-City.jpg',
  // 'https://selevabeautycenter.com/wp-content/uploads/2018/08/tvm-home.jpg',
  // 'https://blog.evntoo.com/wp-content/uploads/2021/08/%D8%A7%D9%81%D8%B6%D9%84-%D9%85%D9%8A%D9%83%D8%A8-%D8%A7%D8%B1%D8%AA%D8%B3%D8%AA.jpg',
  // 'https://i.pinimg.com/originals/b2/df/d1/b2dfd147a76b650b61f989f8bde3b475.jpg',
  // 'https://www.eqrae.com/wp-content/uploads/2021/12/A-5.jpg',
  // 'https://www.aljazeera.net/wp-content/uploads/2020/08/beauty-4993472_1280.jpg?resize=770%2C513',
  // 'https://i0.wp.com/ejabatalmustaqbal.com/wp-content/uploads/2022/06/%D9%86%D9%82%D8%B4-%D8%AD%D9%86%D8%A7%D8%A1-%D8%A8%D8%B3%D9%8A%D8%B7-%D9%84%D9%84%D8%A7%D8%B5%D8%A7%D8%A8%D8%B9-2022.jpeg?fit=600%2C600&ssl=1',
  // 'https://imagesawe.s3.amazonaws.com/companies/images/2019/10/suhail_bob_beauty_salon.png',
];
