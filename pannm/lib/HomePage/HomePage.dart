import 'package:carousel_slider/carousel_slider.dart';
import 'widgets/ShirtImage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'widgets/ShopItemwidget.dart';
import 'package:flutter/material.dart';
import '../ClassImage/image_view.dart';
import '../ClassImage/image_constant.dart';
import '../ClassBotton/icon_button.dart';
import '../navbar/NavBar.dart';

// ignore_for_file: must_be_immutable
class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  int sliderIndex = 1;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        appBar: SearchBar(context), // เพิ่มบรรทัดนี้เพื่อเรียกใช้ SearchBar
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              SlideADS(context),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.only(
                  left: 19,
                  right: 11,
                ),
                child: ShopText(
                  context,
                  todaySpecialDeal: "Shop",
                  seeAll: "See all",
                ),
              ),
              SizedBox(height: 5),
              Shop(context),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.only(
                  left: 19,
                  right: 11,
                ),
                child: ShopText(
                  context,
                  todaySpecialDeal: "Today Special Deal",
                  seeAll: "See all",
                ),
              ),
              SizedBox(height: 21),
              TodaySpecialDeal(context),
              SizedBox(height: 9)
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
              icon: Icon(Icons.sort),
              onPressed: () {
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // การคลิกที่ไอคอนรถเข็น
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
      padding: EdgeInsets.only(left: 11),
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
              return ShirtImageItem();
            },
          ),
          SizedBox(height: 9),
          Align(
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
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 69,
        child: ListView.separated(
          padding: EdgeInsets.only(left: 36),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 36,
            );
          },
          itemCount: 4,
          itemBuilder: (context, index) {
            return HomepageItemWidget();
          },
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
            
            // อันที่ 1

            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 11,
              ),
              decoration: BoxDecoration(
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
                  SizedBox(height: 3),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 39,
                        width: 60,
                        margin: EdgeInsets.only(
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
                              margin: EdgeInsets.only(bottom: 3),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 7),
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
                        margin: EdgeInsets.only(
                          left: 7,
                          bottom: 34,
                        ),
                        child: Text(
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
                      margin: EdgeInsets.only(top: 12),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 50), // เพิ่ม Padding เพื่อขยับไปทางซ้าย
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 0, 0)),
                            minimumSize: MaterialStateProperty.all(Size(20, 20)), 
                          ),
                          onPressed: () {
                            // กระทำที่ต้องการเมื่อกดปุ่ม
                          },
                          child: Text(
                            '+',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10
                            ),
                          ),
                        ),
                      ),
                    ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(flex: 50),
            
            // อันที่ 2

            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 11,
              ),
              decoration: BoxDecoration(
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
                  SizedBox(height: 3),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 39,
                        width: 60,
                        margin: EdgeInsets.only(
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
                              margin: EdgeInsets.only(bottom: 3),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 7),
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
                        margin: EdgeInsets.only(
                          left: 7,
                          bottom: 34,
                        ),
                        child: Text(
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
                    ],
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 50,
            ),

            // อันที่ 3

            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 11,
              ),
              decoration: BoxDecoration(
                color: Color(0XFFF3F3F3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.img39816ab501a04166x143,
                    height: 146,
                    width: 123,
                    radius: BorderRadius.circular(
                      12,
                    ),
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: 3),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 39,
                        width: 60,
                        margin: EdgeInsets.only(
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
                              margin: EdgeInsets.only(bottom: 3),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 7),
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
                        margin: EdgeInsets.only(
                          left: 7,
                          bottom: 34,
                        ),
                        child: Text(
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
                    ],
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 50,
            ),

            //อันที่ 4

            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 11,
              ),
              decoration: BoxDecoration(
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
                  SizedBox(height: 3),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 39,
                        width: 60,
                        margin: EdgeInsets.only(
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
                              margin: EdgeInsets.only(bottom: 3),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 7),
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
                        margin: EdgeInsets.only(
                          left: 7,
                          bottom: 34,
                        ),
                        child: Text(
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

  // Section for NavBar
Widget NavBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {},
    );
  }

  // SeeAll Section Text
  Widget ShopText(
    BuildContext context, {
    required String todaySpecialDeal,
    required String seeAll,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 2),
          child: Text(
            todaySpecialDeal,
            style: TextStyle(
              color: Color(0XFF000000),
              fontSize: 16,
              fontFamily: 'High Tower Text',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Text(
          seeAll,
          style: TextStyle(
            color: Color(0XFF963636),
            fontSize: 16,
            fontFamily: 'High Tower Text',
            fontWeight: FontWeight.w400,
          ),
        )
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
            style: TextStyle(
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
          style: TextStyle(
            color: Color(0XFF000000),
            fontSize: 11,
            fontFamily: 'Ibarra Real Nova',
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }

  onTapBtnIconButton(BuildContext context) {
    // TODO: implement Actions
  }
}
