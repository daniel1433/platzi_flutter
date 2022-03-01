import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/repository/auth_respository.dart';

class UserBloc implements Bloc {
  // static UserBloc _userBloc = UserBloc._internal();
  final authRepository = AuthRepository();

  // factory UserBloc() {
  //   // _userBloc = _userBloc;
  //   return _userBloc;
  // }

  // UserBloc._internal();

  //Flujo de datos -Streams
  //Streams -Firebase
  //StreamController
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get autStatus => streamFirebase;

  //Caso use
  //1. Sign in a la aplicación Google
  Future<User?> signIn() {
    return authRepository.signInFirebase();
  }

  Future<void> signOut() {
    return authRepository.signOut();
  }

  @override
  void dispose() {}
}
