import 'package:flutter/material.dart';
import 'package:instructivoflut4/Dto/JsonDto.dart';
import 'package:instructivoflut4/Dto/LoginDto.dart';
import 'package:instructivoflut4/bloc/provider.dart';
import 'package:instructivoflut4/providers/LoginProvider.dart';

import '../bloc/login_bloc.dart';
import 'mprincipal.dart';

final loginProvider = new LoginProvider();

class Login_Page extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
     body: Stack(
       children: <Widget>[
         _apertura_fondo(context),
         _loginForm(context)
       ],
     ),
    );
  }
}

  Widget _loginForm(BuildContext context){

    final bloc = Provider.of(context);

    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child:  Column(
        children: <Widget>[
          SafeArea(
           child: Container(
             height: 220,
           ),
          ),
          //FORMULARIO LOGIN

          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0,5),
                    spreadRadius: 3.0
                  )
                ]
            ),
            child: Column(
              children: <Widget>[
                Text('Ingreso'),
                SizedBox(height: 50),
                _objetoCorreo(bloc),
                SizedBox(height: 10),
                _objetoClave(bloc),
                SizedBox(height: 10),
                _objetoBoton(bloc),
              ],
            ),
          ),
          Text('Olvidó la contraseña?'),
          SizedBox(height: 100)
        ],
      ),
    );
  }



  Widget _objetoBoton(Login_Bloc bloc){
    return StreamBuilder(
      stream: bloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot){

        return RaisedButton(
        child:Container(
          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
          child: Text('Ingresar', style: TextStyle(fontSize: 15)),
        ),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
          ),

      elevation: 1,
      color: Colors.redAccent,
      textColor: Colors.white,
      onPressed: snapshot.hasData?()=>_login(bloc, context):null,
          );
        }
      );
  }

_login(Login_Bloc bloc, BuildContext context){
  print(bloc.correo);
  print(bloc.clave);
  LoginDto loginDto = new LoginDto();
  loginDto.email=bloc.correo;
  loginDto.password=bloc.clave;
  //loginProvider.loginUsuario(loginDto);
  loginProvider.loginUsuario(loginDto);

  Navigator.push(context,
    //MaterialPageRoute(builder: (context) => FirstRoute()),
    MaterialPageRoute(builder: (context) => MPrincipal()),
  );
}

  Widget _objetoClave(Login_Bloc bloc){
  TextEditingController gestorClave = TextEditingController()..text ='12345678';
    return StreamBuilder(
      stream: bloc.claveStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: gestorClave,
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock_outline, color: Colors.deepPurple,),
                labelText: 'Contraseña',
                errorText: snapshot.error
            ),
            onChanged: bloc.changeClave,
          ),
        );
      }
    );
  }

  Widget _objetoCorreo(Login_Bloc bloc){
    TextEditingController gestorText= TextEditingController()..text ='correo@correo.com';
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){

        return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: gestorText,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.alternate_email, color: Colors.deepPurple,),
                  hintText: 'correo@correo.com',
                  labelText: 'Correo',
                  //counterText: snapshot.data
                errorText: snapshot.error
                ),
              onChanged: bloc.changeEmail,
              ),
            );
          }
        );
  }

  Widget _apertura_fondo(BuildContext context){
    final size = MediaQuery.of(context).size;
    final fondo01 = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(90, 10, 55, 1.0),
            Color.fromRGBO(153, 11, 11, 1.0),
          ]
        )
      ),
    );
  final adorno = Container(
    width: 80, height: 80,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: Color.fromRGBO(255, 255, 255, 0.05)
    ),
  );

    return Stack(
      children: <Widget>[
        fondo01,
        Positioned(top: 90, left: 30, child: adorno),
        Positioned(top: -40, left: -10, child: adorno),
        Positioned(left: 150,bottom: 30,child: adorno),
        Positioned(left: 210, bottom: 30, child: adorno),
        Positioned(right: 5,top:100, child: adorno),


        Container(
          padding: EdgeInsets.only(top: 80),
          child: Column(
            children: <Widget>[
              Icon(Icons.person_pin, color: Colors.white, size: 100),
              SizedBox(height: 10, width: double.infinity),
              Text('Application Login',style:
                TextStyle(color:Colors.white, fontSize: 25),)
            ],
          ),
        )
      ],
    );


  }
