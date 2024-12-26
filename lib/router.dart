
import 'package:flutter/material.dart';
import 'package:job_portal_frontend/features/auth/login.dart';
import 'package:job_portal_frontend/features/auth/signup.dart';
import 'package:job_portal_frontend/home_screen.dart';


Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RegisterPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) =>  RegisterPage());
    case LoginPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => LoginPage());
           case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => HomeScreen());
  
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text('Screen does not exist'),
                ),
              ));
  }
}