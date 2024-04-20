import 'package:flutter/material.dart';

import '../Widget/ClassRoutes/app_routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('โปรไฟล์ผู้ใช้'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              // รูปภาพโปรไฟล์
              backgroundImage: NetworkImage('URL_ของ_รูปภาพ_โปรไฟล์'),
            ),
            SizedBox(height: 20),
            Text(
              'ชื่อผู้ใช้',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'อีเมล',
              style: TextStyle(fontSize: 18),
            ),
            // ปุ่มแก้ไขโปรไฟล์
            ElevatedButton(
              onPressed: () {
                // ไปยังหน้าแก้ไขโปรไฟล์
                Navigator.of(context).pushReplacementNamed(AppRoutes.editprofile);
              },
              child: Text('แก้ไขโปรไฟล์'),
            ),
          ],
        ),
      ),
    );
  }
}
