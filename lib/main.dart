import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soft/features/auth/screen/auth_screen.dart';
import 'package:soft/features/home/screens/Dashbord.dart';
import 'package:soft/local/local_controller.dart';
import 'package:soft/providers/user_provider.dart';
import 'package:soft/salon2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:soft/walaaface.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'features/home/screens/home_screens.dart';
import 'local/local.dart';
//import 'package:soft/reg.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var sp = await SharedPreferences.getInstance();
  var isLogged = false;
  if (!sp.getBool('isLogged').isNull) isLogged = sp.getBool('isLogged')!;

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: MyApp(isLogged: isLogged)));
}

class MyApp extends StatelessWidget {
  final isLogged;
  const MyApp({Key? key, required this.isLogged}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(mylocaleconroller());
    return MaterialApp(
      title: 'Saloonati',
      initialRoute: '/role',
      debugShowCheckedModeBanner: false,
      routes: {
        '/salons': (context) => MyWidget(),
        '/role': (context) => isLogged ? MyWidget() : Rplespage(),
      },

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: Get.deviceLocale,
      // translations : mylocale(),
    );

    // debugShowCheckedModeBanner:
    // false;
  }
}

class Rplespage extends StatefulWidget {
  const Rplespage({Key? key}) : super(key: key);

  @override
  State<Rplespage> createState() => _RplespageState();
}

class _RplespageState extends State<Rplespage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Welcome in Saloonati',
              body: '',
              image: buildImage("assets/logo.png"),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Book your appointment from the comfort of your home',
              body: '',
              image: buildImage("assets/02.jpg"),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Shop from your home and get fast delivery',
              body: '',
              image: buildImage("assets/05.jpg"),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'please select if you are :',
              // body: '',
              image: buildImage("assets/03.PNG"),
              // bodyWidget:  TextButton(
              //   child: Text('user'),
              //   onPressed: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (context) => AuthScreen(role: "user")));
              //   }, ),
              bodyWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    child: Text(
                      'User',
                      style: TextStyle(fontSize: 25, color: Colors.pink),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AuthScreen(role: "user")));
                    },
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'OR',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  TextButton(
                    child: Text('Center Owner',
                        style: TextStyle(fontSize: 20, color: Colors.pink)),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              AuthScreen(role: "CentreOwner")));
                    },
                  ),
                ],
              ),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
          ],
          onDone: () {
            if (kDebugMode) {
              print("Done clicked");
            }
          },
          //ClampingScrollPhysics prevent the scroll offset from exceeding the bounds of the content.
          scrollPhysics: const ClampingScrollPhysics(),
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
          isBottomSafeArea: true,
          skip:
              const Text("Skip", style: TextStyle(fontWeight: FontWeight.w600)),
          next: const Icon(Icons.forward),
          done:
              const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
          dotsDecorator: getDotsDecorator()),
    )

        //   body: ListView(children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text(
        //       'Enter as:',
        //       style: TextStyle(
        //           fontWeight: FontWeight.bold,
        //           fontSize: 20,
        //           color: Colors.black),
        //     ),
        // TextButton(
        //     onPressed: () {
        //       Navigator.of(context).push(MaterialPageRoute(
        //           builder: (context) => AuthScreen(role: "user")));
        //     },
        //     child: Text(
        //       "User",
        //       style: TextStyle(fontSize: 20, color: Colors.black),
        //     )),
        // TextButton(
        //     onPressed: () {
        //       Navigator.of(context).push(MaterialPageRoute(
        //           builder: (context) => AuthScreen(role: "CentreOwner")));
        //     },
        //     child: Text(
        //       "Centre Owner",
        //       style: TextStyle(fontSize: 20, color: Colors.black),
        //     )),
        // ],
        //  ),
        // SizedBox(
        //   height: 30,
        // ),
        // Container(
        //   child: CarouselSlider(
        //     options: CarouselOptions(
        //       autoPlay: true,
        //       aspectRatio: 2.0,
        //       height: 500,
        //       enlargeCenterPage: true,
        //     ),
        //     items: imageSliders,
        //   ),
        // ),
        //  ])

        // mainAxisAlignment: MainAxisAlignment.center,
        // children: [
        //   TextButton(
        //       onPressed: () {
        //         Navigator.of(context).push(MaterialPageRoute(
        //             builder: (context) => AuthScreen(role: "user")));
        //       },
        //       child: Text("User")),
        //   SizedBox(
        //     height: 100,
        //   ),
        //   TextButton(
        //       onPressed: () {
        //         Navigator.of(context).push(MaterialPageRoute(
        //             builder: (context) => AuthScreen(role: "CentreOwner")));
        //       },
        //       child: Text("Centre Owner")),
        // ],
        );
    //);
  }

  Widget buildImage(String imagePath) {
    return Center(
        child: Image.asset(
      imagePath,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    ));
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      imagePadding: EdgeInsets.only(top: 0, right: 0, bottom: 0),
      imageFlex: 5,
      pageColor: Colors.white,
      bodyPadding: EdgeInsets.only(top: 0, left: 20, right: 20),
      titlePadding: EdgeInsets.only(top: 0),
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(color: Colors.black, fontSize: 30),
    );
  }

  //method to customize the dots style
  DotsDecorator getDotsDecorator() {
    return const DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 2),
      activeColor: Colors.indigo,
      color: Colors.grey,
      activeSize: Size(12, 5),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}
