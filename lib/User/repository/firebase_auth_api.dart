import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signIn() async {
    GoogleSignInAccount? googleSingleSignInAccount =
        await googleSignIn.signIn();
    GoogleSignInAuthentication gSA =
        await googleSingleSignInAccount!.authentication;

    UserCredential userCredential = await _auth.signInWithCredential(
        GoogleAuthProvider.credential(
            idToken: gSA.idToken, accessToken: gSA.accessToken));

    return userCredential.user;
  }

  Future<void> signOut() async {
    _auth.signOut().then((value) => print("Sesión cerrada"));
    googleSignIn.signOut();
    print("Sesiones cerradas");
  }
}


// Future<FirebaseUser> emailAndPasswordSignIn(String email, String password) async{
//     AuthResult authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);

//     FirebaseUser user = authResult.user;

//     return user;
//   }


// Future<FirebaseUser> facebookSignIn() async{
//     final result = await _facebookLogin.logInWithReadPermissions(['email']);

//     switch (result.status) {
//       case FacebookLoginStatus.loggedIn:{
//         AuthResult authResult = await _auth.signInWithCredential(
//           FacebookAuthProvider.getCredential(accessToken: result.accessToken.token)
//         );
        
//         FirebaseUser user = authResult.user;

//         return user;
//         break;
//       }
        
//       case FacebookLoginStatus.cancelledByUser:{
//         print("cancelado por usuario");
//         break;
//       }
        
//       case FacebookLoginStatus.error:{
//         print("Error: "+result.errorMessage.toString());
//         break;
//       }
//     }
//   }