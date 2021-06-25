import 'package:flutter/material.dart';
import 'package:instructivoflut4/models/PlatilloModel.dart';
import 'package:instructivoflut4/models/UsuarioModel.dart';
import 'package:instructivoflut4/providers/PlatilloProvider.dart';
import 'package:instructivoflut4/providers/UsuarioProvider.dart';
import 'package:instructivoflut4/widgets/detallePlatillo.dart';
import '../bloc/provider.dart';
import '../models/EmpleadoModel.dart';
import '../models/EmpleadoModel.dart';
import '../providers/EmpleadoProvider.dart';

class Platillo_Page extends StatelessWidget {


  final platilloProvider = new PlatilloProvider();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Lista de Platillos'),
      ),
      body:
      _crearListado(),
      //floatingActionButton: _cargarInterfazUsuario(context),
    );
  }

  _cargarInterfazUsuario(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.redAccent,
      onPressed: () => Navigator.pushNamed(context, ''),
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
        future: platilloProvider.cargarPlatillos(),
        builder: (BuildContext context, AsyncSnapshot<List<Platillo>> snapshot) {
          if (snapshot.hasData) {
            final productos = snapshot.data;

            return ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, i) => _crearItem(context, productos[i]),

            );
          }
          else {
            return Center(child: CircularProgressIndicator());
          }
        }
    );
  }

  Widget _crearItem(BuildContext context, Platillo platillo) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (x) {},
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('${ platillo.nombre }'),
              subtitle: Text(platillo.calorias),
              onTap: () {
                Navigator.push(
                  context,
                  //MaterialPageRoute(builder: (context) => FirstRoute()),
                  MaterialPageRoute(builder: (context) => DetallePlatillo(platillo)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}