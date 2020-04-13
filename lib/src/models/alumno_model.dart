import 'package:flutter/material.dart';

class AlumnoModel with ChangeNotifier {
  int _idAlumno;
  String _matricula;
  String _grupo;
  String _estado;
  int _periodo;

  String get matricula => this._matricula;
  set matricula(String valor) {
    this._matricula = valor;
  }

  int get idAlumno => this._idAlumno;
  set idAlumno(int valor) {
    this._idAlumno = valor;
  }

  String get grupo => this._grupo;
  set grupo(String valor) {
    this._grupo = valor;
  }

  String get estado => this._estado;
  set estado(String valor) {
    this._estado = valor;
  }

  int get periodo => this._periodo;
  set periodo(int valor) {
    this._periodo = valor;
    notifyListeners();
  }
}
