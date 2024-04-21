import 'package:flutter/material.dart';

import '../Widget/ClassImage/image_constant.dart';
import '../Widget/ClassImage/image_view.dart';
import '../Widget/ClassRoutes/app_routes.dart';

class UpdatecartPageDialog extends StatelessWidget {
  const UpdatecartPageDialog({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 395,
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            color: Color(0XFFFFFFFF),
          ),
          child: Material(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cart Update.",
                        style: TextStyle(
                          color: Color(0XFF000000),
                          fontSize: 20,
                          fontFamily: 'High Tower Text',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgMultiply,
                        height: 15,
                        width: 15,
                        margin: EdgeInsets.only(
                          top: 2,
                          bottom: 6,
                        ),
                        onTap: () {
                           Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(height: 28),
                Container(
                  width: 309,
                  margin: EdgeInsets.symmetric(horizontal: 28),
                  child: Text(
                    "You have previously added items in your cart.\nPlease check your cart.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0XFF000000),
                      fontSize: 16,
                      fontFamily: 'High Tower Text',
                      fontWeight: FontWeight.w400,
                      height: 1.25,
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Container(
                  height: 48,
                  width: 100,
                  margin: EdgeInsets.symmetric(horizontal: 28),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'OK',
                          style: TextStyle(
                            color: Color(0XFF000000),
                            fontSize: 16,
                            fontFamily: 'High Tower Text',
                            fontWeight: FontWeight.w400,
                            height: 1.25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 7)
              ],
            ),
          ),
        )
      ],
    );
  }
}