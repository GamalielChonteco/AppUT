import 'package:flutter/material.dart';

import 'package:ut_app/src/widgets/boton_matricula.dart';
import 'package:ut_app/src/widgets/header_delegate.dart';

class ConvocatoriasPage extends StatelessWidget {
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
    _ListItem( 'assets/image/convocatoria-1.jpg'),
    _ListItem( 'assets/image/convocatoria-2.jpg'),
    _ListItem( 'assets/image/convocatoria-3.jpg'),
    _ListItem( 'assets/image/convocatoria-4.jpg'),
    _ListItem( 'assets/image/convocatoria-5.jpg'),
    _ListItem( 'assets/image/convocatoria-6.jpg'),
    _ListItem( 'assets/image/convocatoria-7.jpg'),
    _ListItem( 'assets/image/convocatoria-8.jpg'),
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

  const _ListItem(this.image );


  @override
  Widget build(BuildContext context) {
    final card = Container(
      child: Image.asset(image),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0)
      ),
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
