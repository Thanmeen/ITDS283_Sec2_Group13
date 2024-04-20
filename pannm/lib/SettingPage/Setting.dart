import 'package:flutter/material.dart';
import '../Widget/ClassRoutes/app_routes.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        children: [
          ListTile(
            title: Text('Account'),
            leading: Icon(Icons.account_circle),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.profile);
            },
          ),
          ListTile(
            title: Text('Notifications'),
            leading: Icon(Icons.notifications),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.profile);
            },
          ),
          ListTile(
            title: Text('App Settings'),
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.profile);
            },
          ),
          ListTile(
            title: Text('Language'),
            leading: Icon(Icons.language),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.profile);
            },
          ),
          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.person),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.profile);
            },
          ),
          ListTile(
            title: Text('Log out'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.profile);
            },
          ),
        ],
      ),
    );
  }
}
