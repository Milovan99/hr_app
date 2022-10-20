import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:hr_app/komponente/liste_zahteva_za_odmor.dart';
import 'package:hr_app/komponente/ucitavanje.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../komponente/korisnik.dart';

class Odmor extends StatefulWidget {
  const Odmor({super.key});

  @override
  State<Odmor> createState() => _OdmorState();
}

class _OdmorState extends State<Odmor> {
  DateTimeRange dateRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  final TextEditingController datumController = TextEditingController();
  @override
  void initState() {
    datumController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final korisnik = Provider.of<Korisnik?>(context);
    final TextEditingController vrstaOdmoraController = TextEditingController();

    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("korisnici")
            .doc(korisnik!.uid)
            .collection("zahtevi za odmor")
            .orderBy("vreme", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                      const SizedBox(width: 45)
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Zahtevi za odmor",
                        style: TextStyle(
                            color: Color.fromARGB(255, 71, 69, 84),
                            fontSize: 19,
                            fontFamily: 'Hubballi'),
                      ),
                      const SizedBox(height: 15),
                      snapshot.data!.docs.isEmpty
                          ? Container(
                              width: 300,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 249, 249, 249),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                        "lib/assets/Ikonice/suncobran1.png"),
                                    const Text("Nema trenutnih zahteva"),
                                  ],
                                ),
                              ))
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                var odmorId = snapshot.data!.docs[index].id;
                                return FutureBuilder(
                                  future: FirebaseFirestore.instance
                                      .collection("korisnici")
                                      .doc(korisnik.uid)
                                      .collection("zahtevi za odmor")
                                      .doc(odmorId)
                                      .get(),
                                  builder: (context, asyncSnapshot) {
                                    if (asyncSnapshot.hasData) {
                                      var odmor = asyncSnapshot.data;

                                      return ListeZahtevaZaOdmor(
                                          datum: odmor!['datum'],
                                          nazivZahteva: odmor['naziv zahteva'],
                                          status: odmor['status']);
                                    } else {
                                      return const Ucitavanje();
                                    }
                                  },
                                );
                              }),
                      const SizedBox(height: 20),
                      const Text("Stanje",
                          style: TextStyle(
                            fontFamily: 'Hubballi',
                            fontSize: 19,
                            color: Color.fromARGB(255, 71, 69, 84),
                          )),
                      const SizedBox(height: 20),
                      StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("korisnici")
                              .doc(korisnik.uid)
                              .collection("odmor")
                              .snapshots(),
                          builder: (context, snapshotZ) {
                            if (snapshotZ.hasData) {
                              var stanjeOdmora = snapshotZ.data!.docs;
                              var stanjeOdmoraId = stanjeOdmora[0].id;
                              String neiskoristeno =
                                  stanjeOdmora[0]['neiskoristeno'].toString();
                              String iskoristeno =
                                  stanjeOdmora[0]['iskoristeno'].toString();
                              String rezervisano =
                                  stanjeOdmora[0]['rezervisano'].toString();
                              String ukupno =
                                  stanjeOdmora[0]['ukupno'].toString();
                              return Center(
                                child: Container(
                                  width: 300,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 249, 249, 249),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(7),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Center(
                                      child: Column(children: [
                                        Image.asset(
                                            "lib/assets/Ikonice/suncobran2.png"),
                                        const SizedBox(height: 10),
                                        Text(neiskoristeno,
                                            style: const TextStyle(
                                                fontFamily: 'Hubballi',
                                                fontSize: 30,
                                                color: Color.fromARGB(
                                                    255, 71, 69, 84),
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(height: 5),
                                        Text("Iskoristeni dani : $iskoristeno",
                                            style: const TextStyle(
                                              fontFamily: 'Hubballi',
                                              fontSize: 19,
                                              color: Color.fromARGB(
                                                  255, 71, 69, 84),
                                            )),
                                        const SizedBox(height: 5),
                                        Text("Rezervisanih dana : $rezervisano",
                                            style: const TextStyle(
                                              fontFamily: 'Hubballi',
                                              fontSize: 19,
                                              color: Color.fromARGB(
                                                  255, 71, 69, 84),
                                            )),
                                        const SizedBox(height: 5),
                                        Text("Ukupno dana godisnjeg : $ukupno",
                                            style: const TextStyle(
                                              fontFamily: 'Hubballi',
                                              fontSize: 19,
                                              color: Color.fromARGB(
                                                  255, 71, 69, 84),
                                            )),
                                        const SizedBox(height: 15),
                                        FloatingActionButton.extended(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          backgroundColor: const Color.fromARGB(
                                              255, 254, 211, 17),
                                          onPressed: (() => showDialog(
                                              context: context,
                                              builder:
                                                  ((context) => AlertDialog(
                                                        title: const Text(
                                                            "Pošalji zahtev za odmor"),
                                                        content:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            children: [
                                                              TextFormField(
                                                                decoration: const InputDecoration(
                                                                    icon: Icon(Icons
                                                                        .edit_note),
                                                                    hintText:
                                                                        "Opis zahteva za odmor"),
                                                                controller:
                                                                    vrstaOdmoraController,
                                                              ),
                                                              TextFormField(
                                                                onTap:
                                                                    pickDateRange,
                                                                decoration: const InputDecoration(
                                                                    icon: Icon(Icons
                                                                        .calendar_today),
                                                                    hintText:
                                                                        "Izaberi datume"),
                                                                controller:
                                                                    datumController,
                                                              ),
                                                            ],
                                                          ),
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
                                                              builder: (context,
                                                                  snapshot) {
                                                                if (snapshot
                                                                    .hasData) {
                                                                  return TextButton(
                                                                      onPressed:
                                                                          (() async {
                                                                        if (datumController.text.isEmpty &&
                                                                            vrstaOdmoraController.text.isEmpty) {
                                                                        } else {
                                                                          Navigator.pop(
                                                                              context);
                                                                          await FirebaseFirestore
                                                                              .instance
                                                                              .collection("korisnici")
                                                                              .doc(korisnik.uid)
                                                                              .collection("zahtevi za odmor")
                                                                              .add({
                                                                            "datum":
                                                                                datumController.text,
                                                                            "naziv zahteva":
                                                                                vrstaOdmoraController.text,
                                                                            "status":
                                                                                "rezervisano",
                                                                            "vreme":
                                                                                DateTime.now()
                                                                          });
                                                                          await FirebaseFirestore
                                                                              .instance
                                                                              .collection("korisnici")
                                                                              .doc(korisnik.uid)
                                                                              .collection("odmor")
                                                                              .doc(stanjeOdmoraId)
                                                                              .update({
                                                                            "rezervisano":
                                                                                int.parse(rezervisano) + 1,
                                                                          });
                                                                          await FirebaseFirestore
                                                                              .instance
                                                                              .collection("korisnici")
                                                                              .doc(korisnik.uid)
                                                                              .collection("obavestenja")
                                                                              .add({
                                                                            "naslov":
                                                                                vrstaOdmoraController.text,
                                                                            "sadrzaj":
                                                                                "rezervisano ${datumController.text}",
                                                                            "tip obavestenja":
                                                                                "odmor",
                                                                            "vreme":
                                                                                DateTime.now(),
                                                                            "status":
                                                                                "neprocitano"
                                                                          });
                                                                        }

                                                                        datumController
                                                                            .clear();
                                                                        vrstaOdmoraController
                                                                            .clear();
                                                                        setState(
                                                                            () {});
                                                                        return;
                                                                      }),
                                                                      child: const Text(
                                                                          "Posalji"));
                                                                } else {
                                                                  return const Ucitavanje();
                                                                }
                                                              })
                                                        ],
                                                      )))),
                                          label: const Text(
                                            "Pošalji zahtev",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 249, 249, 249),
                                                fontSize: 19,
                                                fontFamily: 'Hubballi',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return const Ucitavanje();
                            }
                          })
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Ucitavanje();
          }
        });
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      initialDateRange: dateRange,
      saveText: "Sačuvaj",
      helpText: "IZABERI NIZ DANA",
      cancelText: "Izađi",
      errorFormatText: 'Unesite ispravan datum',
      errorInvalidText: 'Unestie ispravan niz dana',
      fieldStartHintText: "Dan/Mjesec/Godina",
      fieldStartLabelText: "Početni datum",
      fieldEndHintText: "Dan/Mjesec/Godina",
      fieldEndLabelText: "Krajnji datum",
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color.fromARGB(255, 155, 193, 188),
              onPrimary: Color.fromARGB(255, 93, 87, 107),
              onSurface: Color.fromARGB(255, 155, 193, 188),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(
                    255, 155, 193, 188), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (newDateRange == null) return;

    setState(() {
      datumController.text =
          '${newDateRange.start.year}-${newDateRange.start.month}-${newDateRange.start.day}/${newDateRange.end.year}-${newDateRange.end.month}-${newDateRange.end.day}';
    });
  }
}
