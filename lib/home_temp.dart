import 'package:flutter/material.dart';
import 'package:seminario_1/providers/menu_providers.dart';
import 'package:seminario_1/utils/icono_string.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Componentes')), body: _lista());
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      //Argumento opcional, y será la información que tendrá por defecto mientras
      //no se haya resuelto la promesa
      // initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        print('builder');
        print(snapshot.data);
        //Crearemos el ListView
        return ListView(
          children: _listaItems(snapshot.data!, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opciones
        ..add(widgetTemp)
        ..add(Divider());
    });
    return opciones;
  }
}
