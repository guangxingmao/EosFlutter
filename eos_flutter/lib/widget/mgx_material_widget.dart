import 'package:eos_flutter/common/style/mgx_style.dart';
import 'package:flutter/material.dart';

class MgxMaterialWidget extends StatelessWidget {
  BuildContext buildContext;
  String title;
  Widget body;
  Color backgroundColor;
  bool needLeftBtn;
  VoidCallback leftPress;

  MgxMaterialWidget(
    this.buildContext,
    this.title, {
    this.backgroundColor = const Color(MgxColor.background_colors_default),
    this.body,
    this.leftPress,
    this.needLeftBtn = true,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: Builder(builder: (BuildContext context) {
            return needLeftBtn
                ? IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                    onPressed: leftPress != null
                        ? leftPress
                        : () {
                            Navigator.pop(buildContext);
                          })
                : Container();
          }),
          title: Container(
            child: Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
          ),
          centerTitle: true,
        ),
        body: body,
      ),
    );
  }
}
