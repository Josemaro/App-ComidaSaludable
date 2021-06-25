import 'package:flutter/material.dart';
import 'package:instructivoflut4/models/UsuarioModel.dart';
import 'package:instructivoflut4/providers/UsuarioProvider.dart';
import 'package:intl/intl.dart';
import 'package:instructivoflut4/utils/dateTimePicker.dart';
import 'package:date_format/date_format.dart';


void main() => runApp(Usuario_Page());

class Usuario_Page extends StatefulWidget {
  @override
  _Usuario_PageState createState() => _Usuario_PageState();
}

class _Usuario_PageState extends State<Usuario_Page> {

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final usuarioProvider = new UsuarioProvider();

  Usuario usuario = new Usuario();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text('Usuario'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  _crearNombres(),
                  _crearApellidoP(),
                  _crearApellidoM(),
                  _crearEmail(),
                  //_crearFechaNac(),
                  _crearPassword(),
                  _crearBoton()
                ],
              ),
            ),
          ),
        )
    );
  }
  Widget _crearNombres() {
    return TextFormField(
      initialValue: usuario.nombres,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombres'),
      onSaved: (value)=> usuario.nombres = value,
      validator: (value){
        if(value.length<3){
          return 'Ingrese el nombre del Usuario';
        }else{
          return null;
        }
      },
    );
  }


  Widget _crearApellidoP() {
    return TextFormField(
      initialValue: usuario.apellidoPaterno,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Apellido Paterno'),
      onSaved: (value)=> usuario.apellidoPaterno = value,
      validator: (value){
        if(value.length<3){
          return 'Ingrese el apellido paterno del Usuario';
        }else{
          return null;
        }
      },
    );
  }

  Widget _crearApellidoM() {
    return TextFormField(
      initialValue: usuario.apellidoMaterno,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Apellido Materno'),
      onSaved: (value)=> usuario.apellidoMaterno = value,
      validator: (value){
        if(value.length<3){
          return 'Ingrese el apellido materno del Usuario';
        }else{
          return null;
        }
      },
    );
  }

  Widget _crearEmail() {
    return TextFormField(
      initialValue: usuario.email,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Correo electrónico'),
      onSaved: (value)=> usuario.email = value,
      validator: (value){
        if(value.length<3){
          return 'Ingrese el correo del usuario';
        }else{
          return null;
        }
      },
    );
  }

  Widget _crearPassword() {
    return TextFormField(
      initialValue: usuario.password,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Contraseña'),
      onSaved: (value)=> usuario.password = value,
      validator: (value){
        if(value.length<3){
          return 'Ingrese una contraseña';
        }else{
          return null;
        }
      },
    );
  }
  /*
  Widget _crearFechaNac() {
    final format = DateFormat("yyyy-MM-dd");
    return Column(
      children: <Widget>[
        DateTimeField(
            decoration: InputDecoration(labelText: 'Fecha Nacimiento'),
            format: format,
            onSaved: (value)=>usuario.fechaNac = formatDate(value,[yyyy,'-',mm,'-',dd]).toString() as DateTime,
            onShowPicker: (context,currentValue){
              return showDatePicker(
                  context: context,
                  initialDate: currentValue ?? DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100)
              );
            }
        )
      ],
    );
  }
*/
  Widget  _crearBoton(){
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.redAccent,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: _submit//GUARDANDO
    );
  }

  void _submit() async{
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();

    if(usuario.id == null){
      usuarioProvider.crearUsuario(usuario).then((rpta){
        print('RPTA: ${rpta}');
      });
    }
  }



}



