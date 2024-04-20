import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart'; // เพิ่มการ import

import '../Widget/ClassRoutes/app_routes.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แก้ไขโปรไฟล์'),
      ),
      body: EditProfileForm(),
    );
  }
}

class EditProfileForm extends StatefulWidget {
  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  File? _image;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    String email = user != null ? user.email ?? "" : ""; // ดึงอีเมลจาก Firebase Authentication

    // กำหนดค่าอีเมลให้กับ _emailController
    _emailController.text = email;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50,
            // รูปภาพโปรไฟล์
            backgroundImage: _image != null ? FileImage(_image!) : null,
            child: _image == null
                ? Icon(Icons.person, size: 50)
                : null, // แสดงไอคอน Person หากไม่มีรูปภาพโปรไฟล์
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              // เรียกใช้งานกล้องโทรศัพท์เพื่อถ่ายรูป
              final picker = ImagePicker();
              final pickedFile = await picker.pickImage(source: ImageSource.camera);

              if (pickedFile != null) {
                setState(() {
                  _image = File(pickedFile.path);
                });
              }
            },
            child: Text('เปลี่ยนรูปภาพโปรไฟล์'),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(labelText: 'ชื่อผู้ใช้'),
          ),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'อีเมล'),
          ),
         ElevatedButton(
          onPressed: () async {
            final user = FirebaseAuth.instance.currentUser;
            try {
              // อัปเดตชื่อผู้ใช้ใน Firebase Authentication
              await user?.updateDisplayName(_usernameController.text);
              
              // บันทึกข้อมูลและกลับไปยังหน้าโปรไฟล์
              Navigator.of(context).pushReplacementNamed(AppRoutes.profile);
            } catch (e) {
              print("เกิดข้อผิดพลาดในการอัปเดตชื่อผู้ใช้: $e");
              // จัดการกับข้อผิดพลาดที่เกิดขึ้นได้ตามที่คุณต้องการ
            }
          },
          child: Text('บันทึก'),
        ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
