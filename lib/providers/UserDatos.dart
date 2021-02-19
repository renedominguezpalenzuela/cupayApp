import 'package:flutter/material.dart';

class UserDatos  with ChangeNotifier {
  String _nombreUsuario = 'usuario 1';
  String _passUsuario = 'password 1';

  get getNombre {
    return _nombreUsuario;
  }

  set setNombre(String nombre) {
    _nombreUsuario = nombre;
  }

    get getPass {
    return _passUsuario;
  }

  set setPass(String pass) {
    _passUsuario = pass;
  }

}
