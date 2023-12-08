import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soft/bottom_bar.dart';
import 'package:soft/cart.dart';
import 'package:soft/chat/services/auth.dart';
import 'package:soft/chat/theme/color.dart';
import 'package:soft/features/home/screens/ListBooking.dart';
import 'package:soft/features/home/screens/chatadmin.dart';
import 'package:soft/features/home/screens/home_screens.dart';
import 'package:soft/features/home/screens/profile.dart';
import 'package:soft/features/home/screens/search.dart';
import 'package:soft/main.dart';
import 'package:soft/providers/user_provider.dart';

import '../../../NavigationDrawer.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool _icon_bool = false;

  IconData _iconlight = Icons.wb_sunny;
  IconData _iconDark = Icons.nights_stay;
  ThemeData _LightTheme = ThemeData(
    primarySwatch: Colors.amber,
    brightness: Brightness.light,
  );
  ThemeData _DarkTheme = ThemeData(
    primarySwatch: Colors.red,
    brightness: Brightness.dark,
  );

  List<Widget> list = [];
  var role;
  int selected = 0;
  showConfirmLogout() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
            title: Text("Would you like to log out?"),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () async {
                  AuthService auth = AuthService();
                  var sp = await SharedPreferences.getInstance();
                  await sp.setBool('isLogged', false);

                  Navigator.of(context).pushReplacement(
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return MyApp(
                      isLogged: false,
                    );
                  }));
                  auth.logOut();
                },
                child: Text(
                  "Log Out",
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    role = Provider.of<UserProvider>(context, listen: false).user.role;
    SharedPreferences.getInstance().then((value) {
      role = value.getString('role');
    });
    // Provider.of<UserProvider>(context, listen: false).setUser(res.body);

    print(role);
    list = [
      role == "user" ? salons() : ListBooking(),
      // RootApp(),
      Profile(),
      Search(),
      salons(),
    ];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _icon_bool ? _DarkTheme : _LightTheme,
        home: Scaffold(
          bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 6.0,
              color: Colors.transparent,
              elevation: 9.0,
              clipBehavior: Clip.antiAlias,
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width / 2 - 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width / 2 - 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            // Icon(Icons.home,color: Color(0xFFEF7532),size: 35,),
                            // Icon(Icons.person_outline,color: Color(0xFFEF7532),size: 35,),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  selected = 0;
                                });
                              },
                              icon: Icon(
                                selected != 0
                                    ? Icons.home_outlined
                                    : Icons.home,
                                size: 35,
                              ),
                              color: Colors.pink,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  selected = 1;
                                });
                              },
                              icon: Icon(
                                selected != 1
                                    ? Icons.person_outline
                                    : Icons.person,
                                size: 35,
                              ),
                              color: Colors.pink,
                            )
                          ],
                        ),
                      ),
                    ),
                    role == "user"
                        ? Expanded(
                            child: Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width / 2 - 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  // Icon(Icons.search,color: Color(0xFFEF7532),size: 35,),
                                  // Icon(Icons.shopping_bag,color: Color(0xFFEF7532),size: 35,),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        selected = 2;
                                      });
                                    },
                                    icon: Icon(
                                      selected != 2
                                          ? Icons.search
                                          : Icons.content_paste_search_rounded,
                                      size: 35,
                                    ),
                                    color: Colors.pink,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // Navigator.of(context).push(
                                      //     MaterialPageRoute(builder: (context) => cart()));
                                      setState(() {
                                        selected = 3;
                                      });
                                    },
                                    icon: Icon(
                                      selected != 3
                                          ? Icons.shopping_bag_outlined
                                          : Icons.shopping_bag,
                                      size: 35,
                                    ),
                                    color: Colors.pink,
                                  )
                                ],
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              )),
          appBar: AppBar(
            backgroundColor: Colors.pink,
            // leading: IconButton(
            //   icon: Icon(Icons.menu),
            //   onPressed: () {},
            // ),
            title: Text(
              'Saloonati',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: () async {
                  showConfirmLogout();
                },
              ),
              IconButton(
                icon: Icon(_icon_bool ? _iconDark : _iconlight),
                onPressed: () {
                  setState(() {
                    _icon_bool = !_icon_bool;
                  });
                },
              ),
            ],
          ),
          drawer: const NavigationDrawer(),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {},
          //   backgroundColor: Color(0xFFF17532),
          //   child: Icon(Icons.shopping_bag),
          // ),
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: list[selected],
        ));

    //  Scaffold(
    //   bottomNavigationBar: BottomAppBar(
    //       shape: CircularNotchedRectangle(),
    //       notchMargin: 6.0,
    //       color: Colors.transparent,
    //       elevation: 9.0,
    //       clipBehavior: Clip.antiAlias,
    //       child: Container(
    //         height: 70,
    //         width: MediaQuery.of(context).size.width / 2 - 40,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.only(
    //               topLeft: Radius.circular(25), topRight: Radius.circular(25)),
    //           color: Colors.white,
    //         ),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Expanded(
    //               child: Container(
    //                 height: 70,
    //                 width: MediaQuery.of(context).size.width / 2 - 40,
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: <Widget>[
    //                     // Icon(Icons.home,color: Color(0xFFEF7532),size: 35,),
    //                     // Icon(Icons.person_outline,color: Color(0xFFEF7532),size: 35,),
    //                     IconButton(
    //                       onPressed: () {
    //                         setState(() {
    //                           selected = 0;
    //                         });
    //                       },
    //                       icon: Icon(
    //                         Icons.home_outlined,
    //                         size: 35,
    //                       ),
    //                       color: Colors.pink,
    //                     ),
    //                     IconButton(
    //                       onPressed: () {
    //                         setState(() {
    //                           selected = 1;
    //                         });
    //                       },
    //                       icon: Icon(
    //                         Icons.person_outline,
    //                         size: 35,
    //                       ),
    //                       color: Colors.pink,
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             role == "user"
    //                 ? Expanded(
    //                     child: Container(
    //                       height: 70,
    //                       width: MediaQuery.of(context).size.width / 2 - 40,
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                         children: <Widget>[
    //                           // Icon(Icons.search,color: Color(0xFFEF7532),size: 35,),
    //                           // Icon(Icons.shopping_bag,color: Color(0xFFEF7532),size: 35,),
    //                           IconButton(
    //                             onPressed: () {
    //                               setState(() {
    //                                 selected = 2;
    //                               });
    //                             },
    //                             icon: Icon(
    //                               Icons.search,
    //                               size: 35,
    //                             ),
    //                             color: Colors.pink,
    //                           ),
    //                           IconButton(
    //                             onPressed: () {
    //                               // Navigator.of(context).push(
    //                               //     MaterialPageRoute(builder: (context) => cart()));
    //                               setState(() {
    //                                 selected = 3;
    //                               });
    //                             },
    //                             icon: Icon(
    //                               Icons.shopping_bag,
    //                               size: 35,
    //                             ),
    //                             color: Colors.pink,
    //                           )
    //                         ],
    //                       ),
    //                     ),
    //                   )
    //                 : SizedBox.shrink(),
    //           ],
    //         ),
    //       )),
    //   appBar: AppBar(
    //     backgroundColor: Colors.pink,
    //     // leading: IconButton(
    //     //   icon: Icon(Icons.menu),
    //     //   onPressed: () {},
    //     // ),
    //     title: Text(
    //       'Saloonati',
    //       style: TextStyle(
    //         fontWeight: FontWeight.bold,
    //         fontSize: 20,
    //       ),
    //     ),
    //     actions: [
    //       IconButton(
    //         icon: Icon(Icons.logout),
    //         onPressed: () async {
    //           showConfirmLogout();
    //         },
    //       ),
    //       IconButton(
    //         icon: Icon(_icon_bool ? _iconDark : _iconlight),
    //         onPressed: () {
    //           setState(() {
    //             _icon_bool = !_icon_bool;
    //           });
    //         },
    //       ),
    //     ],
    //   ),
    //   drawer: const NavigationDrawer(),
    //   // floatingActionButton: FloatingActionButton(
    //   //   onPressed: () {},
    //   //   backgroundColor: Color(0xFFF17532),
    //   //   child: Icon(Icons.shopping_bag),
    //   // ),
    //   // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    //   body: list[selected],
    // );
  }
}
