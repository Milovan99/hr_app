import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:hr_app/komponente/lista_obavestenje.dart';
import 'package:hr_app/komponente/ucitavanje.dart';
import 'package:provider/provider.dart';

import '../komponente/korisnik.dart';

class Obavestenja extends StatefulWidget {
  const Obavestenja({super.key});

  @override
  State<Obavestenja> createState() => _ObavestenjaState();
}

class ObavestenjaConst {
  String tipObavestenja;
  String naslov;
  String sadrzaj;
  Icon ikonica;
  ObavestenjaConst(
      {required this.tipObavestenja,
      required this.naslov,
      required this.sadrzaj,
      required this.ikonica});
}

class _ObavestenjaState extends State<Obavestenja> {
  @override
  Widget build(BuildContext context) {
    final korisnik = Provider.of<Korisnik?>(context);
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("korisnici")
            .doc(korisnik!.uid)
            .collection("obavestenja")
            .orderBy("vreme", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text("Nema obavestenja"),
              );
            }
            return Scaffold(
                backgroundColor: const Color.fromARGB(255, 230, 235, 224),
                appBar: AppBar(
                  elevation: 0.8,
                  backgroundColor: const Color.fromARGB(255, 155, 193, 188),
                  automaticallyImplyLeading: false,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor:
                              const Color.fromARGB(255, 248, 248, 248),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            color: const Color.fromARGB(255, 93, 87, 107),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                        const Text(
                          "Naziv aplikacije",
                          style: TextStyle(
                              color: Color.fromARGB(255, 93, 87, 107),
                              fontSize: 16,
                              fontFamily: 'IndieFlower'),
                        ),
                        const SizedBox(width: 44),
                      ],
                    ),
                  ),
                ),
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          textAlign: TextAlign.center,
                          "Obavestenja",
                          style: TextStyle(
                              color: Color.fromARGB(255, 93, 87, 107),
                              fontFamily: 'Hubballi',
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                            itemCount: snapshot.data!.docs.length >= 5
                                ? 5
                                : snapshot.data!.docs.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(top: 5),
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var obavestenjeId = snapshot.data!.docs[index].id;

                              return Column(
                                children: [
                                  FutureBuilder(
                                    future: FirebaseFirestore.instance
                                        .collection("korisnici")
                                        .doc(korisnik.uid)
                                        .collection("obavestenja")
                                        .doc(obavestenjeId)
                                        .get(),
                                    builder: (context, asyncSnapshot) {
                                      if (asyncSnapshot.hasData) {
                                        var obavestenje = asyncSnapshot.data;
                                        return Column(
                                          children: [
                                            ListaObavestenja(
                                              tipObavestenja: obavestenje![
                                                  'tip obavestenja'],
                                              naslov: obavestenje['naslov'],
                                              sadrzaj: obavestenje['sadrzaj'],
                                              vreme: obavestenje['vreme'],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        );
                                      } else {
                                        return const Ucitavanje();
                                      }
                                    },
                                  )
                                ],
                              );
                            }),
                      ],
                    ),
                  ),
                ));
          } else {
            return const Ucitavanje();
          }
        });
  }
}
