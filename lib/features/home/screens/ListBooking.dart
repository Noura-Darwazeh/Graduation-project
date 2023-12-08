import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:soft/chat/pages/chatpage.dart';
import 'package:soft/features/auth/services/centres.services.dart';
import 'package:soft/models/book.dart';
import 'package:soft/models/salonmodel.dart';
import 'package:soft/order_admin.dart';
import 'package:soft/providers/booking.dart';
import 'package:soft/providers/user_provider.dart';
import 'package:soft/salonmodel.dart';

class ListBooking extends StatefulWidget {
  const ListBooking({Key? key}) : super(key: key);

  @override
  State<ListBooking> createState() => _ListBookingState();
}

class _ListBookingState extends State<ListBooking> {
  late List<Salon> centres = [];
  @override
  void initState() {
    super.initState();
    print(Provider.of<UserProvider>(context, listen: false).user.toMap());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              // "List Of Booking",
              // style: TextStyle(color: Colors.pink, fontSize: 25),
              child: Text(" Orders",
                  style: TextStyle(color: Colors.pink, fontSize: 25)),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => admin()));
              },
            ),
            Text(
              "List Of Booking",
              style: TextStyle(color: Colors.pink, fontSize: 25),
            ),
            Divider(
              height: 5,
              color: Colors.red,
            ),
            StreamBuilder<List<Book>>(
                stream: Booking.getallBookbyowner(
                        Provider.of<UserProvider>(context, listen: false)
                            .user
                            .id)
                    .asStream(),
                builder: (context, snp) {
                  getCentres().then((value) {
                    centres = value.map((e) => Salon.fromMap(e)).toList();
                  });
                  List<Salon> data = [];

                  snp.data!.forEach((e) {
                    data.add(centres.firstWhere((element) {
                      return element.id == e.salonid;
                    }));
                  });
                  // Salon> data = centres
                  //       .where((element) =>
                  //           element.owner ==
                  //           Provider.of<UserProvider>(context, listen: false)
                  //               .user
                  //               .id)
                  //       .toList();
                  print(data.length);
                  return centres.isNotEmpty
                      ? ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snp.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              child: Card(
                                margin: EdgeInsets.only(bottom: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              onPressed: () {},
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
                                                                  senderplusrecieve: snp
                                                                      .data![
                                                                          index]
                                                                      .userId)));
                                                },
                                                icon: Icon(
                                                  Icons.chat,
                                                  size: 30,
                                                  color: Colors.pink,
                                                ))
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // SizedBox(
                                              //   width: 15,
                                              // ),
                                              // // Icon(
                                              // //   Icons.location_pin,
                                              // //   size: 20,
                                              // //   color: Colors.blue,
                                              // // ),
                                              // SizedBox(
                                              //   width: 15,
                                              // ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                " Date : ${snp.data![index].bookDate} ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                " booked at ${snp.data![index].startbook} - ${snp.data![index].endbook}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                " by : ${snp.data![index].username} ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                " service : ${snp.data![index].service} ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                " #person  : ${snp.data![index].nbrpersone} ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                " phone : ${snp.data![index].phone} ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : Center(child: CircularProgressIndicator());
                }),
          ],
        ),
      ),
    );
  }
}
