import 'package:cupay/providers/UserDatos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoguinScreen extends StatefulWidget {
  LoguinScreen({Key key}) : super(key: key);

  @override
  _LoguinScreenState createState() => _LoguinScreenState();
}

class _LoguinScreenState extends State<LoguinScreen> {
  String nombreUsuario;
  String passUsuario;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //Clase global de datos
    final usuario = Provider.of<UserDatos>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible( //------------ Area superior Texto: Welcome ----------------
              flex: 3,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: FractionalOffset(0.2, 0.5),
                  child: Text('Welcome',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          //letterSpacing: 0,
                          fontFamily: 'Roboto')),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/top_background.png"),
                        fit: BoxFit.fill)),
              )),
          Flexible( // ------------- Formulario ----------------------------------
              flex: 6,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.7,
                // color: Colors.teal,
                child: SingleChildScrollView(//-al entrar en un TextFormField salian las rallitas verdes y negras
                  child: Form(
                    key: formKey,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container( //--------------Entrar el nombre ------------------------
                          margin: EdgeInsets.only(top: 50, bottom: 20),
                          child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Enter your Name',
                                labelStyle: TextStyle( fontWeight: FontWeight.bold),
                                prefixIcon: Icon(Icons.person),
                              ),
                              onSaved: (value) {
                                nombreUsuario = value;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "User name can't be empty";
                                } else {
                                  return '';
                                }
                              }),
                        ),
                        Container( //--------------Entrar el password ------------------------
                          margin: EdgeInsets.only(top: 10),
                          child: TextFormField(
                              decoration: InputDecoration(
                                
                                  labelStyle: TextStyle( fontWeight: FontWeight.bold),
                                  labelText: 'Enter your password',
                                
                                  prefixIcon: Icon(Icons.vpn_key)),
                              onSaved: (value) {
                                passUsuario = value;
                              }),
                        ),
                        Container( //--------------Boton ------------------------
                          height: 40,
                          margin: EdgeInsets.only(top: 80),
                          child: FractionallySizedBox(
                            widthFactor: 0.8,
                            child: MaterialButton(
                                color: Color.fromARGB(255, 17,228, 45), 
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red)),
                                child: Text('Sign In',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white)),
                                onPressed: () {
                                  _showSecondPage(context);
                                }),
                          ),
                        ),
                        
                      ],
                    ), //Column
                  ),
                ),
              )),
              Flexible(
                flex: 1,
                child: Container(
                          
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  TextButton(
                                  child: Text('Forgot Password?'),
                                  style: TextButton.styleFrom(primary: Colors.black45),
                                  onPressed: () {
                                    print('Pressed');
                                  }),
                                  TextButton(
                                  child: Text('Sign Up'),
                                  style: TextButton.styleFrom(primary: Colors.black45),
                                  onPressed: () {
                                    print('Pressed');
                                  })
                            ])),
              )
        ],
      ),
    );
  }

  //Metodo que llama la segunda pagina
  void _showSecondPage(BuildContext context) {
    if (formKey.currentState.validate()) {
      formKey.currentState
          .save(); //al salvar se ejecutan todos los metodos onSave?
      //se le pasa a arguments: una instancia de la clase que contiene los parametros para la otra ventana

    }
  }
}
