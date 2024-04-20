import 'package:flutter/material.dart';
import '../../Login/Login.dart';
import '../../HomePage/HomePage.dart';
import '../../sellpage/Topdealpage.dart';
import '../../sellpage/Toppage.dart';
import '../../SettingPage/Setting.dart';

class AppRoutes {
  static const String cartPageScreen = '/cart_page_screen';

  static const String homePage = '/home_page_screen';

 static const String checkoutOneScreen = '/checkout_one_screen';

  static const String login = '/login_page_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String topDeal = '/Topdealpage';

  static const String topSold = '/Toppage';

  static const String setting = '/Setting';

  static const String yourNewRoute = '/Profile';

  static Map<String, WidgetBuilder> routes = {
    //cartPageScreen: (context) => CartPageScreen(),
    homePage: (context) => HomePageScreen(),
    //checkoutOneScreen: (context) => CheckoutOneScreen(),
    login: (context) => LoginPageScreen(),
    //appNavigationScreen: (context) => AppNavigationScreen()
    topDeal: (context) => Topdealpage(),
    topSold:(context) => Toppage(),
    setting:(context) => SettingsPage(),
  };
}
