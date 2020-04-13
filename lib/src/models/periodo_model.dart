import 'dart:convert';

PeriodoModel periodoModelFromJson(String str) => PeriodoModel.fromJson(json.decode(str));

String periodoModelToJson(PeriodoModel data) => json.encode(data.toJson());

class PeriodoModel {
  int idPeriodo;
  String fechaInicio;
  String fechaFin;
  int cuatrimestre;

  PeriodoModel({
    this.idPeriodo,
    this.fechaInicio,
    this.fechaFin,
    this.cuatrimestre
  });

  factory PeriodoModel.fromJson(Map<String, dynamic> json) => PeriodoModel(
        idPeriodo: json["id_periodo"],
        fechaInicio: json["fecha_inicio"],
        fechaFin: json["fecha_fin"],
        cuatrimestre: json["cuatrimestre"],
      );

  Map<String, dynamic> toJson() => {
        "id_periodo": idPeriodo,
        "fecha_inicio": fechaInicio,
        "fecha_fin": fechaFin,
        "cuatrimestre": cuatrimestre,
      };
}
