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
    print(auth);
    return auth;
  }
  
  Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signIn(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }
    on Error {
      return;
    }
  }
  
  Future<void> logout() async{
    await FirebaseAuth.instance.signOut();
  }
}