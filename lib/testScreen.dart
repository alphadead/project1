import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/formWidgets/buttons.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  Map<String, bool?> values = {
    'Player Name': true,
    'Location': false,
    'Age': false,
    'Rating': false,
    'Player Role': false,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vamos'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:70.0,left: 240),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: KRed)
                ),
                child: Icon(Icons.close_outlined,color: KRed,)),
            ),
            Expanded(
              child: SizedBox(
                height: 100.h,
                child: ListView(
                  children: values.keys.map((String key) {
                    return Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      child: new CheckboxListTile(
                        contentPadding: EdgeInsets.only(left: 10),
                        dense: true,
                        activeColor: KRed,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: new Text(
                          key,
                          style: values[key] == false
                              ? themeData().textTheme.headline5
                              : themeData().textTheme.headline6,
                        ),
                        value: values[key],
                        onChanged: (bool? value) {
                          setState(() {
                            values[key] = value;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:7,bottom:50.0,right: 15),
              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                            width: 120.h,
                            height: 40.w,
                            child: Center(
                              child: Text(
                                'Clear',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: moneyBox,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: GestureDetector(
                      child: Container(
                            width: 120.h,
                            height: 40.w,
                            child: Center(
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: KRed,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          GetBuilder<AuthController>(
            builder: (_authService) => SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        _authService.loadAssets();
                      },
                      child: Text("data")),
                  SizedBox(
                    height: 200,
                    child: buildGridViewPic(),
                  )
                ],
              ),
            ),
          ),
          Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              child: Text("DRAWER TEST"),
            );
          }),
        ],
      ),
    );
  }

  Widget buildGridViewPic() {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        9,
        (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              width: 100,
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }
}
