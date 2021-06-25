// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Usuario> welcomeFromJson(String str) => List<Usuario>.from(json.decode(str).map((x) => Usuario.fromJson(x)));

String welcomeToJson(List<Usuario> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usuario {
  Usuario({
    this.id,
    this.nombres,
    this.apellidoPaterno,
    this.apellidoMaterno,
    this.email,
    //this.fechaNac,
  });

  int id;
  String nombres;
  String apellidoPaterno;
  String apellidoMaterno;
  String email;
  //DateTime fechaNac;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    id: json["id"],
    nombres: json["nombres"],
    apellidoPaterno: json["apellido_paterno"],
    apellidoMaterno: json["apellido_materno"],
    email: json["email"],
    //fechaNac: DateTime.parse(json["fecha_nac"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombres": nombres,
    "apellido_paterno": apellidoPaterno,
    "apellido_materno": apellidoMaterno,
    "email": email,
    //"fecha_nac": fechaNac.toIso8601String(),
  };
}
