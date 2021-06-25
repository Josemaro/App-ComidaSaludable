import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instructivoflut4/pages/platilloList.dart';
import 'package:instructivoflut4/widgets/ListaHorizontal.dart';
import 'package:instructivoflut4/widgets/menuLateral.dart';

import 'home.dart';


class MPrincipal extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(title: Text('Recetas Saludables'),backgroundColor: Colors.redAccent,),
      drawer: MenuLateral(),
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        backgroundColor: Colors.white60,
        color: Colors.redAccent,
        items: <Widget>[
          Icon(Icons.fastfood_sharp, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.save, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
          if(index ==0){
            index = 1;
            Navigator.push(
              context,
              //MaterialPageRoute(builder: (context) => FirstRoute()),
              MaterialPageRoute(builder: (context) => Platillo_Page()),
            );
          }else if(index ==2){
            index = 1;
            Navigator.push(
              context,
              //MaterialPageRoute(builder: (context) => FirstRoute()),
              MaterialPageRoute(builder: (context) => Home_Page()),
            );
          }
        },
      ),
      body:
        ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              child:
              Text('Recetas Recientes',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),

            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              height: 190,
              child: ListaHorizontal(),
            ),

            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              child:
              Text('Novedades',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              child:
              Text('La aplicación Movil Recetas Saludables nos brinda información detallada acerca del valor nutricional de distintas comidas y además nos trae nuevas recetas '
                  'deliciosas y saludables. \n Proyecto desarrollado el framework Flutter y el lenguaje Dart con una Api desarrollada con SpringBoot',style: TextStyle(fontSize: 18),),
            ),
          ],
      )
    );
  }
}