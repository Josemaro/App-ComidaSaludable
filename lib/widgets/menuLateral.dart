import 'package:flutter/material.dart';
import 'package:instructivoflut4/pages/mprincipal.dart';

import 'package:instructivoflut4/pages/platilloList.dart';



class MenuLateral extends StatefulWidget{

  @override
  _MenuLateralState createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(

      child: Container(
        //color: Colors.cyan,
        decoration: new BoxDecoration(
          color: Colors.redAccent,
          /*gradient: new LinearGradient(
            colors: [Colors.green, Colors.cyan],
          ),
          */
        ),
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text("Jose Wong",style: TextStyle(color: Colors.white,fontSize: 25)),
              accountEmail: Text("Tengo Hambre ...",style: TextStyle(color: Colors.white70),),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('https://i.ibb.co/r4d3zB8/Keto-diet-concept-salmon-avocado-eggs-nuts-and-seeds-bright-green-background-top-view.jpg'),
                      fit: BoxFit.cover
                  )
              ),
            ),

            new ListTile(
              title: Text("Recetas", style: TextStyle(color: Colors.white)),
              onTap: (){
                Navigator.push(
                  context,
                  //MaterialPageRoute(builder: (context) => FirstRoute()),
                  MaterialPageRoute(builder: (context) => Platillo_Page()),
                );
              },
            ),
            Divider(),
            new ListTile(
              title: Text("NuevoMenu", style: TextStyle(color: Colors.white)),
              onTap: (){
                Navigator.push(
                  context,
                  //MaterialPageRoute(builder: (context) => FirstRoute()),
                  MaterialPageRoute(builder: (context) => MPrincipal()),
                );
              },
            ),
          ],
        ),
      ),

    );
  }
}