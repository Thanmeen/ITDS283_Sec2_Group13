import 'package:flutter/material.dart';
import '../ClassForm/TextForm.dart';
import '../ClassBotton/icon_button.dart';
import '../ClassRoutes/app_routes.dart';
import '../ClassImage/image_constant.dart';
import '../ClassImage/Image_view.dart';

class LoginPageScreen extends StatefulWidget {
  LoginPageScreen({Key? key}) : super(key: key);

  @override
  _LoginPageScreenState createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {

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
                    CustomImageView(
                      imagePath: ImageConstant.PannmLogo,
                      height: 165,
                      width: 166,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "We made for your style.",
                      style: TextStyle(
                        color: Color(0XFF352020),
                        fontSize: 16,
                        fontFamily: 'Ibarra Real Nova',
                        fontWeight: FontWeight.w700,
                      ),
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
                        hintStyle: TextStyle(
                          color: Color(0XFF000000),
                          fontSize: 15,
                          fontFamily: 'High Tower Text',
                          fontWeight: FontWeight.w400,
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
                        hintStyle: TextStyle(
                          color: Color(0XFF000000),
                          fontSize: 15,
                          fontFamily: 'High Tower Text',
                          fontWeight: FontWeight.w400,
                        ),
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.visiblePassword,
                        suffix: Container(
                          margin: EdgeInsets.fromLTRB(30, 12, 8, 12),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgEye,
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
                    
                    //RememberCheckBox and Forget password
                    Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // จัดวางวัตถุแบบกระจายทั่ว
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                remember = !remember;
                              });
                            },
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                color: remember ? Colors.black : Colors.transparent,
                              ),
                              child: remember
                                  ? Icon(
                                      Icons.check,
                                      size: 20,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          ),
                          SizedBox(width: 8), // เพิ่มช่องว่างระหว่าง Checkbox และข้อความ "Remember"
                          Text(
                            "Remember",
                            style: TextStyle(
                              color: Color(0XFF000000),
                              fontSize: 15,
                              fontFamily: 'High Tower Text',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(), // ส่วนเพิ่มขยายทั้งหมดที่เหลือของพื้นที่ว่าง
                          GestureDetector(
                            onTap: () {
                              // สำหรับลืมรหัสผ่าน
                            },
                            child: Text(
                              "Forget password",
                              style: TextStyle(
                                color: Color(0XFF000000),
                                fontSize: 15,
                                fontFamily: 'High Tower Text',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 41),
                    
                    //Login buttom
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            onTapLogin(context, userNameController, passwordController);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Color(0XFF000000),
                              fontSize: 16,
                              fontFamily: 'Ibarra Real Nova',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
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
                              child: CustomImageView(
                                imagePath: ImageConstant.imgFacebook,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 18),
                              child: CustomIconButton(
                                height: 39,
                                width: 39,
                                padding: EdgeInsets.all(10),
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgInstagram1,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 18),
                              child: CustomIconButton(
                                height: 39,
                                width: 39,
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgGooglePlus,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 18),
                              child: CustomIconButton(
                                height: 39,
                                width: 39,
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgLink,
                                ),
                              ),
                            )
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
}

void onTapLogin(BuildContext context, TextEditingController usernameController, TextEditingController passwordController) {
  // ตรวจสอบค่าที่ป้อนเข้ามา
  String username = usernameController.text;
  String password = passwordController.text;

  // เรียกใช้งาน API
  if (username == 'admin' && password == 'password') {
    Navigator.pushReplacementNamed(context, AppRoutes.homePage);
  } else {
    // ถ้าไม่ถูกต้อง แสดงข้อความผิดพลาดหรือกระทำอื่นตามต้องการ
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง'),
      ),
    );
  }
}


