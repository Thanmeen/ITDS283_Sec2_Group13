import 'package:flutter/material.dart';
import 'ClassRoutes/app_routes.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
        return MaterialApp(
          title: 'MobileProject',
          
          initialRoute: AppRoutes.homePageScreen,
          routes: AppRoutes.routes,
        );
     }
  }
