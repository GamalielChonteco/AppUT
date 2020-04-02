import 'package:flutter/material.dart';

class BottomMatricula extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ButtonTheme(
      minWidth: size.width,
      height: 65.0,
      child: RaisedButton(
        onPressed: (){},
        color: Theme.of(context).primaryColor,
        child: Row(
          children: <Widget>[
            Text(
              'UTTI162020',
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