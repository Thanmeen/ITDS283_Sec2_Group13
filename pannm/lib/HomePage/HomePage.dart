import 'package:carousel_slider/carousel_slider.dart';
import 'package:pannm/Sort/Sortpage.dart';
import 'updatecart_page_dialog.dart';
import 'widgets/ShirtImage.dart';
import 'package:flutter/material.dart';
import '../Widget/ClassImage/image_view.dart';
import '../Widget/ClassImage/image_constant.dart';
import '../navbar/NavBar.dart';
import '../Widget/ClassRoutes/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore_for_file: must_be_immutable
class HomePageScreen extends StatelessWidget {

  HomePageScreen({super.key});

  TextEditingController searchController = TextEditingController();

  int sliderIndex = 1;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

 @override
Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      appBar: SearchBar(context),
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            SlideADS(context),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(
                left: 19,
                right: 11,
              ),
              child: TitleShopText(
                context,
                ShopText: "Shop",
                seeAll: "See all",
                onPressed: () {
                  // การนำทางไปยังหน้าที่เกี่ยวข้อง เช่น หน้ารายการร้านค้า
                  Navigator.pushReplacementNamed(context, AppRoutes.topSold);
                },
              ),
            ),
            const SizedBox(height: 5),
            Shop(context),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(
                left: 19,
                right: 11,
              ),
              child: TitleShopText(
                context,
                ShopText: "Today Special Deal",
                seeAll: "See all",
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.topDeal);
                },
              ),
            ),
            const SizedBox(height: 10),
            TodaySpecialDeal(context),
            const SizedBox(height: 9)
          ],
        ),
      ),
      bottomNavigationBar: NavBar(context),
    ),
  );
}

  // Section for SearchBar zone 1
  PreferredSizeWidget SearchBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black, // เพิ่มสีดำให้กับพื้นหลังของ AppBar
      elevation: 0, // เพื่อลบเงาที่แสดง
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.sort, color: Colors.white),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Sort() ));
                // การคลิกที่ไอคอนเรียงลำดับ
              },
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.cart);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Section for Shirt Ads zone2
  Widget SlideADS(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 11),
      child: Column(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 162,
              initialPage: 0,
              autoPlay: true,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                sliderIndex = index;
              },
            ),
            itemCount: 2,
            itemBuilder: (context, index, realIndex) {
              switch (index) {
                case 0:
                  return ShirtImageItem(
                    imagePath: ImageConstant.Ads1, // รูปภาพที่ 1
                  );
                case 1:
                  return ShirtImageItem(
                    imagePath: ImageConstant.Ads2, // รูปภาพที่ 2
                  );
                default:
                  return const SizedBox(); // กรณีอื่นๆ ให้ส่ง SizedBox กลับไป
              }
            },
          ),
          const SizedBox(height: 9),
          const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(left: 169),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
          )
        ],
      ),
    );
  }

  // Section for Shop zone3
