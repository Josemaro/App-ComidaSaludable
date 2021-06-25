import 'package:flutter/cupertino.dart';
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
        backgroundColor: Colors.amberAccent,
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
                              text: "Tab 2"
                          ),
                        ],
                      ),
                    ]),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                Container(
                  padding: EdgeInsets.only(top:10,left: 30,right: 30),
                  child:ListView(
                    children: [
                      Text(platillo.nombre,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      Container(
                        padding: EdgeInsets.only(left: 20,top: 10),
                        child: Container(
                          height: 35,
                          width: 140,
                          color: Colors.white30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Column(

                                children: [
                                  Text('Calorias',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text(platillo.calorias),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(
                                children: [
                                  Text('Carbohidratos',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text(platillo.carbohidratos),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(
                                children: [
                                  Text('Fibra D',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text(platillo.fibraD),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(
                                children: [
                                  Text('Proteinas',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text(platillo.proteinas),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20,top: 10),
                        child: Container(
                          height: 35,
                          width: 140,
                          color: Colors.white30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Column(

                                children: [
                                  Text('GrasaTotal',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text(platillo.grasaTotal),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(
                                children: [
                                  Text('GrasaSaturada',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text(platillo.grasaSaturada),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(
                                children: [
                                  Text('GrasaTrans',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text(platillo.grasaTrans),
                                ],
                              ),

                              SizedBox(width: 10,),
                              Column(
                                children: [
                                  Text('Colesterol',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text(platillo.colesterol),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(
                                children: [
                                  Text('Sodio',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text(platillo.sodio),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text('\nTiempo de Preparación',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      SizedBox(height: 20,),
                      Container(
                        color: Colors.white30,
                        width: 140,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(platillo.tiempoP+' minutos',style: TextStyle(fontSize: 25)),
                            Icon(Icons.timer)
                          ],
                        ) ,
                      ),
                      Text('\nIngredientes',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Container(
                          padding: EdgeInsets.only(left: 20,top: 10),
                          child: Column(
                            children: [
                              Text(platillo.ingredientes,style: TextStyle(fontSize: 15))
                            ],)
                      ),
                    ],
                  ),

                ),

                Container(
                  child: Container(
                    padding: EdgeInsets.all(14.0),
                    height: 35,
                    color: Colors.white30,
                    child: Text("PREPARACIÓN\n\n"+platillo.preparacion,style: TextStyle(fontSize: 25)),
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
