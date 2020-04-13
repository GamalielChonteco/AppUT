import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ut_app/src/models/calificaciones_model.dart';

class CalificacionesProvider {
  final String _url = 'http://192.168.51.105:5000';

  Future<List<CalificacionModel>> cargarCalificaciones(int idAlumno, int cuatrimestre) async {
    var url = '$_url/alumno/';

    (cuatrimestre == 6 || cuatrimestre == 11) ? url += 'estadia/$idAlumno/$cuatrimestre' : url += '$idAlumno/$cuatrimestre';

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