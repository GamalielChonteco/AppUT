import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ut_app/src/models/alumno_model.dart';
import 'package:ut_app/src/models/calificaciones_model.dart';
import 'package:ut_app/src/models/periodo_model.dart';
import 'package:ut_app/src/providers/calificaciones_provider.dart';
import 'package:ut_app/src/providers/periodo_provider.dart';
import 'package:ut_app/src/widgets/boton_matricula.dart';
import 'package:ut_app/src/widgets/header_delegate.dart';

class CalificacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _MainScroll(),
          Positioned(
            bottom: 0,
            right: 0,
            child: BottomMatricula()
          )
        ],
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          floating: true,
          delegate: SliverCustomHeaderDelegate(
            minheight: 100,
            maxheight: 130,
            child: Container(
              alignment: Alignment.center,
              child: SafeArea(child: Image.asset('assets/image/logo.png', width: 50.0,)),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0)
                )
              ),
            )
          )
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            _CambiarParcial(),
            _TablaCalificaciones(),
            SizedBox(height: 100)
          ])
        )
      ],
    );
  }
}

class _CambiarParcial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final periodoProvider = PeriodoProvider();
    final alumnoModel = Provider.of<AlumnoModel>(context);

    return FutureBuilder(
      future: periodoProvider.cargarPeriodos(),
      builder: (BuildContext context, AsyncSnapshot<List<PeriodoModel>> snapshot) {
        if (snapshot.hasData) {
          final periodos = snapshot.data;
          if (periodos.length == 0) return Center(child: Text('Sin periodos', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black45)));

          return Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
              child: DropdownButton(
                value: alumnoModel.periodo,
                onChanged: (value) => alumnoModel.periodo = value,
                items: periodos
                    .map((periodo) {
                      final fechaInicio = DateTime.parse(periodo.fechaInicio);
                      final fechaFin = DateTime.parse(periodo.fechaFin);
                      return DropdownMenuItem(
                        value: periodo.idPeriodo,
                        child: Text('${DateFormat('MMMM', 'es_ES').format(fechaInicio)} - ${DateFormat('MMMM', 'es_ES').format(fechaFin)} ${DateFormat('yy').format(fechaFin)}'),
                      );
                    })
                    .toList(),
              ),
            ),
          );

        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _TablaCalificaciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final alumnoModel = Provider.of<AlumnoModel>(context);
    final calificacionProvider = CalificacionesProvider();
    
    return FutureBuilder(
      future: calificacionProvider.cargarCalificaciones(alumnoModel.idAlumno, alumnoModel.periodo),
      builder: (BuildContext context, AsyncSnapshot<List<CalificacionModel>> snapshot) {
        if (snapshot.hasData) {
          final calificacion = snapshot.data;
          if (calificacion.length== 0) return Center(child: Text('Sin calificaciones', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black45)));

          return Container(
            margin: EdgeInsets.all(10.0),
            child: DataTable(
              columnSpacing: 10.0,
              columns: [
                DataColumn(label: Text('Materia')),
                DataColumn(label: Text('P-1')),
                DataColumn(label: Text('P-2')),
                DataColumn(label: Text('P-3')),
                DataColumn(label: Text('Promedio'), numeric: true)
              ],
              rows: List.generate(calificacion.length, (index) => dataRow(calificacion[index]))
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  DataRow dataRow(CalificacionModel calificacion) {
    return DataRow(
      cells: [
        DataCell(Text(calificacion.materia)),
        DataCell(Text('${calificacion.primero}')),
        DataCell(Text('${calificacion.segundo}')),
        DataCell(Text('${calificacion.tercero}')),
        DataCell(Text('${calificacion.promedio.toStringAsFixed(1)}')),
      ]
    );
  }
}
