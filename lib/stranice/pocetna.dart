import 'package:flutter/material.dart';
import 'package:hr_app/stranice/dokumenti.dart';
import 'package:hr_app/stranice/odmor.dart';
import 'package:hr_app/stranice/radni_sati.dart';

import '../komponente/cek_kartica.dart';
import '../komponente/dogadjaji.dart';

class Pocetna extends StatefulWidget {
  const Pocetna({super.key});

  @override
  State<Pocetna> createState() => _PocetnaState();
}

class _PocetnaState extends State<Pocetna> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30),
          child: SizedBox(
            height: 55,
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 4),
                  child: FloatingActionButton.extended(
                    elevation: 0,
                    heroTag: "btn1",
                    label: const Text(
                      'Zatraži odmor',
                      style: TextStyle(
                        fontFamily: 'Hubballi',
                        fontSize: 17,
                        color: Color.fromARGB(255, 93, 87, 107),
                      ),
                    ), // <-- Text
                    backgroundColor: const Color.fromARGB(255, 248, 248, 248),
                    icon: const Icon(
                      Icons.sunny,
                      size: 17.0,
                      color: Color.fromARGB(255, 93, 87, 107),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Odmor()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4, top: 8, right: 4),
                  child: FloatingActionButton.extended(
                    elevation: 0,
                    heroTag: "btn2",
                    label: const Text(
                      'Radni sati',
                      style: TextStyle(
                        fontFamily: 'Hubballi',
                        fontSize: 17,
                        color: Color.fromARGB(255, 93, 87, 107),
                      ),
                    ), // <-- Text
                    backgroundColor: const Color.fromARGB(255, 248, 248, 248),
                    icon: const Icon(
                      Icons.watch_later_sharp,
                      size: 17.0,
                      color: Color.fromARGB(255, 93, 87, 107),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RadniSati()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4, top: 8),
                  child: FloatingActionButton.extended(
                    elevation: 0,
                    heroTag: "btn3",
                    label: const Text(
                      'Dokumenta',
                      style: TextStyle(
                        fontFamily: 'Hubballi',
                        fontSize: 17,
                        color: Color.fromARGB(255, 93, 87, 107),
                      ),
                    ), // <-- Text
                    backgroundColor: const Color.fromARGB(255, 248, 248, 248),
                    icon: const Icon(
                      Icons.pages,
                      size: 17.0,
                      color: Color.fromARGB(255, 93, 87, 107),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Dokumenti()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Započni rad / Uzmi pauzu",
                  style: TextStyle(
                      color: Color.fromARGB(255, 71, 69, 84),
                      fontSize: 19,
                      fontFamily: 'Hubballi'),
                ),
              ),
              SizedBox(height: 10),
              CekKartica(),
              SizedBox(height: 20),
              Dogadjaji(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
