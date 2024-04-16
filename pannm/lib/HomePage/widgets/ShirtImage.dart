import 'package:flutter/material.dart';
import '../../ClassImage/Image_view.dart';

// ใช้ในSlideADS

// ignore: must_be_immutable
class ShirtImageItem extends StatelessWidget {
  final String imagePath; // เพิ่มพารามิเตอร์สำหรับรับรูปภาพ
  const ShirtImageItem({
    Key? key,
    required this.imagePath, // รับค่ารูปภาพจากภายนอก
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: imagePath, // ใช้รูปภาพที่รับเข้ามาจากภายนอก
      height: 248,
      width: 408,
      radius: BorderRadius.circular(22),
    );
  }
}
