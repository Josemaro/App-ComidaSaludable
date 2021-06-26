import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:instructivoflut4/Dto/JsonDto.dart';
import 'package:instructivoflut4/Dto/LoginDto.dart';
import '../models/UsuarioModel.dart';

class LoginProvider{

  final String _urla = 'http://192.168.0.5:8080/auth/login';

  Future<JsonDto> loginUsuario(LoginDto loginDto) async {
    Map data = {
      "email": loginDto.email,
      "password": loginDto.password,
    };
    print(data.toString());
    final urla = '$_urla';
    final resp = await http.post(
      Uri.parse(urla),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );
    final decodedData = json.decode(resp.body);
    print('${decodedData}');//COMPROBAR RESULTADO
    var rpta = Usuario.fromJson(decodedData);




    if(rpta.id!=null)
      return decodedData;
    else return null;
  }
}