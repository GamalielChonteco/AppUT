import 'dart:convert';

CalificacionModel calificacionModelFromJson(String str) => CalificacionModel.fromJson(json.decode(str));

String calificacionModelToJson(CalificacionModel data) => json.encode(data.toJson());

class CalificacionModel {
  String materia;
  double primero;
  double segundo;
  double tercero;

  CalificacionModel({
    this.materia,
    this.primero,
    this.segundo,
    this.tercero,
  });

  double get promedio {
    if (this.primero == null || this.segundo == null || this.tercero == null) return 0;
    return (this.primero + this.segundo + this.tercero) / 3;
  }

  factory CalificacionModel.fromJson(Map<String, dynamic> json) =>
    CalificacionModel(
      materia: json["materia"],
      primero: (json["primero"] == null) ? json["primero"] : json["primero"] / 1 ,
      segundo: (json["segundo"] == null) ? json["segundo"] : json["segundo"] / 1 ,
      tercero: (json["tercero"] == null) ? json["tercero"] : json["tercero"] / 1 ,
    );

  Map<String, dynamic> toJson() => {
    "materia": materia,
    "primero": primero,
    "segundo": segundo,
    "tercero": tercero,
  };
}
