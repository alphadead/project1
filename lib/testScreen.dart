import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/authController.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vamos'),
      ),
      body: GetBuilder<AuthController>(
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
