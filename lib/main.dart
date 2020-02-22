import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/home/home.dart';
import 'package:practica_integradora_uno/home/welcomepage.dart';
import 'package:practica_integradora_uno/utils/constants.dart';
import 'package:practica_integradora_uno/home/welcomepage.dart';

void main() => runApp(MyApp());

Map<int, Color> color =
{
50:Color.fromRGBO(136,14,79, .1),
100:Color.fromRGBO(136,14,79, .2),
200:Color.fromRGBO(136,14,79, .3),
300:Color.fromRGBO(136,14,79, .4),
400:Color.fromRGBO(136,14,79, .5),
500:Color.fromRGBO(136,14,79, .6),
600:Color.fromRGBO(136,14,79, .7),
700:Color.fromRGBO(136,14,79, .8),
800:Color.fromRGBO(136,14,79, .9),
900:Color.fromRGBO(136,14,79, 1),
};


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    MaterialColor colorCustom = MaterialColor(0xFF214254, color);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         primarySwatch: colorCustom,
         fontFamily: 'Akzidenz Grotesk Medium',
         /*textTheme:GoogleFonts.latoTextTheme(textTheme).copyWith(
           body1: GoogleFonts.montserrat(textStyle: textTheme.body1),
         ),*/
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}


/*import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/home/home.dart';
//import 'package:practica_integradora_uno/home/welcomepage.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Home(title: APP_TITLE),
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcomepage',
      onGenerateRoute: _getRoute,
    );
  }
  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/welcomepage') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => WelcomePage(),
      fullscreenDialog: true,
    );
  }
}*/
