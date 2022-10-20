import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:hr_app/komponente/korisnik.dart';
import 'package:hr_app/komponente/ucitavanje.dart';
import 'package:hr_app/stranice/detelji_poruka.dart';

import 'package:hr_app/usluge/auth.dart';
import 'package:provider/provider.dart';

class Profil extends StatefulWidget {
  final String ime;
  final String odeljenje;
  final String mesto;
  final String slika;
  final String email;
  final String telefon;
  final String tim;
  final String datumZaposlenja;
  final String uloga;
  final String id;
  const Profil(
      {super.key,
      required this.ime,
      required this.slika,
      required this.odeljenje,
      required this.mesto,
      required this.email,
      required this.telefon,
      required this.tim,
      required this.datumZaposlenja,
      required this.uloga,
      required this.id});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final AuthUsluga _auth = AuthUsluga();

  final TextEditingController telefonController = TextEditingController();
  final TextEditingController timController = TextEditingController();
  final TextEditingController datumZaposlenjaController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController imeController = TextEditingController();
  final TextEditingController gradController = TextEditingController();

  @override
  void initState() {
    telefonController.text = widget.telefon;
    timController.text = widget.tim;
    datumZaposlenjaController.text = widget.datumZaposlenja;
    emailController.text = widget.email;
    imeController.text = widget.ime;
    gradController.text = widget.mesto;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final korisnik = Provider.of<Korisnik?>(context);
    String profilId = widget.uloga == "korisnik" ? korisnik!.uid : widget.id;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('korisnici')
            .doc(profilId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: SizedBox(
                height: 900,
                child: Scaffold(
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
                          (() {
                            if (widget.uloga == 'Korisnik') {
                              return CircleAvatar(
                                radius: 22,
                                backgroundColor:
                                    const Color.fromARGB(255, 248, 248, 248),
                                child: IconButton(
                                  icon: const Icon(Icons.logout),
                                  color: const Color.fromARGB(255, 93, 87, 107),
                                  onPressed: () async {
                                    Navigator.of(context).pop();
                                    await _auth.odjava();
                                  },
                                ),
                              );
                            } else {
                              return const SizedBox(height: 22, width: 22);
                            }
                          }())
                        ],
                      ),
                    ),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 30),
                    child: Column(
                      children: [
                        Center(
                          child: CircleAvatar(
                            maxRadius: 40,
                            child: Image.asset(widget.slika),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Text(
                            snapshot.data!['ime'],
                            style: const TextStyle(
                                color: Color.fromARGB(255, 71, 69, 84),
                                fontSize: 35,
                                fontFamily: 'Hubballi',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          snapshot.data!['opis rada'],
                          style: const TextStyle(
                            color: Color.fromARGB(255, 107, 150, 176),
                            fontSize: 22,
                            fontFamily: 'Hubballi',
                          ),
                        ),
                        Text(
                          snapshot.data!['mesto'],
                          style: const TextStyle(
                            color: Color.fromARGB(255, 107, 150, 176),
                            fontSize: 18,
                            fontFamily: 'Hubballi',
                          ),
                        ),
                        const SizedBox(height: 15),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("lib/assets/Ikonice/slack.png"),
                              Image.asset("lib/assets/Ikonice/linkedin.png"),
                              Image.asset("lib/assets/Ikonice/github.png"),
                              widget.uloga != "Korisnik"
                                  ? CircleAvatar(
                                      radius: 22,
                                      backgroundColor: const Color.fromARGB(
                                          255, 248, 248, 248),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return DetaljiPoruka(
                                                profilnaurl:
                                                    snapshot.data!['slika'],
                                                ime: snapshot.data!['ime'],
                                                posiljalacId: korisnik!.uid,
                                                primalacId: widget.id);
                                          }));
                                        },
                                        iconSize: 35,
                                        icon: Image.asset(
                                          "lib/assets/Ikonice/poruka.png",
                                        ),
                                      ),
                                    )
                                  : CircleAvatar(
                                      radius: 22,
                                      backgroundColor: const Color.fromARGB(
                                          255, 248, 248, 248),
                                      child: Center(
                                        child: IconButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        AlertDialog(
                                                  title: const Text(
                                                      "Izmeni podatke"),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: Column(children: [
                                                      TextFormField(
                                                        decoration:
                                                            const InputDecoration(
                                                                hintText:
                                                                    "Ime"),
                                                        controller:
                                                            imeController,
                                                      ),
                                                      TextFormField(
                                                        decoration:
                                                            const InputDecoration(
                                                                hintText:
                                                                    "Grad"),
                                                        controller:
                                                            gradController,
                                                      ),
                                                      TextFormField(
                                                        decoration:
                                                            const InputDecoration(
                                                                hintText:
                                                                    "Telefon"),
                                                        controller:
                                                            telefonController,
                                                      ),
                                                      TextFormField(
                                                        decoration:
                                                            const InputDecoration(
                                                                hintText:
                                                                    "Tim"),
                                                        controller:
                                                            timController,
                                                      ),
                                                      TextFormField(
                                                        decoration:
                                                            const InputDecoration(
                                                                hintText:
                                                                    "Datum zaposlenja"),
                                                        controller:
                                                            datumZaposlenjaController,
                                                      ),
                                                      TextFormField(
                                                        decoration:
                                                            const InputDecoration(
                                                                hintText:
                                                                    "Email"),
                                                        controller:
                                                            emailController,
                                                      ),
                                                    ]),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        child: const Text(
                                                            "Otkazi")),
                                                    StreamBuilder(
                                                      stream: FirebaseFirestore
                                                          .instance
                                                          .collection(
                                                              "korisnici")
                                                          .snapshots(),
                                                      builder:
                                                          (context, snapshot) {
                                                        if (snapshot.hasData) {
                                                          return TextButton(
                                                              onPressed: (() {
                                                                if (telefonController.text.isNotEmpty &&
                                                                    timController
                                                                        .text
                                                                        .isNotEmpty &&
                                                                    datumZaposlenjaController
                                                                        .text
                                                                        .isNotEmpty &&
                                                                    emailController
                                                                        .text
                                                                        .isNotEmpty) {
                                                                  FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          "korisnici")
                                                                      .doc(korisnik!
                                                                          .uid)
                                                                      .update({
                                                                    "datum zaposlenja":
                                                                        datumZaposlenjaController
                                                                            .text,
                                                                    "email":
                                                                        emailController
                                                                            .text,
                                                                    "ime":
                                                                        imeController
                                                                            .text,
                                                                    "mesto":
                                                                        gradController
                                                                            .text,
                                                                    "tim":
                                                                        timController
                                                                            .text,
                                                                    "telefon":
                                                                        telefonController
                                                                            .text
                                                                  });
                                                                }

                                                                Navigator.pop(
                                                                    context);
                                                                telefonController
                                                                    .clear;
                                                                timController
                                                                    .clear;
                                                                datumZaposlenjaController
                                                                    .clear;
                                                                emailController
                                                                    .clear;
                                                                imeController
                                                                    .clear;
                                                                gradController
                                                                    .clear;
                                                                return;
                                                              }),
                                                              child: const Text(
                                                                  "Posalji"));
                                                        } else {
                                                          return const Ucitavanje();
                                                        }
                                                      },
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.edit,
                                              color: Color.fromARGB(
                                                  255, 93, 87, 107),
                                            )),
                                      ),
                                    )
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          height: 220,
                          width: 300,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 249, 249, 249),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(59, 0, 0, 0),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: Offset(1, 4),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Informacije",
                                  style: TextStyle(
                                      fontSize: 21,
                                      color:
                                          Color.fromARGB(255, 107, 150, 176)),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Telefon"),
                                    Text(
                                      snapshot.data!['telefon'],
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Tim"),
                                    Text(
                                      snapshot.data!['tim'],
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Datum zaposlenja"),
                                    Text(
                                      snapshot.data!['datum zaposlenja'],
                                    ),
                                  ],
                                ),
                                const Divider(height: 1),
                                const Text("Email"),
                                Text(
                                  snapshot.data!['email'],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Ucitavanje();
          }
        });
  }

// onPressed: () => showModal(context),

}
