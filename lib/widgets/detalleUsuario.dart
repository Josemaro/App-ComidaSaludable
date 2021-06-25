import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instructivoflut4/models/PlatilloModel.dart';
import 'package:instructivoflut4/models/UsuarioModel.dart';

//void main() => runApp(DetallePlatillo());


class DetalleUsuario extends StatelessWidget {
  Usuario usuario;
  DetalleUsuario(this.usuario);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(title: Text('Datos de Usuario'),backgroundColor: Colors.redAccent,),
      body: ListView(
        padding: EdgeInsets.only(left: 40,right: 40),
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red[300],
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Image.network('https://i.ibb.co/f8pRd3T/Whats-App-Image-2021-06-25-at-1-23-42-AM.jpg'),
          ),
          SizedBox(
            height: 30,
          ),
          Text('Nombres',style: TextStyle(fontSize: 20,color: Colors.purple),),
          SizedBox(height: 5,),
          Text(usuario.nombres,style: TextStyle(fontSize: 25,color: Colors.black),),
          SizedBox(height: 10,),
          Text('Apellidos',style: TextStyle(fontSize: 20,color: Colors.purple),),
          SizedBox(height: 5,),
          Text(usuario.apellidoPaterno+' '+usuario.apellidoMaterno,style: TextStyle(fontSize: 25,color: Colors.black),),
          SizedBox(height: 10,),
          Text('Direccion de correo electronico',style: TextStyle(fontSize: 20,color: Colors.purple),),
          SizedBox(height: 5,),
          Text(usuario.email,style: TextStyle(fontSize: 25,color: Colors.black),),
        ],
      ),
    );
  }
}
