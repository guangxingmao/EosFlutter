import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eos_flutter/common/ecc/key.dart';
import 'package:eos_flutter/common/model/history/get_key_account.dart';
import 'package:eos_flutter/common/net/api.dart';
import 'package:eos_flutter/common/net/api_point.dart';
import 'package:eos_flutter/common/net/result_data.dart';
import 'package:eos_flutter/common/utils/common_utils.dart';
import 'package:eos_flutter/common/utils/navigator_utils.dart';
import 'package:eos_flutter/widget/mgx_btn_widget.dart';
import 'package:eos_flutter/widget/mgx_input_widget.dart';
import 'package:eos_flutter/widget/mgx_material_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ImportWalletByPrivateKeyPage extends StatefulWidget {
  @override
  _ImportWalletByPrivateKeyPageState createState() =>
      _ImportWalletByPrivateKeyPageState();
}

class _ImportWalletByPrivateKeyPageState
    extends State<ImportWalletByPrivateKeyPage> {
  TextEditingController _privateKeyController = TextEditingController();
  bool _enable = false;
  String _input;

  @override
  void initState() {
    _privateKeyController.addListener(() {
      setState(() {
        ///更新enable状态
        _input = _privateKeyController.text;
        if (_input.isEmpty) {
          _enable = false;
        } else {
          _enable = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MgxMaterialWidget(
      context,
      CommonUtils.getLocale(context).import_eos_by_privatekey,
      needLeftBtn: true,
      body: Column(
        children: <Widget>[
          MgxInputWidget(
            context,
            CommonUtils.getLocale(context).eos_privatekey_title,
            CommonUtils.getLocale(context).input_privatekey_placeholder,
            maxLine: 3,
            controller: _privateKeyController,
          ),
          MgxBtnWidget(
            CommonUtils.getLocale(context).input_privatekey_title,
            onPress: _enable
                ? () {
                    _findAccountByPublicKey();
                  }
                : null,
          ),
        ],
      ),
    );
  }

  void _findAccountByPublicKey() async {
    String publickey;
    try {
      EOSPrivateKey eosPrivateKey = EOSPrivateKey.fromString(_input);
      EOSPublicKey eosPublicKey = eosPrivateKey.toEOSPublicKey();
      publickey = eosPublicKey.toString();
//      var res = await httpManager.netFetch(
//          "https://eosmainnet.medishares.net/v1/history/get_key_accounts",{"public_key":"${publicKey.toString()}"});
//      print("dfdfd${res.data}");

//      var res = await httpManager.netFetch(
//          "https://eosmainnet.medishares.net/v1/chain/get_account",
//          params: {"account_name": "g43tsnbygqge1"},
//          options: Options(method: "POST"));
    } catch (e) {
      CommonUtils.showErrorToast(
          CommonUtils.getLocale(context).invalid_privatekey);
//      return;
    }
    publickey = "5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3";
    var resultData = await httpManager.netFetch(Point.getKeyAccounts(),
        params: {
          "public_key": "EOS7jbyMfRRcdwsdTHYRYbMBkkgYWTxZA61HZSHGuiSdJdiJr9H9d"
        },
        options: Options(method: "POST"));
    if (resultData != null && resultData.result) {
      GetKeyAccount getKeyAccount = GetKeyAccount.fromJson(resultData.data);
      if (getKeyAccount.accountNames.isEmpty) {
        CommonUtils.showErrorToast(
            CommonUtils.getLocale(context).account_not_find);
      } else {
        //TODO 选择账户导入页面
        print("选择账户导入页面");
      }
    } else {
      CommonUtils.showErrorToast(resultData.data);
    }
  }
}
