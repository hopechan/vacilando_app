import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class SignIn extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return new BotonSignIn();
  }
}

class BotonSignIn extends  State<SignIn>{

  signIn(){

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('images/fondo.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FlatButton.icon(
                    onPressed: signIn(),
                    icon: new Icon(FontAwesomeIcons.google),
                    label: new Text("Entrar con Google"),
                  ),
                  new FlatButton.icon(
                    onPressed: signIn(),
                    textColor: Colors.white,
                    color: Colors.red,
                    icon: new Icon(FontAwesomeIcons.facebook),
                    label: new Text("Entrar con Facebook"),
                  ),
                ],
              ),
            ],
          ),
        )
      );
    }
}