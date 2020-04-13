import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ut_app/src/models/calificaciones_model.dart';

class CalificacionesProvider {
  final String _url = 'http://192.168.51.105:5000';

  Future<List<CalificacionModel>> cargarCalificaciones(int id_alumno, int id_periodo) async {
    final url = '$_url/alumno/$id_alumno/$id_periodo';

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'}
    );

    final Map<String, dynamic> decodeData = json.decode(response.body);

    final List<CalificacionModel> calificaciones = (decodeData['calificaciones'] as List)
      .map((calificacion) => CalificacionModel.fromJson(calificacion))
      .toList();
      
    return calificaciones;
  }
}