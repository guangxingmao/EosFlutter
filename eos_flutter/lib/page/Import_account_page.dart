import 'package:eos_flutter/widget/mgx_loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//class ImportAccountPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: CupertinoButton(
//        child: Text("点击我"),
//        onPressed:() {
//          showDialog(
//              context: context,
//              builder: (context) {
//                return MediaQuery(child: new MgxLoadingWidget());
//              });
//        },
//      ),
//    );
//  }
//}

class ImportAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingWidget(context),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  BuildContext buildContext;

  LoadingWidget(this.buildContext);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text("点击我"),
      onPressed: () {
        showDialog(
            context: buildContext,
            builder: (buildContext) {
              return MediaQuery(
                child: new MgxLoadingWidget(),

                ///不受系统字体缩放影响
                data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                    .copyWith(textScaleFactor: 1),
              );
            });
      },
    );
  }
}
