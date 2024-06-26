import 'package:flutter/material.dart';
import '../../widget/ClassImage/Image_view.dart';

// ใช้ในSlideADS

// ignore: must_be_immutable
class ShirtImageItem extends StatelessWidget {
  final String imagePath; // เพิ่มพารามิเตอร์สำหรับรับรูปภาพ
  const ShirtImageItem({
    super.key,
    required this.imagePath, // รับค่ารูปภาพจากภายนอก
  });

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
