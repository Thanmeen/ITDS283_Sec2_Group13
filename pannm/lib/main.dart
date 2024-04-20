import 'package:flutter/material.dart';
import 'Widget/ClassRoutes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';


var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'MobileProject',
      builder: (context, child) {
        return ScaffoldMessenger(
          key: globalMessengerKey, // ระบุ key ของ ScaffoldMessengerState ที่นี่
          child: child!,
        );
      },
      initialRoute: AppRoutes.register,
      routes: AppRoutes.routes,

    );
  }
}
