import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' as http;
//import 'package:instructivoflut4/models/EmpleadoModel.dart';

import '../models/EmpleadoModel.dart';
class EmpleadoProvider {
  final String _url = 'http://192.168.0.5:8080/usuario/listar';
  Future<List<EmpleadoModel>> cargarEmpleados() async {
    final List<EmpleadoModel> empls = [];
    final String url = '$_url';
    final resp = await http.get(
        Uri.parse(url),
        headers: {"Accept": "application/json"});

    if(jsonDecode(resp.body)==null) return[];
    else{
      final d= jsonDecode(resp.body);
      for(Map i in d){
        empls.add(EmpleadoModel.fromJson(i));
        print(empls);
      }
    }
    return empls;
  }
}


















