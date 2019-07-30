import 'package:json_annotation/json_annotation.dart';

part 'eos.g.dart';

@JsonSerializable()
class Eos {
  String nickName;
  String privateKey;
  String publicKey;

  Eos(this.nickName, this.privateKey, this.publicKey); // 命名构造函数
  Eos.empty();

  factory Eos.fromJson(Map<String, dynamic> json)=> _$EosFromJson(json);

  Map<String,dynamic> toJson()=>_$EosToJson(this);
}
