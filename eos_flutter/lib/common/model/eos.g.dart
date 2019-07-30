// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Eos _$EosFromJson(Map<String, dynamic> json) {
  return Eos(
    json['nickName'] as String,
    json['privateKey'] as String,
    json['publicKey'] as String,
  );
}

Map<String, dynamic> _$EosToJson(Eos instance) => <String, dynamic>{
      'nickName': instance.nickName,
      'privateKey': instance.privateKey,
      'publicKey': instance.publicKey,
    };
