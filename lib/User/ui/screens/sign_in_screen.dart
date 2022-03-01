import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/platzi_trips_cupertino.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc.autStatus,
      builder: (_, AsyncSnapshot<User?> snapUser) {
        if (!snapUser.hasData || snapUser.hasError) {
          return _signInGoogleUI();
        } else {
          return PlatziTripsCupertino();
        }
      },
    );
  }

  Widget _signInGoogleUI() {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        GradientBack(
          title: "",
          height: screen.height,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome \n This is your Travel App",
                style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 37,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            ButtonGreen(
              text: "Login with Gmail",
              icon: Icon(Icons.person_sharp, color: Colors.white, size: 40),
              onTap: () {
                userBloc.signIn().then((User? user) =>
                    print("El usuario es ${user?.displayName}"));
              },
              width: 315.0,
              height: 65.0,
            )
          ],
        )
      ],
    ));
  }
}
