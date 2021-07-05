import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/ui/loginPages/setPass.dart';
import 'package:vamos/ui/loginPages/signUp.dart';
import 'package:vamos/widget/inputField.dart';
import 'package:vamos/widget/loginpageStack.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/validator.dart';
import 'package:vamos/widget/inputField.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String radioItem = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<AuthController>(
      builder: (_authService) => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _authService.formKey2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0, color: Colors.white),
                  ),
                  //clipBehavior: Clip.none,
                  margin: EdgeInsets.only(bottom: 10),
                  height: 250.h,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    fit: StackFit.expand,
                    children: [
                      // Container(
                      //   height: 200.h,
                      // ),
                      Positioned(
                        //top: -20,
                        left: -100.w,
                        child: Image.asset(
                          "assets/images/rectangle_1.webp",
                          width: 1.50.sw,
                          fit: BoxFit.fitWidth,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 0.8.sh,
                            child: Image.asset(
                              'assets/images/register.png',
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 160.0.h,
                        left: 40.0.w,
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0, color: Colors.white),
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                  //height: 350.h,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: inputField("First Name", (value) {
                          _authService.firstName = value;
                        }, validate: (arg) {
                          arg = _authService.firstName;
                          if (ValidateFeild().isValidateName(arg)) {
                            return null;
                          } else {
                            return "Fill with characters";
                          }
                        }, keyType: TextInputType.name),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: inputField("Last Name", (value) {
                          _authService.lastName = value;
                        }, validate: (arg) {
                          arg = _authService.lastName;
                          if (ValidateFeild().isValidateName(arg)) {
                            return null;
                          } else {
                            return "Fill with characters";
                          }
                        }, keyType: TextInputType.name),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: inputField("Address", (value) {
                          _authService.address = value;
                        }, validate: (arg) {
                          arg = _authService.address;
                          if (ValidateFeild().isValidateName(arg)) {
                            return null;
                          } else {
                            return "Fill with characters";
                          }
                        }, keyType: TextInputType.name),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: inputField("Email", (value) {
                          _authService.email = value;
                        }, validate: (arg) {
                          arg = _authService.email;
                          if (ValidateFeild().isEmailValid(arg)) {
                            return null;
                          } else {
                            return "Enter valid email";
                          }
                        }, keyType: TextInputType.emailAddress),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: inputField("Mobile", (value) {
                          _authService.mobileNo = value;
                        }, validate: (arg) {
                          arg = _authService.mobileNo;
                          if (ValidateFeild().isValidatePhone(arg)) {
                            return null;
                          } else {
                            return "Enter valid phone number";
                          }
                        }, keyType: TextInputType.phone),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: inputField("Civil Id", (value) {
                          _authService.civilId = value;
                        }, validate: (arg) {
                          arg = _authService.civilId;
                          if (ValidateFeild().isValidateName(arg)) {
                            return null;
                          } else {
                            return "Enter valid Civil Id";
                          }
                        }, keyType: TextInputType.name),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("")],
                        ),
                      ),
                      Center(
                          child: primaryActionButton(
                        context: context,
                        onPressed: () {
                          if (_authService.formKey2.currentState!.validate()) {
                            _authService.registerStep();
                          }
                        },
                      )),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account ? ',
                            style: TextStyle(
                              color: inputText,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.offNamed("/login");
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: labelText,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15),
                              textAlign: TextAlign.end,
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
        ),
      ),
    ));
  }
}
