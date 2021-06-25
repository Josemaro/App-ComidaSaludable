import 'package:flutter/material.dart';
import 'package:instructivoflut4/models/UsuarioModel.dart';
import 'package:instructivoflut4/pages/platilloList.dart';
import 'package:instructivoflut4/providers/UsuarioProvider.dart';
import 'package:instructivoflut4/widgets/detalleUsuario.dart';
import 'package:instructivoflut4/widgets/menuLateral.dart';

import '../bloc/provider.dart';


class Home_Page extends StatelessWidget{

  final usuarioProvider = new UsuarioProvider();
  @override
  Widget build(BuildContext context){
    final bloc= Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Crear Usuarios'),
      ),
      drawer: MenuLateral(),
      body:
          _crearListado(),
      floatingActionButton:  _cargarInterfazUsuario(context),

    );
  }

  _cargarInterfazUsuario(BuildContext context){

    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.redAccent,
      onPressed: () => Navigator.pushNamed(context, 'usuario'),
    );
  }

  Widget _crearListado(){
    return FutureBuilder(
        future: usuarioProvider.cargarUsuarios(),
        builder: (BuildContext context, AsyncSnapshot<List<Usuario>> snapshot){
          if( snapshot.hasData){
            final productos = snapshot.data;

            return ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, i)=> _crearItem(context,productos[i]),

            );
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
        }
    );
  }

Widget _crearItem(BuildContext context, Usuario usuario){
  return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.deepPurple,
      ),
      onDismissed: (x){
      },
    child: Card(
      child: Column(
        children: <Widget>[

          ListTile(
            title: Text('${ usuario.nombres }'),
            subtitle: Text( usuario.email),
            onTap: () {
              Navigator.push(
                context,
                //MaterialPageRoute(builder: (context) => FirstRoute()),
                MaterialPageRoute(builder: (context) => DetalleUsuario(usuario)),
              );
            },
          ),

        ],
      ),
    ),
    );
  }
}



