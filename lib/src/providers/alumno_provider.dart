import 'dart:convert';

import 'package:http/http.dart' as http;

class AlumnoProvider {
  final String _url = 'http://10.0.2.2:5000';

  Future<dynamic> iniciarSesion(String matricula, String password) async {

    print('Matricula => $matricula');
    print('Password => $password');

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
    print(decodedResp);

    if (decodedResp.containsKey('token')) {
      // _prefs.token = decodedResp['idToken'];

      return {'ok' : true, 'token' : decodedResp['token']};
    } else {
      return {'ok' : false, 'message' : decodedResp['msg']};
    }
  }
}