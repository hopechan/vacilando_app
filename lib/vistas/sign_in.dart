import 'package:flutter/material.dart';

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
        appBar: new AppBar(
          title: new Text("Raised Button"),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: signIn(),
                    child: new Text("Google"),
                  ),
                  new RaisedButton(
                    onPressed: signIn(),
                    textColor: Colors.white,
                    color: Colors.red,
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      "Facebook",
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}