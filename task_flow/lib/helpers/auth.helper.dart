import 'package:firebase_auth/firebase_auth.dart';

class AuthHandler{
  final _auth = FirebaseAuth.instance;
  Future<bool> isAuth() async{
    bool auth = false;
    _auth
      .authStateChanges()
      .listen((User? user) {
        if (user == null) {
          auth = false;
        } else {
          auth = true;
        }
    });
    return auth;
  }
  
  Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<bool> signIn(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    }
    on FirebaseAuthException{
      return false;
    }
  }
  
  Future<void> logout() async{
    await FirebaseAuth.instance.signOut();
  }
}