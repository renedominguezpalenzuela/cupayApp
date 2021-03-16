import 'package:cupay/global/Globales.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';

class ApiUtiles {
  //ApiUtiles(){

  //};

  /*
  llamadas: crear un metodo async y dentro realizar la llamada con await
  test('Verify Email', () async {
    ApiUtiles api = ApiUtiles();
    // ignore: non_constant_identifier_names
    Map respuesta_loguin = await api.loguinUser();
    String token = respuesta_loguin['token'];

    Map resultado = await api.verifyEmail(token);
    
    expect(resultado['cod_resp'], "000");
  });
  
   */

  //----------------------------------------------------------------------------
  // La respuesta debe ser un map con el resultado de la peticion
  //----------------------------------------------------------------------------
  //Llamada
  //Map respuesta = await loguinUser();
  //String token = respuesta['token'];
  //String cod_respuesta = respuesta['cod_resp']
  Future<Map> loguinUser(
      String userName, String passWord, String hardWareId) async {
    String url = Globales.urlLoguin;

    Map respuesta = new Map();

    //   Map<String,String> headers = {'Content-Type':'application/json','authorization':'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='};
    Map<String, String> headers = {'Content-Type': 'application/json'};
    //{'username': 'juan', 'password': 'Abc123*', 'hardware_id': 'ASDFGH'}

    Map data = new Map();
    data['username'] = userName;
    data['password'] = passWord;
    data['hardware_id'] = hardWareId;
    final msg = json.encode(data);

    //print(msg);
    try {
      var response =
          await post(Uri.encodeFull(url), body: msg, headers: headers);
      Map<String, dynamic> respuestaApi = jsonDecode(response.body);

      respuesta['cod_resp'] = respuestaApi['cod_resp'];
      respuesta['token'] = respuestaApi['token'];
      respuesta['detalle'] = respuestaApi['detalle'];
      //print(respuestaApi);
    } catch (e) {
      respuesta['cod_resp'] = '900';
      respuesta['token'] = '';
      respuesta['detalle'] = 'Error de conexion';
    }

    return respuesta;
  }

  Future<Map> verifyEmail(String token) async {
    String url = Globales.urlVerifyEmail;

    //   Map<String,String> headers = {'Content-Type':'application/json','authorization':'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='};

    //String autorization = 'Bearer '+token;
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token
    };
    //final msg = jsonEncode({'username': 'juan', 'password': 'Abc123*', 'hardware_id': 'ASDFGH'});
    final msg = jsonEncode({"activationCode": "242917"});

    var response = await post(Uri.encodeFull(url), body: msg, headers: headers);
    // print(response.body);
    //print(response.statusCode);

    //print(response.body);

    Map<String, dynamic> respuesta = jsonDecode(response.body);

    //  String token = respuesta['token'];
    //print(token);

    return respuesta;
  }
}
