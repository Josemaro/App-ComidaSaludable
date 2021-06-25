
import 'dart:async';

class Validar{

  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: ( email, sink){
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regexp = new RegExp(pattern);
      if(!regexp.hasMatch(email))
        sink.addError('Correo No Válido');
      else sink.add(email);
    }
  );

  final validarClave = StreamTransformer<String,String>.fromHandlers(
    handleData: (clave, sink){
      if(clave.length >=8)
        sink.add(clave);
      else
        sink.addError('Se Permite de 8 caracteres a más');
    }
  );
}