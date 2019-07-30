import 'package:flutter/material.dart';

class MgxTitleBarWidget extends StatelessWidget {
  final String title;
  final IconData iconData;
  final bool needRightLocalIcon;
  final Widget rightWidget;
  final VoidCallback onPressed;

  MgxTitleBarWidget(this.title,
      {this.iconData,
      this.needRightLocalIcon = false,
      this.rightWidget,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    Widget widget = rightWidget;
    if (rightWidget == null) {
      widget = (needRightLocalIcon)
          ? IconButton(icon: Icon(iconData), onPressed: onPressed)
          : Container();
    }
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          widget
        ],
      ),
    );
  }
}
