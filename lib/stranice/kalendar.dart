import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hr_app/komponente/dogadjaj.dart';
import 'package:hr_app/komponente/ucitavanje.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../komponente/korisnik.dart';

class Kalendar extends StatefulWidget {
  const Kalendar({super.key});

  @override
  State<Kalendar> createState() => _KalendarState();
}

class _KalendarState extends State<Kalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  late Map<DateTime?, List<Dogadjaj>> selektovaniDogadjaji;

  final TextEditingController _dogadjajController = TextEditingController();
  final TextEditingController _dogadjajController2 = TextEditingController();

  _preuzmidogadjaje(List<Dogadjaj> dogadjaji) {
    selektovaniDogadjaji = {};
    for (var dogadjaj in dogadjaji) {
      DateTime datum = DateTime.utc(
          dogadjaj.datum!.year, dogadjaj.datum!.month, dogadjaj.datum!.day, 00);
      if (selektovaniDogadjaji[datum] == null) selektovaniDogadjaji[datum] = [];
      selektovaniDogadjaji[datum]!.add(dogadjaj);
    }
  }

  List<Dogadjaj> _getDogadjajUDanu(DateTime? date) {
    return selektovaniDogadjaji[date] ?? [];
  }

  @override
  void dispose() {
    _dogadjajController.dispose();
    _dogadjajController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final korisnik = Provider.of<Korisnik?>(context);
    List<Dogadjaj> dogadjaji = [];
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
                backgroundColor: const Color.fromARGB(255, 248, 248, 248),
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
              CircleAvatar(
                radius: 22,
                backgroundColor: const Color.fromARGB(255, 248, 248, 248),
                child: IconButton(
                  icon: const Icon(Icons.edit_note),
                  color: const Color.fromARGB(255, 93, 87, 107),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("korisnici")
                .doc(korisnik!.uid)
                .collection("dogadjaji")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                dogadjaji = List.generate(snapshot.data!.docs.length, (index) {
                  var rezultat = snapshot.data!.docs[index];
                  Timestamp t = rezultat['datum'];
                  DateTime datum = t.toDate();
                  return Dogadjaj(
                      dan: rezultat['dan'],
                      datum: datum,
                      nazivDogadjaja: rezultat['naziv dogadjaja'],
                      opis: rezultat['opis']);
                });
                _preuzmidogadjaje(dogadjaji);
                return Column(
                  children: [
                    TableCalendar(
                      calendarStyle: const CalendarStyle(
                        canMarkersOverflow: true,
                      ),
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: _focusedDay,
                      calendarFormat: _calendarFormat,
                      selectedDayPredicate: (day) {
                        // Use `selectedDayPredicate` to determine which day is currently selected.
                        // If this returns true, then `day` will be marked as selected.

                        // Using `isSameDay` is recommended to disregard
                        // the time-part of compared DateTime objects.
                        return isSameDay(_selectedDay, day);
                      },
                      eventLoader: _getDogadjajUDanu,
                      onDaySelected: (selectedDay, focusedDay) {
                        if (!isSameDay(_selectedDay, selectedDay)) {
                          // Call `setState()` when updating the selected day
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                          });
                        }
                      },
                      onFormatChanged: (format) {
                        if (_calendarFormat != format) {
                          // Call `setState()` when updating calendar format
                          setState(() {
                            _calendarFormat = format;
                          });
                        }
                      },
                      onPageChanged: (focusedDay) {
                        // No need to call `setState()` here
                        _focusedDay = focusedDay;
                      },
                    ),
                    ..._getDogadjajUDanu(_selectedDay)
                        .map((Dogadjaj dogadjaj) => ListTile(
                              title: Text(dogadjaj.nazivDogadjaja),
                              subtitle: Text(dogadjaj.opis),
                            )),
                  ],
                );
              } else {
                return const Ucitavanje();
              }
            }),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (() => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text("Dodaj dogadjaj"),
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                                hintText: "Naziv dogadjaja"),
                            controller: _dogadjajController,
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(hintText: "Vreme"),
                            controller: _dogadjajController2,
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Otkazi")),
                      StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("korisnici")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return TextButton(
                                  onPressed: () async {
                                    if (_dogadjajController.text.isEmpty) {
                                    } else {
                                      if (selektovaniDogadjaji[_selectedDay] !=
                                          null) {
                                        for (var index = 0;
                                            index < snapshot.data!.docs.length;
                                            index++) {
                                          var indeks =
                                              snapshot.data!.docs[index].id;
                                          await FirebaseFirestore.instance
                                              .collection("korisnici")
                                              .doc(indeks)
                                              .collection("obavestenja")
                                              .add({
                                            "naslov": _dogadjajController.text,
                                            "sadrzaj":
                                                _dogadjajController2.text,
                                            "tip obavestenja": "dogadjaj",
                                            "vreme": DateTime.now(),
                                          });
                                          await FirebaseFirestore.instance
                                              .collection("korisnici")
                                              .doc(indeks)
                                              .collection("dogadjaji")
                                              .add({
                                            "dan": _selectedDay!.day.toString(),
                                            "naziv dogadjaja":
                                                _dogadjajController.text,
                                            "datum": _selectedDay,
                                            "opis": _dogadjajController.text,
                                          });
                                        }
                                      } else {
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Cuvanje podataka ...')));
                                        for (var index = 0;
                                            index < snapshot.data!.docs.length;
                                            index++) {
                                          var indeks =
                                              snapshot.data!.docs[index].id;

                                          await FirebaseFirestore.instance
                                              .collection("korisnici")
                                              .doc(indeks)
                                              .collection("obavestenja")
                                              .add({
                                            "naslov": _dogadjajController.text,
                                            "sadrzaj":
                                                '${_selectedDay!.year}/${_selectedDay!.month}/${_selectedDay!.day} ${_dogadjajController2.text}',
                                            "tip obavestenja": "dogadjaj",
                                            "vreme": DateTime.now(),
                                          });
                                          await FirebaseFirestore.instance
                                              .collection("korisnici")
                                              .doc(indeks)
                                              .collection("dogadjaji")
                                              .add({
                                            "dan": _selectedDay!.day.toString(),
                                            "naziv dogadjaja":
                                                _dogadjajController.text,
                                            "datum": _selectedDay,
                                            "opis": _dogadjajController.text,
                                          });
                                        }
                                      }
                                    }

                                    _dogadjajController.clear();
                                    _dogadjajController2.clear();
                                    setState(() {});
                                    return;
                                  },
                                  child: const Text("Dodaj"));
                            } else {
                              return const Ucitavanje();
                            }
                          }),
                    ],
                  ))),
          label: const Text("Dodaj dogadjaj"),
          icon: const Icon(Icons.add)),
    );
  }
}
