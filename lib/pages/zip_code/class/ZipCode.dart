import 'package:json_annotation/json_annotation.dart';

part 'ZipCode.g.dart';

@JsonSerializable()
class ZipCode {
  String cep = "";
  String? logradouro = "";
  String complemento = "";
  String bairro = "";
  String localidade = "";
  String uf = "";
  int ibge = 0;
  int ddd = 0;

  ZipCode();

  factory ZipCode.fromJson(Map<String, dynamic> json) =>
      _$ZipCodeFromJson(json);

  Map<String, dynamic> toJson() => _$ZipCodeToJson(this);
}
