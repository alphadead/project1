import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/theme.dart';

List<CustomBottomAppBarItem> iconList = [
  CustomBottomAppBarItem(
      imageData: "assets/images/BottomAppBarProfile.png", text: "Profile"),
  CustomBottomAppBarItem(
      imageData: "assets/images/BottomAppBarWallet.png", text: "Wallet"),
  CustomBottomAppBarItem(
      imageData: "assets/images/BottomAppBarpedestal.png",
      text: "Leader Board"),
  CustomBottomAppBarItem(
      imageData: "assets/images/BottomAppBarsettings.png", text: "Settings"),
];

class CustomBottomAppBarItem {
  CustomBottomAppBarItem({this.imageData = "", this.text = ""});
  String imageData;
  String text;
}

class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({
    this.height: 50.0,
    this.color: Colors.black,
    this.selectedColor: Colors.red,
  });
  final double? height;
  final Color? color;
  final Color? selectedColor;

  @override
  State<StatefulWidget> createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(iconList.length, (int index) {
      return _buildTabItem(
        item: iconList[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items,
        ),
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(),
        ],
      ),
    );
  }

  Widget _buildTabItem({
    CustomBottomAppBarItem? item,
    int index = 0,
    ValueChanged<int>? onPressed,
  }) {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed != null ? onPressed(index) : () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25.h,
                  child: Image.asset(
                    item != null ? item.imageData : "",
                  ),
                ),
                Text(
                  item != null ? item.text : "",
                  style: themeData().textTheme.headline4?.copyWith(
                        color:
                            index == _selectedIndex ? Colors.red : Colors.black,
                      ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
