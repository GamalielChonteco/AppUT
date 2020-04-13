import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ut_app/src/models/periodo_model.dart';

class PeriodoProvider {
  final String _url = 'http://192.168.51.105:5000';

  Future<List<PeriodoModel>> cargarPeriodos() async {
    final url = '$_url/alumno/periodo';

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'}
    );

    final Map<String, dynamic> decodeData = json.decode(response.body);

    final List<PeriodoModel> periodos = (decodeData['periodos'] as List)
      .map((periodo) => PeriodoModel.fromJson(periodo))
      .toList();
      
    return periodos;
  }
}