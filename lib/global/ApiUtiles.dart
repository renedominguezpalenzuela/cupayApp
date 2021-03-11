import 'package:cupay/global/Globales.dart';
import 'package:http/http.dart';
import 'dart:convert';

class ApiUtiles {
  Future<Map> loguinUser() async {
    String url = Globales.urlLoguin;

    //   Map<String,String> headers = {'Content-Type':'application/json','authorization':'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='};
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final msg = jsonEncode(
        {'username': 'juan', 'password': 'Abc123*', 'hardware_id': 'ASDFGH'});

    var response = await post(Uri.encodeFull(url), body: msg, headers: headers);

    //print(response.body);

    Map<String, dynamic> respuesta = jsonDecode(response.body);

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
    final msg = jsonEncode({"activationCode": "442454"});

    var response = await post(Uri.encodeFull(url), body: msg, headers: headers);
    print(response.body);
    //print(response.statusCode);

    //print(response.body);

    Map<String, dynamic> respuesta = jsonDecode(response.body);

    //  String token = respuesta['token'];
    //print(token);

    return respuesta;
  }
}
