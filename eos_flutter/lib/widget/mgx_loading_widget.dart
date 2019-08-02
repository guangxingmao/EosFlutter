import 'package:eos_flutter/common/style/mgx_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lottie/flutter_lottie.dart';

class MgxLoadingWidget extends StatefulWidget {
  Function dismissDialog;

  MgxLoadingWidget({this.dismissDialog});

  @override
  _MgxLoadingWidgetState createState() => _MgxLoadingWidgetState();
}

class _MgxLoadingWidgetState extends State<MgxLoadingWidget> {

  _dismissDialog() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    if (widget.dismissDialog != null) {
      widget.dismissDialog(_dismissDialog);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new SizedBox(
        width: 96,
        height: 96,
        child: Container(
          decoration: ShapeDecoration(
            color: Color(MgxColor.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(24),
            child: LottieView.fromFile(
              filePath: 'assets/files/loading.json',
              autoPlay: true,
              loop: true,
            ),
          ),
        ),
      ),
    );
  }
}
