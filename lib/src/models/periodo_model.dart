import 'dart:convert';

PeriodoModel periodoModelFromJson(String str) => PeriodoModel.fromJson(json.decode(str));

String periodoModelToJson(PeriodoModel data) => json.encode(data.toJson());

class PeriodoModel {
  int idPeriodo;
  String fechaInicio;
  String fechaFin;

  PeriodoModel({
    this.idPeriodo,
    this.fechaInicio,
    this.fechaFin,
  });

  factory PeriodoModel.fromJson(Map<String, dynamic> json) => PeriodoModel(
        idPeriodo: json["id_periodo"],
        fechaInicio: json["fecha_inicio"],
        fechaFin: json["fecha_fin"],
      );

  Map<String, dynamic> toJson() => {
        "id_periodo": idPeriodo,
        "fecha_inicio": fechaInicio,
        "fecha_fin": fechaFin,
      };
}