Widget Shop(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: IntrinsicWidth(
      child: Row(
        children: [
          const SizedBox(width: 20),
          // อันที่ 1
         SizedBox(
  width: 142,
  child: Align(
    alignment: Alignment.centerRight,
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(AppRoutes.topSold);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 9,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 155, 88, 88),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color.fromARGB(255, 0, 0, 0),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            CustomImageView(
              imagePath: ImageConstant.WomenShop,
              height: 46,
              width: 47,
              radius: BorderRadius.circular(23),
              margin: const EdgeInsets.only(bottom: 1),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 8,
                top: 13,
                bottom: 14,
              ),
              child: Text(
                "TopSale",
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
  ),
),

          const SizedBox(width: 20), // ระยะห่างระหว่าง Container
          // อันที่ 2
          SizedBox(
  width: 142,
  child: Align(
    alignment: Alignment.centerRight,
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(AppRoutes.men);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 9,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 83, 83, 83),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color.fromARGB(255, 0, 0, 0),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            CustomImageView(
              imagePath: ImageConstant.MenShop,
              height: 46,
              width: 47,
              radius: BorderRadius.circular(23),
              margin: const EdgeInsets.only(bottom: 1),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 8,
                top: 13,
                bottom: 14,
              ),
              child: Text(
                "Men",
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
  ),
),

          const SizedBox(width: 20), // ระยะห่างระหว่าง Container
          // อันที่ 3
          SizedBox(
  width: 142,
  child: Align(
    alignment: Alignment.centerRight,
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(AppRoutes.Women);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 9,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 130, 130),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0XFF000000),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            CustomImageView(
              imagePath: ImageConstant.WomenShop,
              height: 46,
              width: 47,
              radius: BorderRadius.circular(23),
              margin: const EdgeInsets.only(bottom: 1),
            ),
            const Padding(
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
  ),
),

          const SizedBox(width: 20), // ระยะห่างระหว่าง Container
          // อันที่ 4
         SizedBox(
  width: 142,
  child: Align(
    alignment: Alignment.centerRight,
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(AppRoutes.kid);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 9,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: const Color(0XFF8C8989),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0XFF000000),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            CustomImageView(
              imagePath: ImageConstant.MenShop,
              height: 46,
              width: 47,
              radius: BorderRadius.circular(23),
              margin: const EdgeInsets.only(bottom: 1),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 8,
                top: 13,
                bottom: 14,
              ),
              child: Text(
                "Kids",
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
  ),
),

          const SizedBox(width: 20),
        ],
      ),
    ),
  );
}

  // Section for TodaySpecialDeal
  Widget TodaySpecialDeal(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicWidth(
        child: Row(
          children: [
            const SizedBox(width: 30),
            // อันที่ 1
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 11,
              ),
              decoration: const BoxDecoration(
                color: Color(0XFFF3F3F3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.img39816ab501a04,
                    height: 146,
                    width: 123,
                    radius: BorderRadius.circular(
                      12,
                    ),
                    alignment: Alignment.center,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 39,
                        width: 60,
                        margin: const EdgeInsets.only(
                          top: 15,
                          bottom: 6,
                        ),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgSettings,
                              height: 10,
                              width: 45,
                              alignment: Alignment.bottomLeft,
                              margin: const EdgeInsets.only(bottom: 3),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: DealText(
                                context,
                                price: "฿ 100",
                                price1: "฿ 200",
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 55,
                        margin: const EdgeInsets.only(
                          left: 7,
                          bottom: 34,
                        ),
                        child: const Text(
                          "Black Shirt",
                          maxLines: null,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0XFF000000),
                            fontSize: 11,
                            fontFamily: 'Ibarra Real Nova',
                            fontWeight: FontWeight.w400,
                            height: 1.82,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        constraints: const BoxConstraints(
                            maxWidth: 30,
                            maxHeight: 30), // กำหนดขนาดสูงสุดของ Container
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                              10), // ปรับเป็นค่าที่ต้องการ
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 10), // เพิ่ม Padding เพื่อขยับไปทางซ้าย
                          child: TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  // Return the instance of your custom dialog class
                                  return UpdatecartPageDialog();
                                },
                              );
                            },
                            child: const Text(
                              '+',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30),
            // อันที่ 2

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 11,
              ),
              decoration: const BoxDecoration(
                color: Color(0XFFF3F3F3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgF6ac7c84E08b4,
                    height: 146,
                    width: 123,
                    radius: BorderRadius.circular(
                      12,
                    ),
                    alignment: Alignment.center,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 39,
                        width: 60,
                        margin: const EdgeInsets.only(
                          top: 15,
                          bottom: 6,
                        ),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgSettings,
                              height: 10,
                              width: 45,
                              alignment: Alignment.bottomLeft,
                              margin: const EdgeInsets.only(bottom: 3),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: DealText(
                                context,
                                price: "฿ 100",
                                price1: "฿ 200",
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 55,
                        margin: const EdgeInsets.only(
                          left: 7,
                          bottom: 34,
                        ),
                        child: const Text(
                          "Black Shirt",
                          maxLines: null,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0XFF000000),
                            fontSize: 11,
                            fontFamily: 'Ibarra Real Nova',
                            fontWeight: FontWeight.w400,
                            height: 1.82,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        constraints: const BoxConstraints(
                            maxWidth: 30,
                            maxHeight: 30), // กำหนดขนาดสูงสุดของ Container
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                              10), // ปรับเป็นค่าที่ต้องการ
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 10), // เพิ่ม Padding เพื่อขยับไปทางซ้าย
                          child: TextButton(
                            onPressed: () {
                              // กระทำที่ต้องการเมื่อกดปุ่ม
                            },
                            child: const Text(
                              '+',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30),
            // อันที่ 3

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 11,
              ),
              decoration: const BoxDecoration(
                color: Color(0XFFF3F3F3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.BlackShirt,
                    height: 146,
                    width: 123,
                    radius: BorderRadius.circular(
                      12,
                    ),
                    alignment: Alignment.center,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 39,
                        width: 60,
                        margin: const EdgeInsets.only(
                          top: 15,
                          bottom: 6,
                        ),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgSettings,
                              height: 10,
                              width: 45,
                              alignment: Alignment.bottomLeft,
                              margin: const EdgeInsets.only(bottom: 3),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: DealText(
                                context,
                                price: "฿ 100",
                                price1: "฿ 200",
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 55,
                        margin: const EdgeInsets.only(
                          left: 7,
                          bottom: 34,
                        ),
                        child: const Text(
                          "Black Shirt",
                          maxLines: null,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0XFF000000),
                            fontSize: 11,
                            fontFamily: 'Ibarra Real Nova',
                            fontWeight: FontWeight.w400,
                            height: 1.82,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        constraints: const BoxConstraints(
                            maxWidth: 30,
                            maxHeight: 30), // กำหนดขนาดสูงสุดของ Container
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                              10), // ปรับเป็นค่าที่ต้องการ
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 10), // เพิ่ม Padding เพื่อขยับไปทางซ้าย
                          child: TextButton(
                            onPressed: () {
                              // กระทำที่ต้องการเมื่อกดปุ่ม
                            },
                            child: const Text(
                              '+',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30),
            //อันที่ 4

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 11,
              ),
              decoration: const BoxDecoration(
                color: Color(0XFFF3F3F3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgF6ac7c84E08b4166x143,
                    height: 146,
                    width: 123,
                    radius: BorderRadius.circular(
                      12,
                    ),
                    alignment: Alignment.center,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 39,
                        width: 60,
                        margin: const EdgeInsets.only(
                          top: 15,
                          bottom: 6,
                        ),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgSettings,
                              height: 10,
                              width: 45,
                              alignment: Alignment.bottomLeft,
                              margin: const EdgeInsets.only(bottom: 3),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: DealText(
                                context,
                                price: "฿ 100",
                                price1: "฿ 200",
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 55,
                        margin: const EdgeInsets.only(
                          left: 7,
                          bottom: 34,
                        ),
                        child: const Text(
                          "Black Shirt",
                          maxLines: null,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0XFF000000),
                            fontSize: 11,
                            fontFamily: 'Ibarra Real Nova',
                            fontWeight: FontWeight.w400,
                            height: 1.82,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        constraints: const BoxConstraints(
                            maxWidth: 30,
                            maxHeight: 30), // กำหนดขนาดสูงสุดของ Container
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                              10), // ปรับเป็นค่าที่ต้องการ
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 10), // เพิ่ม Padding เพื่อขยับไปทางซ้าย
                          child: TextButton(
                            onPressed: () {
                              // กระทำที่ต้องการเมื่อกดปุ่ม
                            },
                            child: const Text(
                              '+',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget TitleShopText(
  BuildContext context, {
  required String ShopText,
  required String seeAll,
  required Function() onPressed, // เพิ่ม onPressed เพื่อระบุการทำงานเมื่อปุ่มถูกกด
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Text(
          ShopText,
          style: const TextStyle(
            color: Color(0XFF000000),
            fontSize: 16,
            fontFamily: 'High Tower Text',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      GestureDetector( // Wrap ด้วย GestureDetector เพื่อทำให้สามารถคลิกได้
        onTap: onPressed, // กำหนดฟังก์ชันที่จะเรียกเมื่อปุ่มถูกกด
        child: Text(
          seeAll,
          style: const TextStyle(
            color: Color(0XFF963636),
            fontSize: 16,
            fontFamily: 'High Tower Text',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ],
  );
}

  // Common widget
Widget DealText(
    BuildContext context, {
    required String price,
    required String price1,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 53,
          child: Text(
            price,
            maxLines: null,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0XFF000000),
              fontSize: 11,
              fontFamily: 'Ibarra Real Nova',
              fontWeight: FontWeight.w400,
              height: 1.67,
            ),
          ),
        ),
        Text(
          price1,
          style: const TextStyle(
            color: Color(0XFF000000),
            fontSize: 11,
            fontFamily: 'Ibarra Real Nova',
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }


  // Section for NavBar
  Widget NavBar(BuildContext context) {
  return CustomBottomBar(
    onChanged: (BottomBarEnum type) {
      switch (type) {
        case BottomBarEnum.Home:
          Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
          break;
        case BottomBarEnum.Menu:
          Navigator.of(context).pushReplacementNamed(AppRoutes.setting);
          break;
        case BottomBarEnum.Notification:
          Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
          break;
        case BottomBarEnum.Contractus:
          _launchUrl();
         break;
        case BottomBarEnum.Profile:
         Navigator.of(context).pushReplacementNamed(AppRoutes.profile);
        break;
         default:
          break;
      }
    },
  );
  }
  final Uri _url = Uri.parse('https://sites.google.com/student.mahidol.edu/pannm/%E0%B8%95%E0%B8%94%E0%B8%95%E0%B8%AD%E0%B9%80%E0%B8%A3%E0%B8%B2');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
}
}