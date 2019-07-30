import 'package:eos_flutter/common/style/mgx_style.dart';
import 'package:flutter/cupertino.dart';

class MgxInputWidget extends StatelessWidget {
  String inputTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            inputTitle,
            style: TextStyle(
              fontSize: 14,
              color: Color(MgxColor.neutral_colors_grey_15)
            ),
          ),
        ],
      ),
    );
  }
}
