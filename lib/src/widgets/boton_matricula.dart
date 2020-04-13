import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ut_app/src/models/alumno_model.dart';

class BottomMatricula extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final alumno = Provider.of<AlumnoModel>(context);

    return ButtonTheme(
      minWidth: size.width,
      height: 65.0,
      child: RaisedButton(
        onPressed: (){},
        color: Theme.of(context).primaryColor,
        child: Row(
          children: <Widget>[
            Text(
              alumno.matricula.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2
              ),
            ),
            SizedBox(width: 30.0),
            IconButton(
              splashColor: Colors.white,
              color: Colors.white,
              icon: Icon(Icons.perm_identity),
              onPressed: () => Navigator.pushNamed(context, 'perfil'),
            )
          ],
        ),
      ),
    );
  }
}