import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
String dato;
class Home extends StatefulWidget {
  HomeState  createState()=> HomeState();
  Home(String valor){
    dato = valor;
  }
}

class HomeState extends State<Home> {
  void _alerta(String value){
    AlertDialog dialog = new AlertDialog(
      title: new Text("Ha presionado $value"),
      actions: <Widget>[
        new FlatButton(
          child: new Text("OK"),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ],
    );
    mostrarDialogo(context: context, child: dialog);
  }
  void mostrarDialogo<T>({BuildContext context, Widget child}){
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value){
    });
  }

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(FontAwesomeIcons.bus)),
                Tab(icon: Icon(FontAwesomeIcons.taxi)),
                Tab(icon: Icon(FontAwesomeIcons.walking))
              ],
            ),
            title: Text("Ejemplo $dato"),
          ),
          body: TabBarView(
            children: <Widget>[
              IconButton(onPressed: (){
                _alerta("Carro");
              },
              icon: Icon(FontAwesomeIcons.bus)),
              Icon(FontAwesomeIcons.taxi),
              Icon(FontAwesomeIcons.walking)
            ],
          ),
        )
      )
    );
  }
}
