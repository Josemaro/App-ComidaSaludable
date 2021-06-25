import 'package:flutter/material.dart';
import 'package:instructivoflut4/models/PlatilloModel.dart';

//void main() => runApp(DetallePlatillo());


class DetallePlatillo extends StatelessWidget {
  Platillo platillo;
  DetallePlatillo(this.platillo);

  var scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.redAccent,
                  expandedHeight: 250.0,
                  floating: true,
                  pinned: true,
                  snap: true,
                  actionsIconTheme: IconThemeData(opacity: 0.0),
                  flexibleSpace: Stack(
                    children: <Widget>[
                      Positioned.fill(
                          child: Image.network(
                            platillo.img,
                          fit: BoxFit.cover,
                          ))
                    ],
                  ),
                ),
                SliverPadding(
                  padding: new EdgeInsets.all(16.0),
                  sliver: new SliverList(
                    delegate: new SliverChildListDelegate([
                      TabBar(
                        labelColor: Colors.white70,
                        unselectedLabelColor: Colors.white30,
                        tabs: [
                          new Tab(icon: new Icon(Icons.info), text: "Tab 1"),
                          new Tab(
                            //icon: new Icon(Icons.lightbulb_outline),
                              icon: new Icon(Icons.fastfood),
                              text: "Tab 2"),
                        ],
                      ),
                    ]),
                  ),
                ),
              ];
            },
            body:Container(
              padding: EdgeInsets.only(top:10,left: 30,right: 30),
              child:ListView(
                children: [
                  Text(platillo.nombre,style: TextStyle(fontSize: 20),),
                  Container(
                    padding: EdgeInsets.only(left: 20,top: 10),
                    child: Text(platillo.calorias+' '+platillo.colesterol),
                  ),
                  Text('\nTiempo de Preparación',style: TextStyle(fontSize: 20),),
                  Container(
                    padding: EdgeInsets.only(left: 20,top: 10),
                    child: Text(platillo.tiempoP+' minutos'),
                  ),
                  Text('\nIngredientes',style: TextStyle(fontSize: 20),),
                  Container(
                      padding: EdgeInsets.only(left: 20,top: 10),
                      child: Column(
                        children: [
                          Text(platillo.ingredientes)
                        ],)
                  ),
                  Text('\nValor Nutricional:',style: TextStyle(fontSize: 20),),
                ],
              ),

            ),
          ),
        ));
  }
}
