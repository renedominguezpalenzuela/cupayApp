import 'package:cupay/global/ApiUtiles.dart';
import 'package:cupay/global/Globales.dart';
import 'package:cupay/providers/UserDatos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//TODO: deshabilitar el boton al hacer clic en el hasta que se reciba la respuesta
//TODO: poner indicador de progreso en el boton hasta que se reciba la respuesta
//TODO: si error poner resultado en mensaje de texto

//TODO: boton del teclado, continuar, finalizar etc...
//TODO: ojito del password field

class LoguinScreen extends StatefulWidget {
  LoguinScreen({Key key}) : super(key: key);

  @override
  _LoguinScreenState createState() => _LoguinScreenState();
}

class _LoguinScreenState extends State<LoguinScreen> {
  final _scaffKey = GlobalKey<ScaffoldState>();

  String nombreUsuario;
  String passUsuario;

  final formKey = GlobalKey<FormState>();

  bool _passwordVisible;
  int timeOuttime = Globales.timeOutTime;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    //Clase global de datos
    // ignore: unused_local_variable
    //  TODO Asignar a clase los valores de las variables
    final usuario = Provider.of<UserDatos>(context);

    return Scaffold(
      key: _scaffKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
              //------------ Area superior Texto: Welcome ----------------
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
          Flexible(
              // ------------- Formulario ----------------------------------
              flex: 6,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.7,
                // color: Colors.teal,
                child: SingleChildScrollView(
                  //-al entrar en un TextFormField salian las rallitas verdes y negras
                  child: Form(
                    key: formKey,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          //--------------Entrar el nombre ------------------------
                          margin: EdgeInsets.only(top: 50, bottom: 20),
                          child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Enter your Name',
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                                prefixIcon: Icon(Icons.person),
                              ),
                              onSaved: (value) {
                                nombreUsuario = value;
                              },

                              // ignore: missing_return
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "User name can't be empty";
                                }
                                return null;
                              }),
                        ),
                        Container(
                          //--------------Entrar el password ------------------------
                          margin: EdgeInsets.only(top: 10),
                          child: TextFormField(
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                                labelText: 'Enter your password',
                                prefixIcon: Icon(Icons.vpn_key),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      print(_passwordVisible);
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                              ),
                              onSaved: (value) {
                                passUsuario = value;
                              }),
                        ),
                        Container(
                          //--------------Boton ------------------------
                          height: 40,
                          margin: EdgeInsets.only(top: 80),
                          child: FractionallySizedBox(
                            widthFactor: 0.8,
                            child: MaterialButton(
                                color: Color.fromARGB(255, 17, 228, 45),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red)),
                                child: Text('Sign In',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                                onPressed: () {
                                  //_showSecondPage(context);

                                  _loguin(context); //login
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
                        Navigator.pushReplacementNamed(
                          context,
                          '/register01',
                        );
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

  void _mostrarSnckBar(String texto) {
    SnackBar snackbar = SnackBar(content: Text(texto));
    _scaffKey.currentState.showSnackBar(snackbar);
  }

  //Metodo que llama la segunda pagina
  Future<void> _loguin(BuildContext context) async {
    print("loguin inicio");
    if (formKey.currentState.validate()) {
      formKey.currentState
          .save(); //al salvar se ejecutan todos los metodos onSave?
      //se le pasa a arguments: una instancia de la clase que contiene los parametros para la otra ventana

      showDialog(
          //mostrar dialogo
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text("Conecting..."),
                content: SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width / 7,
                  child: Center(child: CircularProgressIndicator()),
                )

                //Center(child: CircularProgressIndicator()),

//                                          child: CircularProgressIndicator(),
                );
          });

      ApiUtiles api = ApiUtiles();
      String hardWareId = "ASDFGH";
      print("nombre " + nombreUsuario);
      print("pass " + passUsuario);
      // ignore: unused_local_variable
      Map respuesta = new Map();

      try {
        respuesta = await api
            .loguinUser(nombreUsuario, passUsuario, hardWareId)
            .timeout(Duration(seconds: timeOuttime));
      } catch (e) {
        respuesta['cod_resp'] = '900';
        respuesta['token'] = '';
        respuesta['detalle'] = 'Error de conexion';
      }
      //print(response.body);;
      String cod_resp = respuesta['cod_resp'];
      String token = respuesta['token'];
      String detalle = respuesta['detalle'];
      print("Respuesta $cod_resp $detalle");
       _mostrarSnckBar("Respuesta " +cod_resp+" "+detalle);

      if (cod_resp == '000') {
        print("Login OK");
      } else {
        print("NO Login");
      }
    } else {
      print("fallo validadion");
    }
    Navigator.pop(context); //cerrar dialog
   
  }
}
