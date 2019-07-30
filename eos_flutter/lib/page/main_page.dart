import 'package:eos_flutter/common/style/mgx_style.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  static final sName = "/main";

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(MgxColor.black),
//      child: new Text(
//        "这是main",
//        textAlign: TextAlign.center,
//      ),
    );
  }
}
