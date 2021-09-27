import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

enum CreateTeamPreviewType { regular, created }

class TeamPreviewScreen extends StatefulWidget {
  const TeamPreviewScreen({Key? key}) : super(key: key);
  @override
  createState() => _TeamPreviewState();
}

class _TeamPreviewState extends State<TeamPreviewScreen> {
  List<String> wkList = [];
  List<String> batList = [];
  List<String> arList = [];

  @override
  void initState() {
    super.initState();

    wkList.add('');

    batList.add('');
    batList.add('');
    batList.add('');

    arList.add('Pankaj');
    arList.add('Pankaj');
    arList.add('Pankaj');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(children: <Widget>[
      Scaffold(
          backgroundColor: Colors.transparent,
          body:
              Stack(alignment: AlignmentDirectional.center, children: <Widget>[
            Opacity(
                opacity: 0.8,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Image.asset('assets/groundImage.webp',
                        fit: BoxFit.cover))),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 1),
                  Column(children: <Widget>[
                    matchHeader('GOAL - KEEPER'),
                    getTypeList(wkList)
                  ]),
                  Column(children: <Widget>[
                    matchHeader('DEFENDER'),
                    getTypeList(batList)
                  ]),
                  Column(children: <Widget>[
                    matchHeader('ATTACKER'),
                    getTypeList(arList),
                  ]),
                  SizedBox(height: 8)
                ])
          ])),
      Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Container(
              height: AppBar().preferredSize.height,
              child: Row(children: <Widget>[
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                            width: AppBar().preferredSize.height,
                            height: AppBar().preferredSize.height,
                            child: Icon(Icons.close, color: Colors.white)))),
                Expanded(child: Container())
              ])))
    ]));
  }

  matchHeader(String title) => Container(
      padding: EdgeInsets.only(bottom: 8, top: 4),
      child: Text(title, style: TextStyle(color: Colors.white)));

  Widget getTypeList(List<String> list) {
    List<Widget> widgetList = [];
    list.forEach((data) {
      widgetList.add(getPlayerView(data));
    });

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: widgetList,
    );
  }

  Widget getPlayerView(String player) {
    return Stack(children: <Widget>[
      Container(
          padding: EdgeInsets.only(
              left: (MediaQuery.of(context).size.width > 360 ? 8 : 4),
              right: (MediaQuery.of(context).size.width > 360 ? 8 : 4)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    onTap: () {},
                    child: Container(
                        width:
                            (MediaQuery.of(context).size.width > 360 ? 45 : 40),
                        height:
                            (MediaQuery.of(context).size.width > 360 ? 45 : 40),
                        child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.1),
                            backgroundImage:
                                ExactAssetImage("assets/user_profile.png")))),
                Container(
                    padding:
                        EdgeInsets.only(left: 6, top: 2, bottom: 2, right: 6),
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(4.0),
                        boxShadow: <BoxShadow>[BoxShadow(color: Colors.white)]),
                    child: Center(
                        child: Text('name',
                            style: TextStyle(color: Colors.blue)))),
              ])),
      Positioned(
          top: 0,
          left: 0,
          child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: new BorderRadius.circular(32.0),
                  border: new Border.all(width: 1.0, color: Colors.black12)),
              child: Container(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Center(child: Text('C')))))
    ]);
  }
}
