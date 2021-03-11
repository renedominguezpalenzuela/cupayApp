import 'package:cupay/providers/UserDatos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steps_indicator/steps_indicator.dart';

//TODO: Back Button cierra la aplicacion
//TODO:
// 01 - User Name, Email, pass
// 02 - PIN, lets define a security code Boton: Continuar
// 03 - Datos personales(opcional), avatar, nombre completo, ID, Telefono, etc. Boton: Continuar
// 04 - Verify your mail  Boton: Continuar
// 05 - Write Down the mnemonics code(opcional). Boton: Continuar
// 06 - Review: Create Account

class Register01Screen extends StatefulWidget {
  Register01Screen({Key key}) : super(key: key);

  @override
  _Register01ScreenState createState() => _Register01ScreenState();
}

class _Register01ScreenState extends State<Register01Screen> {
  String nombreUsuario;
  String emailUsuario;
  String passUsuario;
  // Initially password is obscure
  bool _passwordVisible1;
  bool _passwordVisible2;

  @override
  void initState() {
    super.initState();

    _passwordVisible1 = false;
    _passwordVisible2 = false;
  }

  //Formulario
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //Clase global de datos
    // ignore: unused_local_variable
    final usuario = Provider.of<UserDatos>(context);
    final color = 0xFF00C0FF;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
              //------------ Area superior Texto: Welcome ----------------
              flex: 2,
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Create Account',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                //letterSpacing: 0,
                                fontFamily: 'Roboto')),
                      ),
                      Text('Cupay App, The new standard in online payments',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              //letterSpacing: 0,
                              fontFamily: 'Roboto')),
                      Padding(
                        padding: const EdgeInsets.only(top: 28),
                        child: StepsIndicator(
                            selectedStep: 0,
                            nbSteps: 4,
                            selectedStepColorOut: Color(
                                color), //color de borde del paso seleccionado
                            selectedStepColorIn: Colors
                                .white, //color de relleno del paso seleccionado
                            doneStepColor:
                                Colors.green, //color de los pasos ya hechos
                            unselectedStepColorOut: Color(
                                color), //adb9e3//color de borde de pasos no hechos
                            unselectedStepColorIn: Color(
                                color), //color de relleno de pasos no hechos
                            doneLineColor:
                                Color(color), //Color de la linea no hecha
                            undoneLineColor:
                                Color(color) //color de linea no hecha
                            ),
                      ),
                    ],
                  ))),
          Flexible(
              // ------------- Formulario ----------------------------------
              flex: 5,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.7,
                  // color: Colors.teal,
                  child: Form(
                    key: formKey,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          //--------------Entrar el nombre ------------------------
                          margin: EdgeInsets.only(top: 30, bottom: 5),
                          child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'User name',
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
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
                        Container(
                          //--------------Entrar el Correo ------------------------
                          margin: EdgeInsets.only(top: 5),
                          child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email address',
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                                prefixIcon: Icon(Icons.email),
                              ),
                              onSaved: (valor) {
                                nombreUsuario = valor;
                              },
                              validator: (valor) {
                                if (valor.isEmpty) {
                                  return "Email can't be empty";
                                } else {
                                  return '';
                                }
                              }),
                        ),
                        Container(
                          //--------------Entrar el password ------------------------
                          margin: EdgeInsets.only(top: 5),
                          child: TextFormField(
                              obscureText: !_passwordVisible1,
                              decoration: InputDecoration(
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.vpn_key),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible1
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      _passwordVisible1 = !_passwordVisible1;
                                    });
                                  },
                                ),
                              ),
                              onSaved: (value) {
                                passUsuario = value;
                              }),
                        ),
                        Container(
                          //--------------Entrar el password ------------------------
                          margin: EdgeInsets.only(top: 5),
                          child: TextFormField(
                              obscureText: !_passwordVisible2,
                              decoration: InputDecoration(
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                                labelText: 'Retype Password',
                                prefixIcon: Icon(Icons.vpn_key),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible2
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      _passwordVisible2 = !_passwordVisible2;
                                    });
                                  },
                                ),

                                //  Icon(Icons.remove_red_eye_outlined)
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
                                child: Text('Continue',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
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
          /*Flexible(
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
          )*/
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
