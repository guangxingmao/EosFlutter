import 'package:eos_flutter/common/style/mgx_style.dart';
import 'package:flutter/material.dart';

class MgxBtnWidget extends StatelessWidget {
  String text;
  VoidCallback onPress;

  MgxBtnWidget(this.text,{this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 24),
      height: 44,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Container(
          alignment: Alignment.center,
          child: new Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Color(MgxColor.white),
            ),
          ),
        ),
        disabledColor: Color(MgxColor.primary_colors_disable_blue),
        color:Color(MgxColor.primary_colors_teal_blue),
        onPressed: onPress,
      ),
    );
  }
}
