// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ZipCode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ZipCode _$ZipCodeFromJson(Map<String, dynamic> json) {
  return ZipCode()
    ..cep = json['cep'] as String
    ..logradouro = json['logradouro'] as String?
    ..complemento = json['complemento'] as String
    ..bairro = json['bairro'] as String
    ..localidade = json['localidade'] as String
    ..uf = json['uf'] as String
    ..ibge = json['ibge'] as int
    ..ddd = json['ddd'] as int;
}

Map<String, dynamic> _$ZipCodeToJson(ZipCode instance) => <String, dynamic>{
      'cep': instance.cep,
      'logradouro': instance.logradouro,
      'complemento': instance.complemento,
      'bairro': instance.bairro,
      'localidade': instance.localidade,
      'uf': instance.uf,
      'ibge': instance.ibge,
      'ddd': instance.ddd,
    };
