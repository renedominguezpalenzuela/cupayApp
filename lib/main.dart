import 'package:cupay/providers/UserDatos.dart';
import 'package:cupay/screens/registration/Register01.dart';
import 'package:flutter/material.dart';
import 'package:cupay/screens/HomeScreen.dart';
import 'package:cupay/screens/LoginScreen.dart';
import 'package:cupay/screens/SplashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>UserDatos() ),
      ],
      child: MaterialApp(
          title: 'cuPay',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: "/splash",
          //Definir rutas
          routes: {
            "/splash": (BuildContext context) => SplashScreen(),
            "/login": (BuildContext context) => LoguinScreen(),
            "/home": (BuildContext context) { return MyHomePage(); },
            "/register01" :  (BuildContext context) => Register01Screen()
          }),
    );
  }
}
