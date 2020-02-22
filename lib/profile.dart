import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/home/welcomepage.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(PROFILE_TITLE),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 150,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      PROFILE_PICTURE,
                    ),
                    minRadius: 40,
                    maxRadius: 80,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  PROFILE_NAME,
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(PROFILE_EMAIL),
                SizedBox(
                  height: 2,
                ),
                ListTile(
                  title: Text(PROFILE_CART),
                  leading: Icon(Icons.shopping_cart),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(PROFILE_WISHES),
                  leading: Icon(Icons.favorite),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(PROFILE_HISTORY),
                  leading: Icon(Icons.store),
                  onTap: () {//Navigator.push(
                       // context, MaterialPageRoute(builder: (context) => WelcomePage()));
                       },
                ),
                ListTile(
                  title: Text(PROFILE_SETTINGS),
                  leading: Icon(Icons.settings),
                  onTap: () {
                    //Navigator.push(
                       // context, MaterialPageRoute(builder: (context) => WelcomePage()));
                        },
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Color(0xffbcb0a1),
                      child: Text(PROFILE_LOGOUT),
                      onPressed: () {Navigator.push(
                        context, MaterialPageRoute(builder: (context) => WelcomePage()));},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
