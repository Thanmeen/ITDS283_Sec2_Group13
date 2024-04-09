import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../Form/TextForm.dart';
import 'LoginButton.dart';
import 'icon_button.dart';
import 'checkbox_button.dart';
import '../app_routes.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore_for_file: must_be_immutable
class LoginPageScreen extends StatelessWidget {
  LoginPageScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool remember = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFF857575),
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 9),
                    Image(
                      image: AssetImage('assets/PannmLogo.PNG'),
                      height: 165,
                      width: 166,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "We made for your style.",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Ibarra Real Nova',
                        fontWeight: FontWeight.w700,
                      )
                    ),
                    SizedBox(height: 62),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 17,
                      ),
                      child: CustomTextFormField(
                        controller: userNameController,
                        hintText: "Username or Email",
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Ibarra Real Nova',
                          fontWeight: FontWeight.w700,
                        ),
                        textInputType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(height: 53),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 15,
                        right: 17,
                      ),
                      child: CustomTextFormField(
                        controller: passwordController,
                        hintText: "Password",
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Ibarra Real Nova',
                          fontWeight: FontWeight.w700,
                        ),
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.visiblePassword,
                        suffix: Container(
                        margin: EdgeInsets.fromLTRB(30, 12, 8, 12),
                        child: SvgPicture.asset(
                          'assets/images/img_eye.svg',
                          height: 24,
                          width: 24,
                        ),
                      ),
                        suffixConstraints: BoxConstraints(
                          maxHeight: 48,
                        ),
                        obscureText: true,
                        contentPadding: EdgeInsets.only(
                          left: 16,
                          top: 14,
                          bottom: 14,
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    _buildRemember(context),
                    SizedBox(height: 41),
                    CustomOutlinedButton(
                      text: "Login".toUpperCase(),
                      margin: EdgeInsets.only(
                        left: 16,
                        right: 17,
                      ),
                      onPressed: () {
                        onTapLogin(context);
                      },
                    ),
                    SizedBox(height: 19),
                    Text(
                      "or connect with",
                      style: TextStyle(
                        color: Color(0XFF000000),
                        fontSize: 20,
                        fontFamily: 'High Tower Text',
                        fontWeight: FontWeight.w400,
                      ),
                    ),  
                    SizedBox(height: 21),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 68),
                        child: Row(
                          children: [
                            CustomIconButton(
                              height: 39,
                              width: 39,
                              child: Image(
                                image: AssetImage('/assets/images/facebook_logo.png'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 18),
                              child: CustomIconButton(
                                height: 39,
                                width: 39,
                                padding: EdgeInsets.all(10),
                                child : SvgPicture.asset('/assets/images/instagram.svg'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 18),
                              child: CustomIconButton(
                                height: 39,
                                width: 39,
                                child: Image(
                                  image: AssetImage('/assets/images/google_plus.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 18),
                              child: CustomIconButton(
                                height: 39,
                                width: 39,
                                child:  SvgPicture.asset('/assets/images/img_link.svg'),
                                ),
                              ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRemember(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: CustomCheckboxButton(
              text: "Remember ",
              value: remember,
              onChange: (value) {
                remember = value;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3),
            child: Text(
              "Forget password",
              style: TextStyle(
              color: Color(0XFF000000),
              fontSize: 20,
              fontFamily: 'High Tower Text',
              fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

void onTapLogin(BuildContext context) {
  // ตรวจสอบค่าที่ป้อนเข้ามา
  String username = userNameController.text;
  String password = passwordController.text;

  // ทำการเรียกใช้งาน API หรือระบบการยืนยันของคุณที่นี่

  // ตัวอย่าง: ถ้าชื่อผู้ใช้และรหัสผ่านถูกต้อง ให้เปลี่ยนหน้าไปยังหน้าหลักของแอปพลิเคชัน
  if (username == 'admin' && password == 'password') {
    Navigator.pushReplacementNamed(context, AppRoutes.homePageScreen);
  } else {
    // ถ้าไม่ถูกต้อง แสดงข้อความผิดพลาดหรือกระทำอื่นตามต้องการ
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง'),
      ),
    );
  }
  }
}
