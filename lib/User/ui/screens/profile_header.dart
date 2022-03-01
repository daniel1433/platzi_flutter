import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/ui/widgets/user_info.dart';
import 'package:platzi_trips_app/User/ui/widgets/button_bar.dart';

// ignore: must_be_immutable
class ProfileHeader extends StatelessWidget {
  ProfileHeader({Key? key});
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: userBloc.streamFirebase,
        builder: (_, AsyncSnapshot snapUser) {
          switch (snapUser.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              return _showProfileData(snapUser);
          }
        });
  }

  Widget _showProfileData(AsyncSnapshot snapUser) {
    if (!snapUser.hasData || snapUser.hasError) {
      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(children: [
          CircularProgressIndicator(),
          Text("No se pudo cargar la information, Haz login")
        ]),
      );
    } else {
      final title = Text(
        'Profile',
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      );
      User user = User(
          name: snapUser.data.displayName,
          email: snapUser.data.email,
          photoURL: snapUser.data.photoURL);
      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[title],
            ),
            UserInfo(
              user: user,
            ),
            ButtonsBar()
          ],
        ),
      );
    }
  }
}
