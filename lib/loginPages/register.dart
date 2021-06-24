import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vamos/ui/utils/color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          //         'assets/images/register.png',
          //       ),
          //     ),
          //     Positioned(
          //       top: 140.0,
          //       left: 30.0,
          //       child: Text(
          //         'Register',
          //         style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 20,
          //             fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //   ],
          // ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: TextField(
              style: TextStyle(color: labelText),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: labelText),
                ),
                labelText: 'First name',
                labelStyle: TextStyle(
                  color: inputText,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: TextField(
              style: TextStyle(color: labelText),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: labelText),
                ),
                labelText: 'Last Name',
                labelStyle: TextStyle(
                  color: inputText,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: TextField(
              style: TextStyle(color: labelText),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: labelText),
                ),
                labelText: 'Address',
                labelStyle: TextStyle(
                  color: inputText,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: TextField(
              style: TextStyle(color: labelText),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: labelText),
                ),
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: inputText,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: TextField(
              style: TextStyle(color: labelText),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: labelText),
                ),
                labelText: 'Mobile No',
                labelStyle: TextStyle(
                  color: inputText,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [],
            ),
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
                'Already have an account ? ',
                style: TextStyle(
                  color: inputText,
                  fontFamily: 'Poppins',
                ),
              ),
              TextButton(
                onPressed: () {},
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
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
