import 'package:flutter/material.dart';
//import  'package:f/features/auth/screens/auth_screen.dart';

import 'features/auth/screen/auth_screen.dart';
import 'features/home/screens/home_screens.dart';
import 'features/home/screens/homemain.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => AuthScreen(
          role: 'user',
        ),
      );
    case salons.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
         builder: (_) => homemain(),
       // builder: (_) => salons(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => Scaffold(
          body: Center(
            child: Text('Page doesnt exist!!'),
          ),
        ),
      );
  }
}
