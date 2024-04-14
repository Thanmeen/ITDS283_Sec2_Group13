import 'package:flutter/material.dart';
import '../../ClassImage/Image_view.dart';
import '../../ClassImage/image_constant.dart';

// ใช้ในSlideADS

// ignore: must_be_immutable
class ShirtImageItem extends StatelessWidget {
  const ShirtImageItem({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstant.imgShirtInStore,
      height: 248,
      width: 408,
      radius: BorderRadius.circular(
        22,
      ),
    );
  }
}
