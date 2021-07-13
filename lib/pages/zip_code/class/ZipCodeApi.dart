import 'dart:convert';

import 'package:flutter_playground/pages/zip_code/class/ZipCode.dart';
import 'package:http/http.dart' as http;

class ZipCodeApi {
  final String _apiPath = "viacep.com.br";
  // Uri.https(server, uri)

  Future<ZipCode?> getAdressByZipCode(String zipCode) async {
    http.Response response = await http.get(_getRequestUri(zipCode));
    if (response.statusCode == 200) {
      return ZipCode.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 400) {
      // TODO: Mostrar Dialog de cep invalido
      return null;
    }
    // Mostrar Dialog de erro generico
    return ZipCode();
  }

  Uri _getRequestUri(String zipCode) {
    return Uri.https(_apiPath, _getRequestPath(zipCode));
  }

  String _getRequestPath(String zipCode) {
    return "/ws/$zipCode/json";
  }
}
