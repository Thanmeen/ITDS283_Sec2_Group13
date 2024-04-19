import 'package:flutter/material.dart';
import 'Widget/ClassRoutes/app_routes.dart';


var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
        return MaterialApp(
          title: 'MobileProject',
          
          initialRoute: AppRoutes.login,
          routes: AppRoutes.routes,
        );
     }
  }
