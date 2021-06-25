import 'package:flutter/material.dart';

import 'Card.dart';


class ListaHorizontal extends StatefulWidget {
  @override
  _ListaHorizontalState createState() => _ListaHorizontalState();
}

class _ListaHorizontalState extends State<ListaHorizontal> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 250.0,
          height: 310.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.redAccent),
          //color: Colors.red,
          //padding: EdgeInsets.only(left: 3,right: 3),
          child: Card1("https://i.ibb.co/6H9nMzB/Huevos-Rancheros-con-Pico-de-Gallo.png"),
        ),
        SizedBox(width: 5,),
        Container(
          width: 250.0,
          height: 310.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.redAccent),
          //color: Colors.blue,
          //padding: EdgeInsets.only(bottom: 3,left: 3,right: 3,top: 3),
          child:
          Card1("https://i.ibb.co/WWsmN8c/Omelet-de-Tomate-y-Ajo.png"),

        ),
        SizedBox(width: 5,),
        Container(
          width: 250.0,
          height: 310.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.redAccent),
          //color: Colors.green,
          //padding: EdgeInsets.only(bottom: 3,left: 3,right: 3,top: 3),
          child: Card1("https://i.ibb.co/HC8MbGb/Ensalada-de-Elote-con-Chiles-Verdes.png"),
        ),
        SizedBox(width: 5,),
        /*Container(
              padding: EdgeInsets.only(bottom: 5,top: 5,right: 5,left: 5),
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: DecorationImage(
                  image: NetworkImage('https://i.ibb.co/WHJQSXH/prueba-Flutter.jpg'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.black,
                  width: 310,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(width: 5,),
             */

      ],
    );
  }
}
