import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:hr_app/komponente/lista_dogadjaja.dart';
import 'package:hr_app/komponente/ucitavanje.dart';
import 'package:hr_app/stranice/kalendar.dart';
import 'package:provider/provider.dart';

import 'korisnik.dart';

class Dogadjaji extends StatelessWidget {
  const Dogadjaji({super.key});

  @override
  Widget build(BuildContext context) {
    final korisnik = Provider.of<Korisnik?>(context);
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("korisnici")
            .doc(korisnik!.uid)
            .collection("dogadjaji")
            .orderBy("datum", descending: false)
            .where("datum", isGreaterThanOrEqualTo: DateTime.now())
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.docs.isEmpty) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    height: 100,
                    width: 250,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 248, 248, 248),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      boxShadow: [],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Kalendar()),
                                  );
                                },
                                icon:
                                    Image.asset("lib/assets/icon_calendar.png"),
                                iconSize: 30,
                              ),
                              const Text(
                                "Nadolazeća dešavanja",
                                style: TextStyle(
                                  fontFamily: 'Hubballi',
                                  fontSize: 19,
                                  color: Color.fromARGB(255, 71, 69, 84),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ));
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  height: 160,
                  width: 250,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 248, 248, 248),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: [],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Kalendar()),
                                );
                              },
                              icon: Image.asset("lib/assets/icon_calendar.png"),
                              iconSize: 30,
                            ),
                            const Text(
                              "Nadolazeća dešavanja",
                              style: TextStyle(
                                fontFamily: 'Hubballi',
                                fontSize: 19,
                                color: Color.fromARGB(255, 71, 69, 84),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length >= 2 ? 2 : 1,
                        itemBuilder: (context, index) {
                          var dogadjajId = snapshot.data!.docs[index].id;

                          return FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection("korisnici")
                                .doc(korisnik.uid)
                                .collection("dogadjaji")
                                .doc(dogadjajId)
                                .get(),
                            builder: (context, asyncSnapshot) {
                              if (asyncSnapshot.hasData) {
                                var dogadjaj = asyncSnapshot.data;

                                return Column(
                                  children: [
                                    ListaDogadjaja(
                                        datum: dogadjaj!['datum'],
                                        dan: dogadjaj['dan'],
                                        nazivDogadjaja:
                                            dogadjaj['naziv dogadjaja'],
                                        opis: dogadjaj['opis']),
                                    const SizedBox(
                                      height: 5,
                                    )
                                  ],
                                );
                              } else {
                                return const Ucitavanje();
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 1,
                      )
                    ],
                  ),
                ),
              );
            }
          } else {
            return const Ucitavanje();
          }
        });
  }
}
