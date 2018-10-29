import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class SignIn extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return new BotonSignIn();
  }
}

class BotonSignIn extends  State<SignIn>{

  signIn(){}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("images/fondo.jpg"), fit: BoxFit.cover,),
            ),
          ),
          new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new RaisedButton.icon(
                      onPressed: signIn(),
                      textColor: Colors.black,
                      color: Colors.black,
                      icon: new Icon(FontAwesomeIcons.google, color: Colors.redAccent),
                      label: new Text("Entrar con Google     ", 
                        style: new TextStyle(
                          color: Colors.black
                        ),
                      ),
                    ),
                    new RaisedButton.icon(
                      onPressed: signIn(),
                      textColor: Colors.black,
                      color: Colors.black,
                      icon: new Icon(FontAwesomeIcons.facebook, color: Colors.blueAccent,),
                      label: new Text("Entrar con Facebook",
                        style: new TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
