import 'package:flutter/material.dart';
import 'package:ut_app/src/widgets/boton_matricula.dart';
import 'package:ut_app/src/widgets/header_delegate.dart';

class HomePage extends StatelessWidget {
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

  final items = [
    _ListItem( 'assets/image/carreras.jpeg', 'Ingresa para ver las convocatorias recientes', 'convocatorias' ),
    _ListItem( 'assets/image/notificaciones.png', 'Ingresa para ver tus notificaciones', 'notificaciones' ),
    _ListItem( 'assets/image/calificaciones.png', 'Ingresa para ver tus calificaciones', 'calificaciones' ),
  ];

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
            ...items,
            SizedBox(height: 100)
          ])
        )
      ],
    );
  }
}

class _ListItem extends StatelessWidget {

  final String image;
  final String titulo;
  final String route;

  const _ListItem(this.image, this.titulo, this.route );


  @override
  Widget build(BuildContext context) {
    final card = Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Image.asset(image),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0)
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(titulo, style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
            ),
            child: Text('Ingresar'),
            textColor: Colors.white,
            color: Theme.of(context).primaryColor,
            onPressed: () => Navigator.pushNamed(context, route)
          )
        ],
      )
    );

    return Container(
      margin: EdgeInsets.all(20.0),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(20.0),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
    );
  }
}
