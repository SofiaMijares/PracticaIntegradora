import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/home/loginpage.dart';
import 'package:practica_integradora_uno/home/signup.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _registerButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffbcb0a1), Color(0xff8b8175)])
          ),
          child: Text('REGISTRATE',
            style: 
            TextStyle(
              fontSize: 15, 
              color: Colors.black
            ),
          ),
      ),
    );
  }

  Widget _loginButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffbcb0a1), Color(0xff8b8175)])
          ),
          child: Text('INGRESA',
            style: 
            TextStyle(
              fontSize: 15, 
              color: Colors.black
            ),
          ),
      ),
    );
  }


  Widget _title() {
    return 
            Column(
              children: <Widget>[
                Image.asset(
                'assets/images/backgroundicon.png'
                ),
              ],
            );
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff214254), Color(0xff121B22)])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _title(),
                SizedBox(
                  height: 80,
                ),
                _registerButton(),
                SizedBox(
                  height: 20,
                ),
                _loginButton(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
    );
  }
}
