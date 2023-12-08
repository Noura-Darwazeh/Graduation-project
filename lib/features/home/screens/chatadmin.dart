import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:soft/chat/pages/chatpage.dart';
import 'package:soft/models/book.dart';
import 'package:soft/models/firestore_constants.dart';
import 'package:soft/models/salonmodel.dart';
import 'package:soft/providers/booking.dart';
import 'package:soft/providers/user_provider.dart';
import 'package:soft/salonmodel.dart';

class ChatAdmin extends StatefulWidget {
  const ChatAdmin({Key? key}) : super(key: key);

  @override
  State<ChatAdmin> createState() => _ChatAdminState();
}

class _ChatAdminState extends State<ChatAdmin> {
  @override
  void initState() {
    print(Provider.of<UserProvider>(context, listen: false).user.toMap());
    FirebaseFirestore.instance
        .collection(FirestoreConstants.pathMessageCollection)
        .get()
        .then((value) {
      print(value.docs.length);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Booking.getallBookbyowner(
          Provider.of<UserProvider>(context, listen: false).user.id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData && !snapshot.hasError) {
          List data1;

          data1 = snapshot.data;

          List<Book> data = data1.map((e) => Book.fromJson(e)).toList();

          return ListView.builder(
            shrinkWrap: true,
            controller: ScrollController(),
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              var user = Provider.of<UserProvider>(context, listen: false).user;

              return Container(
                height: 220,
                child: Card(
                  margin: EdgeInsets.only(bottom: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //     margin: const EdgeInsets.all(5.0),
                      //     width: double.infinity,
                      //     height: 120,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       image: DecorationImage(
                      //           fit: BoxFit.cover,
                      //           image: NetworkImage(data[index].)),
                      //     )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                        width: .5, color: Colors.red),
                                  ),
                                ),
                                label: Text(
                                  data[index].phone,
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
                                            builder: (context) => HomePageChat(
                                                namme: data[index].service,
                                                senderplusrecieve:
                                                    data[index].owner)));
                                  },
                                  icon: Icon(
                                    Icons.message,
                                    size: 15,
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_pin,
                                size: 20,
                                color: Colors.blue,
                              ),
                              Text(
                                data[index].phone,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
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
    );
  }
}
