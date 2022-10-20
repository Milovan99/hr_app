import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hr_app/komponente/korisnik.dart';
import 'package:hr_app/stranice/omot.dart';
import 'package:hr_app/usluge/auth.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Korisnik?>.value(
      value: AuthUsluga().korisnik,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HR app',
        theme: ThemeData(
            fontFamily: "Hubballi",
            textTheme: const TextTheme(
                bodyText2: TextStyle(
                    fontSize: 19, color: Color.fromARGB(255, 93, 87, 107)))),
        home: const Omot(),
      ),
    );
  }
}
