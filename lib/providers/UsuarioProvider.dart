import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:instructivoflut4/models/UsuarioModel.dart';
import '../models/UsuarioModel.dart';

class UsuarioProvider{
  final String _url = 'http://192.168.0.5:8080/usuario/listar';
  Future<List<Usuario>> cargarUsuarios() async {
    final List<Usuario> usrs = [];
    final String url = '$_url';
    final resp = await http.get(
        Uri.parse(url),
        headers: {"Accept": "application/json"});

    if(jsonDecode(resp.body)==null) return[];
    else{
      final d= jsonDecode(resp.body);
      for(Map i in d){
        usrs.add(Usuario.fromJson(i));
        print(usrs);
      }
    }
    return usrs;
  }

  final String _urla = 'http://192.168.0.5:8080/usuario/guardar';
  Future<bool> crearUsuario(Usuario usuario) async {
    Map data = {
      "id": "",
      "nombres": usuario.nombres,
      "apellido_paterno": usuario.apellidoPaterno,
      "apellido_materno": usuario.apellidoMaterno,
      "email": usuario.email,
      "password": usuario.password,
      //"fecha_nac": usuario.fechaNac
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
      return true;
    else return true;
  }
}
