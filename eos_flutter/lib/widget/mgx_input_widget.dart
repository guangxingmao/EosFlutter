import 'package:eos_flutter/common/style/mgx_style.dart';
import 'package:flutter/material.dart';

class MgxInputWidget extends StatelessWidget {
  String inputTitle;
  String hintText;
  int maxLine;
  TextEditingController controller;
  bool isPsd;

  MgxInputWidget(this.inputTitle, this.hintText,
      {this.maxLine = 1, this.controller,this.isPsd = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 24),
            child: Text(
              inputTitle,
              style: TextStyle(
                  fontSize: 14, color: Color(MgxColor.neutral_colors_grey_50)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                    color: Color(MgxColor.neutral_colors_grey_15),
                    width: 0.5,
                    style: BorderStyle.solid),
                bottom: BorderSide(
                    color: Color(MgxColor.neutral_colors_grey_15),
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
            ),
            child: Container(
              color: Color(MgxColor.white),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: 16, top: 12, right: 16, bottom: 12),
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: Color(MgxColor.neutral_colors_grey_20),
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                ),
                cursorColor: Color(MgxColor.primary_colors_blue),
                obscureText: isPsd,  //是否是密码
                style: TextStyle(
                  color: Color(MgxColor.black),
                  fontSize: 16,
                ),
                maxLines: maxLine,
                controller: controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
