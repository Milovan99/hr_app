import 'package:flutter/material.dart';
import 'package:hr_app/komponente/cek.dart';
import 'package:hr_app/komponente/korisnik.dart';
import 'package:hr_app/komponente/radni_sati.dart';
import 'package:hr_app/komponente/ucitavanje.dart';
import 'package:hr_app/usluge/baza.dart';
import 'package:provider/provider.dart';

class CekKartica extends StatefulWidget {
  const CekKartica({super.key});

  @override
  State<CekKartica> createState() => _CekKarticaState();
}

class _CekKarticaState extends State<CekKartica> {
  @override
  Widget build(BuildContext context) {
    final korisnik = Provider.of<Korisnik?>(context);
    return StreamBuilder<RadniSati>(
        stream: BazaUsluga(uid: korisnik!.uid).radniSati,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            RadniSati? radniSati = snapshot.data;

            return Cek(
                pocetakRada: radniSati!.pocetakRada,
                krajRada: radniSati.krajRada,
                ukupniSati: radniSati.ukupnoSati);
          } else {
            return const Ucitavanje();
          }
        });
  }
}
