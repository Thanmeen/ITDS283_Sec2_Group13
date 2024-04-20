import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../Widget/ClassRoutes/app_routes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class User {
  late String username;
  late String email;
  late String profileImageUrl;

  User({
    required this.username,
    required this.email,
    required this.profileImageUrl,
  });

  factory User.fromSnapshot(DataSnapshot snapshot) {
    Map<String, dynamic>? json = snapshot.value as Map<String, dynamic>?;
    return User(
      username: json!['username'] ?? '',
      email: json['email'] ?? '',
      profileImageUrl: json['profileImageUrl'] ?? '',
    );
  }
}

class _ProfilePageState extends State<ProfilePage> {
  late User _user;
  String _profileImageUrl = '';
  bool _isLoading = true; // Track if data is loading

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final databaseReference = FirebaseDatabase.instance.ref();

      DataSnapshot dataSnapshot = (await databaseReference
          .child('Users')
          .child(user!.uid)
          .once()) as DataSnapshot;

      setState(() {
        _user = User.fromSnapshot(dataSnapshot);
        _profileImageUrl = _user.profileImageUrl;
        _isLoading = false; // Data fetching complete
      });
    } catch (error) {
      // Handle error gracefully
      print('Error fetching user data: $error');
      setState(() {
        _isLoading = false; // Stop loading indicator on error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
            },
          ),
        ],
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator() // Show loading indicator
            : _user != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: _profileImageUrl.isNotEmpty
                            ? NetworkImage(_profileImageUrl)
                            : null,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Username',
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        _user.username,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Email',
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        _user.email,
                        style: TextStyle(fontSize: 18),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(AppRoutes.editprofile);
                        },
                        child: Text('Edit Profile'),
                      ),
                    ],
                  )
                : Text('Error loading user data'), // Display error message if user data is null
      ),
    );
  }
}
