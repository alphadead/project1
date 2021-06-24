import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stack(
            //   children: [
            //     Positioned(
            //       width: 500,
            //       height: 250,
            //       child: Transform.rotate(
            //         angle: 6.0,
            //         origin: Offset(-250, 120),
            //         child: Container(
            //           decoration: BoxDecoration(
            //             color: Color.fromRGBO(99, 186, 70, 1),
            //             borderRadius: BorderRadius.circular(40),
            //           ),
            //         ),
            //       ),
            //     ),
            //     Positioned(
            //       top: 20.0,
            //       child: Image.asset(
            //         'images/group_3.png',
            //       ),
            //     ),
            //     Positioned(
            //       top: 140.0,
            //       left: 30.0,
            //       child: Text(
            //         'Login',
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 20,
            //             fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 34,
                        width: 34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Color.fromRGBO(99, 186, 70, 1),
                        ),
                        child: Center(
                          child: Text(
                            '01',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color.fromRGBO(99, 186, 70, 1),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 34,
                        width: 34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Color.fromRGBO(99, 186, 70, 0.5),
                        ),
                        child: Center(
                          child: Text(
                            '02',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Profile",
                        style: TextStyle(
                          color: Color.fromRGBO(99, 186, 70, 0.5),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 34,
                        width: 34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Color.fromRGBO(99, 186, 70, 0.5),
                        ),
                        child: Center(
                          child: Text(
                            '03',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Users",
                        style: TextStyle(
                          color: Color.fromRGBO(99, 186, 70, 0.5),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 34,
                        width: 34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Color.fromRGBO(99, 186, 70, 0.5),
                        ),
                        child: Center(
                          child: Text(
                            '04',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Share",
                        style: TextStyle(
                          color: Color.fromRGBO(99, 186, 70, 0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: TextField(
                style: TextStyle(color: Color.fromRGBO(143, 201, 97, 1)),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(143, 201, 97, 1)),
                  ),
                  labelText: 'Mobile No',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(192, 193, 191, 1),
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: TextField(
                obscureText: true,
                style: TextStyle(color: Color.fromRGBO(143, 201, 97, 1)),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(143, 201, 97, 1)),
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(192, 193, 191, 1),
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 30, 35),
                    child: Text(
                      'Forget Password ?',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color.fromRGBO(143, 201, 97, 1),
                          fontSize: 15),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: GestureDetector(
                child: Container(
                  width: 250,
                  height: 40,
                  child: Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(239, 77, 35, 1),
                    //(#ef4d23),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not registered yet ? ',
                  style: TextStyle(
                    color: Color.fromRGBO(192, 193, 191, 1),
                    fontFamily: 'Poppins',
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Create an Account',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color.fromRGBO(143, 201, 97, 1),
                        decoration: TextDecoration.underline,
                        fontSize: 15),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
