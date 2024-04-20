import 'package:flutter/material.dart';
import '../Widget/ClassRoutes/app_routes.dart';

void main() {
  runApp(SettingsPage());
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.homePage);
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountSettingsPage()),
                );
              },
            ),
            ListTile(
              title: Text('Notifications'),
              leading: Icon(Icons.notifications),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationSettingsPage()),
                );
              },
            ),
            ListTile(
              title: Text('App Settings'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppSettingsPage()),
                );
              },
            ),
            ListTile(
              title: Text('Language'),
              leading: Icon(Icons.language),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LanguageSettingsPage()),
                );
              },
            ),
            ListTile(
              title: Text('Log out'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                // Log out user
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AccountSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
      ),
      body: Center(
        child: Text('Account Settings Page'),
      ),
    );
  }
}

class NotificationSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Settings'),
      ),
      body: Center(
        child: Text('Notification Settings Page'),
      ),
    );
  }
}

class AppSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Settings'),
      ),
      body: Center(
        child: Text('App Settings Page'),
      ),
    );
  }
}

class LanguageSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Settings'),
      ),
      body: Center(
        child: Text('Language Settings Page'),
      ),
    );
  }
}
