import 'dart:convert';

import 'package:eos_flutter/common/config/Config.dart';
import 'package:eos_flutter/common/local/local_storage.dart';
import 'package:eos_flutter/common/model/eos.dart';
import 'package:eos_flutter/common/redux/eos_redux.dart';
import 'package:eos_flutter/common/redux/mgx_state.dart';
import 'package:redux/src/store.dart';

class EosDao {

  ///初始化本地eos信息
  static initEosInfo(Store<MgxState> store) async {
    var eos = await getEosInfoLocal();
    if (eos != null) {
      //通知更新
      store.dispatch(UpdateEosAction(eos));
    }
    return eos;
  }

  static getEosInfoLocal() async {
    var eosText = await LocalStorage.get(Config.EOS_INFO);
    if (eosText != null) {
      Map eosMap = json.decode(eosText);
      Eos eos = Eos.fromJson(eosMap);
      return eos;
    } else {
      return null;
    }
  }
}
