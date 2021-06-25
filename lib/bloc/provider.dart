import 'package:instructivoflut4/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
export 'package:instructivoflut4/bloc/login_bloc.dart';


class Provider extends InheritedWidget{
  final loginBloc = Login_Bloc();
  Provider({Key key, Widget child}): super(key: key, child: child);

  @override

  bool updateShouldNotify(InheritedWidget oldWidget) =>true;

  static Login_Bloc of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }
}