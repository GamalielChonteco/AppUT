import 'package:flutter/material.dart';
import 'package:ut_app/src/widgets/boton_matricula.dart';
import 'package:ut_app/src/widgets/header_delegate.dart';

class PerfilPage extends StatelessWidget {
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
            Column(
              children: <Widget>[
                SizedBox(height: 30.0),
                Center(
                  child: Container(
                    width: 300.0,
                    height: 300.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor.withOpacity(0.3),
                            shape: BoxShape.circle
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 250.0,
                            height: 250.0,
                            child: ClipOval(
                              child: Image.asset('assets/image/ut-10.jpg'),
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Column(
                  children: <Widget>[
                    Text(
                      'Erick Nuñez Sarmiento',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Alumno',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'TI-1102',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    _ButtonCerrar()
                  ],
                )
              ],
            )
          ])
        )
      ],
    );
  }
}

class _ButtonCerrar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child: Text('Cerrar Sesión', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      elevation: 0.0,
      color: Colors.red,
      textColor: Colors.white,
      onPressed: () {},
    );
  }
}
