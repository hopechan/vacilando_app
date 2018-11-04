import 'dart:async';
import 'dart:convert' show json;
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vacilando_app/vistas/home.dart';

/*
 *En un futuro no muy lejano van a estar separados 
 *las dos formas de entrar a la aplicacion 
 */

//Sign In para google
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class SignIn extends StatefulWidget {
  @override
  State createState() => SignInState();
}

class SignInState extends State<SignIn> {
  GoogleSignInAccount _currentUser;
  String _contactText;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact();
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleGetContact() async {
    setState(() {
      _contactText = "Loading contact info...";
    });
    final http.Response response = await http.get(
      'https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names',
      headers: await _currentUser.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = "People API gave a ${response.statusCode} "
            "response. Check logs for details.";
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = "I see you know $namedContact!";
      } else {
        _contactText = "No contacts to display.";
      }
    });
  }

  String _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic> connections = data['connections'];
    final Map<String, dynamic> contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic> name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  Future<void> _signInGoogle() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _signOutGoogle() async {
    _googleSignIn.disconnect();
  }

  /*
  *SignIn para Facebook
  */
  _signInFacebook(){

  }


//Widget donde estan los dos metodos signIn
  Widget _buildBody() { 
    if (_currentUser != null) {
      return HomeState().build(context);
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            alignment: new Alignment(0.0 ,2.0),
            child: RaisedButton.icon(
              onPressed: _signInGoogle,
              textColor: Colors.white,
              color: Colors.redAccent,
              icon: new Icon(FontAwesomeIcons.google, color: Colors.white),
              label: new Text(
                " Entrar con Google    ",
                style: new TextStyle(
                color: Colors.white
                )
              ),
            ),
          ),
          new Container(
            alignment: new Alignment(0.0, 2.0),
            child: RaisedButton.icon(
              onPressed: _signInFacebook,
              textColor: Colors.white,
              color: Colors.blueAccent,
              icon: new Icon(FontAwesomeIcons.facebook, color: Colors.white),
              label: new Text(
                "Entrar con Facebook",
                style: new TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children:<Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("images/fondo.jpg"), fit: BoxFit.cover),
            ),
          ),
          _buildBody(),
        ],
      ),
    );
  }
}