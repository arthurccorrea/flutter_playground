//TODO: PAGINA PARA CONSUMIR A API DO VIACEP (https://viacep.com.br) e retornar o endereço e botão para abrir endereço no maps
import 'package:flutter/material.dart';

class ZipCodeFinder extends StatefulWidget {
  ZipCodeFinder({Key? key}) : super(key: key);

  @override
  _ZipCodeFinderState createState() => _ZipCodeFinderState();
}

class _ZipCodeFinderState extends State<ZipCodeFinder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zip Code Finder"),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
