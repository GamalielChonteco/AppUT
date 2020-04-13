import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ut_app/src/models/alumno_model.dart';

import 'package:ut_app/src/models/login_model.dart';
import 'package:ut_app/src/providers/alumno_provider.dart';
import 'package:ut_app/src/utils/utils.dart' as util;

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _BackgoundLogin(),
          _LoginForm()
        ],
      )
    );
  }
}

class _BackgoundLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.35,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff032B2E),
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(100))
      ),
      child: Center(
        child: Image.asset('assets/image/logo.png', width: 100.0)
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 200.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow> [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                _InputMatricula(),
                SizedBox(height: 60.0,),
                _InputPassword(),
                SizedBox(height: 60.0,),
                _ButtonIngresar()
              ],
            )
          )
        ],
      ),
    );
  }
}

class _InputMatricula extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final model = Provider.of<LoginModel>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        textCapitalization: TextCapitalization.characters,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          icon: Icon(Icons.supervised_user_circle),
          hintText: 'Matricula',
          labelText: 'Matricula',
        ),
        onChanged: (value) => model.matricula = value
      ),
    );
  }
}

class _InputPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final model = Provider.of<LoginModel>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          icon: Icon(Icons.lock_outline),
          labelText: 'Contraseña',
        ),
        onChanged: (value) => model.password = value,
      ),
    );
  }
}

class _ButtonIngresar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final model = Provider.of<LoginModel>(context);

    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child: Text('Ingresar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      elevation: 0.0,
      color: Color(0xff032B2E),
      textColor: Colors.white,
      onPressed: () => _login(context, model),
    );
  }

  _login(BuildContext context, LoginModel model) async {
    // print('Matricula => ${model.matricula}');
    // print('Password => ${model.password}');

    final alumnoProvider = AlumnoProvider();
    final info = await alumnoProvider.iniciarSesion(model.matricula, model.password);
    
    if (info['ok']) {
      final alumnoModel = Provider.of<AlumnoModel>(context, listen: false);
      alumnoModel.matricula = info['token']['matricula'];
      alumnoModel.idAlumno = info['token']['id_alumno'];
      alumnoModel.grupo = info['token']['grupo'];
      alumnoModel.estado = info['token']['estado'];
      alumnoModel.cuatrimestre = info['token']['cuatrimestre'];

      Navigator.pushReplacementNamed(context, 'home');
    } else {
      util.mostrarAlerta(context, info['message']);
    }
  }
}
