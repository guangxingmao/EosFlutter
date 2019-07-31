import 'package:eos_flutter/common/style/mgx_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MgxItemWidget extends StatelessWidget {
  String placeHolder;
  IconData iconData;
  VoidCallback onPress;
  bool needLeftIcon;
  Color placeHolderColor;

  MgxItemWidget(
    this.placeHolder, {
    this.iconData,
    this.onPress,
    this.needLeftIcon = true,
    this.placeHolderColor = const Color(MgxColor.primary_colors_blue),
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 24),
        child: GestureDetector(
          ///点击事件
          onTap: () {
            onPress();
          },
          child: Container(
            height: 44,
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
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  children: <Widget>[
                    needLeftIcon
                        ? Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: Icon(
                              iconData,
                              color: Color(MgxColor.primary_colors_blue),
                              size: 16,
                            ),
                          )
                        : Container(),
                    Expanded(
                      child: new Text(
                        placeHolder,
                        style: TextStyle(
                          fontSize: 14,
                          color: placeHolderColor,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 4)),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(MgxColor.neutral_colors_grey_20),
                      size: 16,
                    ),
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
