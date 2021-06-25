import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:instructivoflut4/models/PlatilloModel.dart';




class PlatilloProvider{
  final String _url = 'http://192.168.0.5:8080/platillo/listar';

  Future<List<Platillo>> cargarPlatillos() async {
    final List<Platillo> plts = [];
    final String url = '$_url';
    final resp = await http.get(
        Uri.parse(url),
        headers: {"Accept": "application/json"});

    if(jsonDecode(resp.body)==null) return[];
    else{
      final d= jsonDecode(resp.body);
      for(Map i in d){
        plts.add(Platillo.fromJson(i));
        print(plts);
      }
    }
    return plts;
  }

  final String _urla = 'http://192.168.0.5:8080/usuario/guardar';
  Future<bool> crearPlatillo(Platillo platillo) async {
    Map data = {
      "nombre": platillo.nombre,
      "tiempo_p": platillo.tiempoP,
      "ingredientes": platillo.ingredientes,
      "preparacion": platillo.preparacion,
      "calorias": platillo.calorias,
      "carbohidratos": platillo.carbohidratos,
      "fibra_d": platillo.fibraD,
      "proteinas": platillo.proteinas,
      "grasa_total": platillo.grasaTotal,
      "grasa_saturada": platillo.grasaSaturada,
      "grasa_trans": platillo.grasaTrans,
      "colesterol": platillo.colesterol,
      "sodio": platillo.sodio,
      "img": platillo.img
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
    var rpta = Platillo.fromJson(decodedData);
    if(rpta.id!=null)
      return true;
    else return true;
  }

}