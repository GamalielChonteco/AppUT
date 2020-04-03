import 'dart:convert';

AlumnoModel alumnoModelFromJson(String str) => AlumnoModel.fromJson(json.decode(str));

String alumnoModelToJson(AlumnoModel data) => json.encode(data.toJson());

class AlumnoModel {
    int idAlumno;
    String matricula;
    String estado;
    int idCarrera;

    AlumnoModel({
        this.idAlumno,
        this.matricula,
        this.estado,
        this.idCarrera,
    });

    factory AlumnoModel.fromJson(Map<String, dynamic> json) => AlumnoModel(
        idAlumno: json["id_alumno"],
        matricula: json["matricula"],
        estado: json["estado"],
        idCarrera: json["id_carrera"],
    );

    Map<String, dynamic> toJson() => {
        "id_alumno": idAlumno,
        "matricula": matricula,
        "estado": estado,
        "id_carrera": idCarrera,
    };
}
