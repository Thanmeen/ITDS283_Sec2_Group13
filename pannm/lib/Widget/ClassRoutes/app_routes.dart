

import 'package:flutter/material.dart';
import 'package:pannm/sellpage/Topmenpage.dart';
import 'package:pannm/sellpage/Topwomenpage.dart';
import 'package:pannm/sellpage/kidpage.dart';
import '../../Cart/Cart.dart';
import '../../Login/Login.dart';
import '../../HomePage/HomePage.dart';
import '../../Profile/EditProfile.dart';
import '../../Profile/Profile.dart';
import '../../Register/Register.dart';
import '../../sellpage/Topdealpage.dart';
import '../../sellpage/Toppage.dart';
import '../../SettingPage/Setting.dart';

class AppRoutes {
  static const String homePage = '/HomePage';
  static const String login = '/Login';
  static const String topDeal = '/Topdealpage';
  static const String topSold = '/Toppage';
  static const String setting = '/Setting';
  static const String profile = '/Profile';
  static const String editprofile = '/EditProfile';
  static const String cart = '/Cart';
  static const String register = '/Register';
  static const String men = '/Topmenpage';
  static const String Women = '/Topwomenpage';
  static const String kid = '/kidpage';

  static Map<String, WidgetBuilder> routes = {
    homePage: (context) => HomePageScreen(),
    login: (context) => const LoginPageScreen(),
    topDeal: (context) => Topdealpage(),
    topSold:(context) => Toppage(),
    setting:(context) => SettingsPage(),
    profile:(context) => const ProfilePage(),
    editprofile:(context) => EditProfilePage(),
    cart:(context) => const MyCart(),
    register:(context) => RegisterPage(),
    men:(context) => Topmenpage(),
    Women:(context) => Topwomenpage(),
    kid:(context) => kidpage(),
  };
}

