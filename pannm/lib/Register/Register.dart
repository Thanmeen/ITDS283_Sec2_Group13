import 'dart:async';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Widget/ClassForm/TextForm.dart';
import '../Widget/ClassRoutes/app_routes.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class User {
  late String username;
  late String email;
  late String password;
  late String imagePath;

  User(
      {required this.username,
      required this.email,
      required this.password,
      required this.imagePath});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'imagePath': imagePath,
    };
  }
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  late String? _imagePath = '';

  // เมื่อคลิกที่ภาพโลโก้
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery); // เลือกภาพจากแกลอรี

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path; // กำหนดที่อยู่ของภาพที่เลือก
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF857575),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                // แสดงรูปภาพ
                GestureDetector(
                  onTap: _pickImage, // เมื่อคลิกที่ภาพ
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage:
                        _imagePath != null ? FileImage(File(_imagePath!)) : null,
                        backgroundColor: Colors.white,
                  ),

                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: _usernameController,
                  hintText: 'Username',
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email',
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  hintText: 'Password',
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        _register(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),           
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Color(0XFF000000),
                          fontSize: 16,
                          fontFamily: 'Ibarra Real Nova',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
             
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
                  },
                  child: Text(
                    ' or Login',
                    style: TextStyle(
                      color: const Color.fromARGB(141, 255, 255, 255),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _register(BuildContext context) async {
    try {
      User user = User(
        username: _usernameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        imagePath: _imagePath ?? '',
      );

      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      await _auth.currentUser!.updatePhotoURL(user.username);

      // กำหนด URL ของ Firebase Realtime Database
      FirebaseDatabase database = FirebaseDatabase(
        databaseURL: 'https://mobileproject-e7d6e-default-rtdb.asia-southeast1.firebasedatabase.app/',
      );

      // สร้าง DatabaseReference สำหรับโหนด 'Users'
      DatabaseReference userRef = database.ref().child('Users');

      // เพิ่มข้อมูลของผู้ใช้ไปยัง Firebase Realtime Database
      await userRef.push().set(user.toJson());

      Navigator.of(context).pushReplacementNamed(AppRoutes.login);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to register: $e"),
        ),
      );
    }
  }
}
