import 'package:dio/dio.dart';
import 'package:eos_flutter/common/ecc/key.dart';
import 'package:eos_flutter/common/model/history/get_key_account.dart';
import 'package:eos_flutter/common/net/api.dart';
import 'package:eos_flutter/common/net/api_point.dart';
import 'package:eos_flutter/common/utils/common_utils.dart';
import 'package:eos_flutter/common/utils/navigator_utils.dart';
import 'package:eos_flutter/widget/mgx_btn_widget.dart';
import 'package:eos_flutter/widget/mgx_input_widget.dart';
import 'package:eos_flutter/widget/mgx_material_widget.dart';
import 'package:flutter/material.dart';

import 'Import_account_page.dart';

class ImportWalletByPrivateKeyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MgxMaterialWidget(
      context,
      CommonUtils.getLocale(context).import_eos_by_privatekey,
      needLeftBtn: true,
      body: ImportWalletByPrivateBody(context),
    );
  }
}

class ImportWalletByPrivateBody extends StatefulWidget {
  BuildContext _context;

  ImportWalletByPrivateBody(this._context);

  @override
  _ImportWalletByPrivateBodyState createState() =>
      _ImportWalletByPrivateBodyState();
}

class _ImportWalletByPrivateBodyState extends State<ImportWalletByPrivateBody> {
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
    return Column(
      children: <Widget>[
        MgxInputWidget(
          CommonUtils.getLocale(widget._context).eos_privatekey_title,
          CommonUtils.getLocale(widget._context).input_privatekey_placeholder,
          maxLine: 3,
          controller: _privateKeyController,
        ),
        MgxBtnWidget(
          CommonUtils.getLocale(widget._context).input_privatekey_title,
          onPress: _enable
              ? () {
                  CommonUtils.showLoading(context, _findAccountByPublicKey);
                }
              : null,
        ),
      ],
    );
  }

  _findAccountByPublicKey(Function dismiss) async {
    try {
      EOSPrivateKey eosPrivateKey = EOSPrivateKey.fromString(_input);
      EOSPublicKey eosPublicKey = eosPrivateKey.toEOSPublicKey();
      String publickey = eosPublicKey.toString();

      var resultData = await httpManager.netFetch(Point.getKeyAccounts(),
          params: {"public_key": "${publickey}"},
          options: Options(method: "POST"));
      if (resultData != null && resultData.result) {
        GetKeyAccount getKeyAccount = GetKeyAccount.fromJson(resultData.data);
        if (getKeyAccount.accountNames.isEmpty) {
          CommonUtils.showErrorToast(
              CommonUtils.getLocale(widget._context).account_not_find);
        } else {
          NavigatorUtils.navigatorRouter(context, ImportAccountPage());
        }
      } else {
        CommonUtils.showErrorToast(resultData.data);
      }
    } catch (e) {
      CommonUtils.showErrorToast(
          CommonUtils.getLocale(widget._context).invalid_privatekey);
    } finally {
      dismiss();
    }
  }
}
