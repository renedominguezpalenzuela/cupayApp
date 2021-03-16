import 'package:cupay/global/ApiUtiles.dart';

import 'package:test/test.dart';

import 'dart:convert';

void main() {

   String nombreUsuario = "juan";
    String passUsuario = "Abc123*";
    String hardWareId = "ASDFGH";

  test('Crear usuario', () async {
    ApiUtiles api = ApiUtiles();
   

    Map resultado =
        await api.loguinUser(nombreUsuario, passUsuario, hardWareId);
    expect(resultado['cod_resp'], "000");
  });

  test('Verify Email', () async {
    ApiUtiles api = ApiUtiles();
    // ignore: non_constant_identifier_names
    Map respuesta_loguin = await api.loguinUser(nombreUsuario, passUsuario, hardWareId);
    String token = respuesta_loguin['token'];

    Map resultado = await api.verifyEmail(token);

    expect(resultado['cod_resp'], "000");
  });

  /*test('json1', () {
    String jsonString = '{"name": "John Smith", "email": "john@example.com"}';

    Map<String, dynamic> usuario = jsonDecode(jsonString);

    String nombre = usuario['name'];
    String email = usuario['email'];

    print(nombre + " " + email);

    expect(nombre, "John Smith");
  });

  test('json2', () {
    String jsonString = '{"name": "John Smith", "email": "john@example.com"}';
    final jsonResponse = json.decode(jsonString);
    Student student = Student.fromJson(jsonResponse);
    print(student.nombre);
    expect(student.nombre, "John Smith");
  });

  test('Counter value should be incremented', () {
    //Crear instancia de la clase a probar
    final counter = Counter();
    //Ejecuto la funcion a probar
    counter.increment();
    //valido el resultado de la funcion
    expect(counter.value, 1);

    expect(Globales.url_base, "12345");

    Globales.variable_global = "XXXX";

    expect(Globales.variable_global, "XXXX");

    Globales2 V = Globales2();
    expect(V.variable_global, "ABC");

    V.variable_global = "XXX";

    expect(V.variable_global, "XXX");
  });*/
}
