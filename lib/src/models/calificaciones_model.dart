import 'dart:convert';

CalificacionModel calificacionModelFromJson(String str) => CalificacionModel.fromJson(json.decode(str));

String calificacionModelToJson(CalificacionModel data) => json.encode(data.toJson());

class CalificacionModel {
  String materia;
  int primero;
  int segundo;
  int tercero;

  CalificacionModel({
    this.materia,
    this.primero,
    this.segundo,
    this.tercero,
  });

  double get promedio => (this.primero + this.segundo + this.tercero) / 3;

  factory CalificacionModel.fromJson(Map<String, dynamic> json) =>
    CalificacionModel(
      materia: json["materia"],
      primero: json["primero"],
      segundo: json["segundo"],
      tercero: json["tercero"],
    );

  Map<String, dynamic> toJson() => {
    "materia": materia,
    "primero": primero,
    "segundo": segundo,
    "tercero": tercero,
  };
}
