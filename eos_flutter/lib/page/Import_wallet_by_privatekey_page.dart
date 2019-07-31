import 'package:eos_flutter/common/ecc/key.dart';
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

  void _findAccountByPublicKey() {
    try{
      EOSPrivateKey privateKey = EOSPrivateKey.fromString(_input);
      EOSPublicKey publicKey = privateKey.toEOSPublicKey();

    }catch(e) {
      CommonUtils.showErrorToast(CommonUtils.getLocale(context).invalid_privatekey);
    }
  }
}
