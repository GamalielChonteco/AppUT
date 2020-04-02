import 'package:flutter/material.dart';
import 'package:ut_app/src/widgets/boton_matricula.dart';
import 'package:ut_app/src/widgets/header_delegate.dart';

class NotificacionesPage extends StatelessWidget {
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
            Container(
              alignment: Alignment.center,
              height: 200.0,
              margin: EdgeInsets.all(20.0),
              child: ClipRRect(
                child: Text('Inscrito', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black54),),
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
            )
          ])
        )
      ],
    );
  }
}
