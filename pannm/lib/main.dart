import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_routes.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
        return MaterialApp(
          title: 'thanrak_s_application',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.loginPageScreen,
          routes: AppRoutes.routes,
        );
     }
  }