import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'circle_button.dart';

// ignore: must_be_immutable
class ButtonsBar extends StatelessWidget {
  ButtonsBar({Key? key});
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            // Cambiar contraseña
            CircleButton(
                mini: true,
                icon: Icons.vpn_key,
                iconSize: 20.0,
                onPressed: () {},
                color: Color.fromRGBO(255, 255, 255, 0.6)),

            // Añadir lugar
            CircleButton(
                mini: false,
                icon: Icons.add,
                iconSize: 40.0,
                onPressed: () {},
                color: Color.fromRGBO(255, 255, 255, 1)),

            // Cerrar sesión
            CircleButton(
                mini: true,
                icon: Icons.exit_to_app,
                iconSize: 20.0,
                onPressed: () => userBloc.signOut(),
                color: Color.fromRGBO(255, 255, 255, 0.6)),
          ],
        ));
  }
}
