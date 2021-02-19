import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(0x00, 0xBB, 0x2E, 1),
        body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 25),
                Image.asset('assets/icono_splash.png', width: 120),
                SizedBox(height: 8),
                Text("CuPay App",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        letterSpacing: 2,
                        fontFamily: 'FugazOne'))
              ],
            )));
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      print("3 segundos");
      Navigator.pushReplacementNamed(context, '/login', arguments: "AXL ROSES");
    });
    super.initState();
  }
}
