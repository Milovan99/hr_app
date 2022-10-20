import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hr_app/komponente/radni_sati.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'korisnik.dart';

class Cek extends StatefulWidget {
  final String pocetakRada;
  final String krajRada;
  final String ukupniSati;
  const Cek(
      {super.key,
      required this.pocetakRada,
      required this.krajRada,
      required this.ukupniSati});

  @override
  State<Cek> createState() => _CekState();
}

class _CekState extends State<Cek> {
  String dropdownvalue = 'Aplikacija demo';
  Color _watchColor = const Color.fromARGB(255, 127, 209, 174);

  Icon _check = const Icon(Icons.access_time_filled);

  // List of items in our dropdown menu

  @override
  Widget build(BuildContext context) {
    final korisnik = Provider.of<Korisnik?>(context);
    DateTime now = DateTime.now();
    var formater = DateFormat('yyyy-MM-dd');
    String pocetakRada = DateFormat.Hm().format(now);

    String formatiraniDatum = formater.format(now);
    final CollectionReference korisniciCollection =
        FirebaseFirestore.instance.collection("korisnici");
    return StreamBuilder<RadniSati>(
        stream: null,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: 135,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 248, 248, 248),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: 65,
                            height: 51,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 249, 249, 249),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(59, 0, 0, 0),
                                  spreadRadius: 0.5,
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: IconButton(
                              iconSize: 35,
                              icon: _check,
                              color: _watchColor,
                              onPressed: () async {
                                setState(() {
                                  if (_watchColor ==
                                      const Color.fromARGB(255, 237, 107, 90)) {
                                    _watchColor = const Color.fromARGB(
                                        255, 127, 209, 174);
                                    _check =
                                        const Icon(Icons.access_time_filled);
                                  } else {
                                    _watchColor =
                                        const Color.fromARGB(255, 237, 107, 90);
                                    _check = const Icon(Icons.pause_circle);
                                  }
                                });
                                if (_watchColor ==
                                    const Color.fromARGB(255, 237, 107, 90)) {
                                  return await korisniciCollection
                                      .doc(korisnik!.uid)
                                      .collection('radni sati')
                                      .doc(formatiraniDatum.toString())
                                      .update({
                                    'pocetak rada': pocetakRada,
                                    'kraj rada': "--:--",
                                    'aktivnost': 'akrivnost',
                                  });
                                } else {
                                  DateTime trenutno = DateTime.now();
                                  String krajRada =
                                      DateFormat.Hm().format(trenutno);

                                  var format = DateFormat("HH:mm");
                                  var start = format.parse(pocetakRada);
                                  var end = format.parse(krajRada);
                                  var ukupno = int.parse(widget.ukupniSati);
                                  var razlika = end.difference(start).inMinutes;
                                  var zbir = ukupno + razlika;
                                  return await korisniciCollection
                                      .doc(korisnik!.uid)
                                      .collection('radni sati')
                                      .doc(formatiraniDatum.toString())
                                      .update({
                                    'kraj rada': krajRada,
                                    'ukupno sati': zbir.toString()
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                            ),
                            const Text(
                              "Početak rada",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 71, 69, 84),
                                  fontSize: 19,
                                  fontFamily: 'Hubballi'),
                            ),
                            Text(
                              widget.pocetakRada,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 200, 217, 188),
                                  fontSize: 25,
                                  fontFamily: 'Hubballi'),
                            ),
                          ],
                        ),
                        const VerticalDivider(
                          width: 25,
                          thickness: 1,
                          color: Color.fromARGB(255, 150, 150, 150),
                        ),
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                            ),
                            const Text(
                              "Kraj rada",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 71, 69, 84),
                                  fontSize: 19,
                                  fontFamily: 'Hubballi'),
                            ),
                            Text(
                              widget.krajRada,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 200, 217, 188),
                                  fontSize: 25,
                                  fontFamily: 'Hubballi'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Današnja aktivnost",
                        style: TextStyle(fontFamily: 'Hubballi', fontSize: 17),
                      ),
                      Text(
                        "${widget.ukupniSati} minuta",
                        style: const TextStyle(
                          fontFamily: 'Hubballi',
                          fontSize: 17,
                          color: Color.fromARGB(255, 165, 179, 155),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
