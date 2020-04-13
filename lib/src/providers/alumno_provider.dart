import 'dart:convert';

import 'package:http/http.dart' as http;

class AlumnoProvider {
  final String _url = 'http://192.168.51.105:5000';

  Future<dynamic> iniciarSesion(String matricula, String password) async {

    final url = '$_url/authAlumno/';

    final authData = {
      'matricula': matricula,
      'password': password
    };

    final response = await http.post(
      url,
      body: json.encode(authData),
      headers: {'Content-Type': 'application/json'}
    );

    Map<String, dynamic> decodedResp = json.decode(response.body);
    

    if (decodedResp.containsKey('token')) {
      // _prefs.token = decodedResp['idToken'];
      return {'ok' : true, 'token' : decodedResp['alumno'][0]};
    } else {
      return {'ok' : false, 'message' : decodedResp['msg']};
    }
  }
}