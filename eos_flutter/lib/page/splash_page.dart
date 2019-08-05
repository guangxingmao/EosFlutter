import 'package:eos_flutter/common/dao/eos_dao.dart';
import 'package:eos_flutter/common/redux/mgx_state.dart';
import 'package:eos_flutter/common/style/mgx_style.dart';
import 'package:eos_flutter/common/utils/navigator_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:redux/redux.dart';

class SplashPage extends StatefulWidget {
  static final String sName = "/";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Store<MgxState> store = StoreProvider.of<MgxState>(context);
    //延迟两秒
    new Future.delayed(const Duration(seconds: 2), () {
      EosDao.initEosInfo(store).then((eos) {
        if (eos != null) {
          //本地存在缓存则前往首页
          NavigatorUtils.goMain(context);
        } else {
          //本地不存在，则前往创建导入页面
          NavigatorUtils.goWallet(context);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: new SvgPicture.asset(
                'assets/images/launchscreen_inmathwetrust.svg'),
          ),
          new SvgPicture.asset(
            'assets/images/launchscreen_logo.svg',
            height: 44,
          ),
        ],
      ),
      padding: const EdgeInsets.only(bottom: 64),
    );
  }
}
