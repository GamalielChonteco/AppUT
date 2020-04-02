import 'package:flutter/material.dart';
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
    return Container();
  }
}

class _TablaCalificaciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        rows: [
          DataRow(
            cells: [
              DataCell(Text('Redes')),
              DataCell(Text('8')),
              DataCell(Text('9')),
              DataCell(Text('10')),
              DataCell(Text('9')),
            ]
          ),
          DataRow(
            cells: [
              DataCell(Text('Redes convergentes')),
              DataCell(Text('10')),
              DataCell(Text('8')),
              DataCell(Text('9')),
              DataCell(Text('10')),
            ]
          ),
          DataRow(cells: [
            DataCell(Text('Promedio'), placeholder: true),
            DataCell(Text('8')),
            DataCell(Text('9')),
            DataCell(Text('10')),
            DataCell(Text('9')),
          ])
        ]
      ),
    );
  }
}