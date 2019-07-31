class Point {

  static const String base_url = "https://api.eoslaomao.com/v1/";

  ///通过公钥获取账户列表
  static getKeyAccounts() {
    return "${base_url}history/get_key_accounts";
  }


}