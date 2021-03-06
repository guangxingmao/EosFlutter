class GetKeyAccount {
  List<String> _accountNames;

  Autogenerated({List<String> accountNames}) {
    this._accountNames = accountNames;
  }

  List<String> get accountNames => _accountNames;
  set accountNames(List<String> accountNames) => _accountNames = accountNames;

  GetKeyAccount.fromJson(Map<String, dynamic> json) {
    _accountNames = json['account_names'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_names'] = this._accountNames;
    return data;
  }
}
