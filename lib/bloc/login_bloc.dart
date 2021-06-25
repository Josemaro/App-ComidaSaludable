import 'dart:async';
import 'package:instructivoflut4/bloc/validar.dart';
import 'package:rxdart/rxdart.dart';

class Login_Bloc with Validar{
  final _emailController = BehaviorSubject<String>();
  final _claveController = BehaviorSubject<String>();

  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get claveStream => _claveController.stream.transform(validarClave);

  Stream<bool> get formValidStream =>
      CombineLatestStream.combine2(emailStream, claveStream,(e, p) =>true);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changeClave => _claveController.sink.add;

  dispose(){
    _emailController?.close();
    _claveController?.close();
  }
  String get correo => _emailController.value;
  String get clave => _claveController.value;

}

