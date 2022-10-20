import 'package:firebase_auth/firebase_auth.dart';

import 'package:hr_app/komponente/korisnik.dart';
import 'package:hr_app/usluge/baza.dart';

class AuthUsluga {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Korisnik? _korisnikIzUser(User? user) {
    return user != null ? Korisnik(uid: user.uid) : null;
  }

  Stream<Korisnik?>? get korisnik {
    return _auth
        .authStateChanges()
        .map((User? korisnik) => _korisnikIzUser(korisnik));
  }

  Future prijavaAuth({required String email, required String password}) async {
    try {
      UserCredential rezultat = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = rezultat.user;

      await BazaUsluga(uid: user!.uid).kreirajKorisnikaPrviPut();

      return _korisnikIzUser(user);
    } catch (e) {
      return null;
    }
  }

  Future odjava() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
