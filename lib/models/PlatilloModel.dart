// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Platillo welcomeFromJson(String str) => Platillo.fromJson(json.decode(str));

String welcomeToJson(Platillo data) => json.encode(data.toJson());

class Platillo {
  Platillo({
    this.id,
    this.nombre,
    this.tiempoP,
    this.ingredientes,
    this.preparacion,
    this.calorias,
    this.carbohidratos,
    this.fibraD,
    this.proteinas,
    this.grasaTotal,
    this.grasaSaturada,
    this.grasaTrans,
    this.colesterol,
    this.sodio,
    this.img,
  });

  int id;
  String nombre;
  String tiempoP;
  String ingredientes;
  String preparacion;
  String calorias;
  String carbohidratos;
  String fibraD;
  String proteinas;
  String grasaTotal;
  String grasaSaturada;
  String grasaTrans;
  String colesterol;
  String sodio;
  String img;

  factory Platillo.fromJson(Map<String, dynamic> json) => Platillo(
    id: json["id"],
    nombre: json["nombre"],
    tiempoP: json["tiempo_p"],
    ingredientes: json["ingredientes"],
    preparacion: json["preparacion"],
    calorias: json["calorias"],
    carbohidratos: json["carbohidratos"],
    fibraD: json["fibra_d"],
    proteinas: json["proteinas"],
    grasaTotal: json["grasa_total"],
    grasaSaturada: json["grasa_saturada"],
    grasaTrans: json["grasa_trans"],
    colesterol: json["colesterol"],
    sodio: json["sodio"],
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "tiempo_p": tiempoP,
    "ingredientes": ingredientes,
    "preparacion": preparacion,
    "calorias": calorias,
    "carbohidratos": carbohidratos,
    "fibra_d": fibraD,
    "proteinas": proteinas,
    "grasa_total": grasaTotal,
    "grasa_saturada": grasaSaturada,
    "grasa_trans": grasaTrans,
    "colesterol": colesterol,
    "sodio": sodio,
    "img": img,
  };
}
