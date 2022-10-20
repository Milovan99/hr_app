import 'package:flutter/material.dart';
import 'package:hr_app/komponente/korisnik.dart';
import 'package:hr_app/stranice/kostur.dart';
import 'package:provider/provider.dart';

import '../autentifikacija/autentifikacija.dart';

class Omot extends StatelessWidget {
  const Omot({super.key});

  @override
  Widget build(BuildContext context) {
    final korisnik = Provider.of<Korisnik?>(context);

    if (korisnik == null) {
      return const Autentifikacija();
    } else {
      return const Kostur();
    }
  }
}
