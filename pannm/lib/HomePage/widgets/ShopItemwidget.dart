import 'package:flutter/material.dart';
import '../../ClassImage/image_constant.dart';
import '../../ClassImage/Image_view.dart';

//ใช้ใน Shop zone3

// ignore: must_be_immutable
class HomepageItemWidget extends StatelessWidget {
  const HomepageItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 142,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 9,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Color(0XFF8C8989),
            borderRadius: BorderRadius.circular(12), // ใส่ BorderRadius.circular() ใน decoration
            border: Border.all(
              color: Color(0XFF000000),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.img68909208001116,
                height: 46,
                width: 47,
                radius: BorderRadius.circular(
                  23,
                ),
                margin: EdgeInsets.only(bottom: 1),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 8,
                  top: 13,
                  bottom: 14,
                ),
                child: Text(
                  "Women",
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 16,
                    fontFamily: 'High Tower Text',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
