import 'package:flutter/material.dart';
import '../widget/ClassImage/image_constant.dart';
import '../widget/ClassImage/Image_view.dart';
import '../Widget/ClassRoutes/app_routes.dart';

// ignore: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({Key? key, required this.onChanged}) : super(key: key);

  final Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavMenu,
      activeIcon: ImageConstant.imgNavMenu,
      title: "Menu",
      type: BottomBarEnum.Menu,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavNotification,
      activeIcon: ImageConstant.imgNavNotification,
      title: "Notification",
      type: BottomBarEnum.Notification,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavHome,
      activeIcon: ImageConstant.imgNavHome,
      title: "Home",
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavContractUs,
      activeIcon: ImageConstant.imgNavContractUs,
      title: "Contract Us",
      type: BottomBarEnum.Contractus,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavProfile,
      activeIcon: ImageConstant.imgNavProfile,
      title: "Profile",
      type: BottomBarEnum.Profile,
    )
  ];

  void onChanged(BottomBarEnum selectedBar) {
  switch (selectedBar) {
    case BottomBarEnum.Home:
      Navigator.pushReplacementNamed(context, AppRoutes.homePage);
      break;
    case BottomBarEnum.Menu:
      Navigator.pushReplacementNamed(context, AppRoutes.setting);
      break;
    case BottomBarEnum.Notification:
      Navigator.pushReplacementNamed(context, AppRoutes.homePage);
      break;
    case BottomBarEnum.Contractus:
      Navigator.pushReplacementNamed(context, AppRoutes.homePage);
      break;
    case BottomBarEnum.Profile:
      Navigator.pushReplacementNamed(context, AppRoutes.homePage);
      break;
  }
}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: Color(0XFF000000),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].icon,
                  height: 24,
                  width: 24,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: Text(
                    bottomMenuList[index].title ?? "",
                    style: TextStyle(
                      color: Color(0XFFFFFFFF),
                      fontSize: 11,
                      fontFamily: 'Ibarra Real Nova',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  height: 21,
                  width: 21,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text(
                    bottomMenuList[index].title ?? "",
                    style: TextStyle(
                      color: Color(0XFFFFFFFF),
                      fontSize: 11,
                      fontFamily: 'Ibarra Real Nova',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          );
        }),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          widget.onChanged?.call(bottomMenuList[index].type);
        },
      ),
    );
  }
}


enum BottomBarEnum {
  Menu,
  Notification,
  Home,
  Contractus,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;

}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
