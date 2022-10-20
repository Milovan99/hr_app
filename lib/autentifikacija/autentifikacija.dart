import 'package:flutter/material.dart';
import 'package:hr_app/autentifikacija/prijava.dart';

class Autentifikacija extends StatefulWidget {
  const Autentifikacija({super.key});

  @override
  State<Autentifikacija> createState() => _AutentifikacijaState();
}

class _AutentifikacijaState extends State<Autentifikacija> {
  @override
  Widget build(BuildContext context) {
    return const Prijava();
  }
}
