import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soft/chat/pages/chatpage.dart';
import 'package:soft/features/auth/services/centres.services.dart';
import 'package:soft/models/salonmodel.dart';
import 'package:soft/providers/user_provider.dart';
import 'package:soft/salon2.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late Future<List<dynamic>> centres;
  late String currentCity;

  String fullName = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentCity = "";
    centres = getCentres();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(children: [
        Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search)),
              onChanged: (text) {
                setState(() {
                  fullName = text;
                  //you can access nameController in its scope to get
                  // the value of text entered as shown below
                  //fullName = nameController.text;
                });
              },
            )),
        FutureBuilder(
          future: getCentresbyname(fullName),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData && !snapshot.hasError) {
              List data1;
              data1 = (snapshot.data as List);

              List<Salon> data = data1.map((e) => Salon.fromMap(e)).toList();
              print(data1);
              return ListView.builder(
                shrinkWrap: true,
                controller: ScrollController(),
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  var user =
                      Provider.of<UserProvider>(context, listen: false).user;

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
                          Container(
                              margin: const EdgeInsets.all(5.0),
                              width: double.infinity,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(data[index].imageUrl)),
                              )),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton.icon(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  salonsdetails(
                                                      salon1: data[index],
                                                      centre: data1[index])));
                                    },
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
                                                        namme: data[index].name,
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
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                        fontWeight: FontWeight.normal,
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
      ]),
    ));
  }
}
