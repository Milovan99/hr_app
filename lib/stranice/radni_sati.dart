import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hr_app/komponente/lista_radnih_sati.dart';
import 'package:hr_app/komponente/ucitavanje.dart';
import 'package:provider/provider.dart';

import '../komponente/korisnik.dart';

class RadniSati extends StatefulWidget {
  const RadniSati({super.key});

  @override
  State<RadniSati> createState() => _RadniSatiState();
}

class _RadniSatiState extends State<RadniSati> {
  DateTimeRange dateRange =
      DateTimeRange(start: DateTime(2022, 9, 25), end: DateTime(2022, 9, 29));
  @override
  Widget build(BuildContext context) {
    final korisnik = Provider.of<Korisnik?>(context);
    final start = dateRange.start;
    final end = dateRange.end;
    final daysToGenerate = end.difference(start).inDays;
    final days = List.generate(daysToGenerate + 1,
        (i) => DateTime(start.year, start.month, start.day + (i)));

    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("korisnici")
            .doc(korisnik!.uid)
            .collection("radni sati")
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
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Izaberi datum",
                        style: TextStyle(
                            color: Color.fromARGB(255, 71, 69, 84),
                            fontSize: 19,
                            fontFamily: 'Hubballi'),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 249, 249, 249),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                icon: const Icon(Icons.calendar_month,
                                    color: Color.fromARGB(255, 107, 150, 176)),
                                onPressed: pickDateRange,
                                label: Text(
                                  '${start.year}/${start.month}/${start.day} - ${end.year}/${end.month}/${end.day}',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 19,
                                      fontFamily: 'Hubballi'),
                                ),
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor:
                                      const Color.fromARGB(255, 249, 249, 249),
                                ),
                              )
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Container(
                          height: 80,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 249, 249, 249),
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Ukupno",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 107, 150, 176),
                                          fontSize: 19,
                                          fontFamily: 'Hubballi'),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "16:00 sati",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 71, 69, 84),
                                          fontSize: 19,
                                          fontFamily: 'Hubballi'),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Prijavljeno",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 107, 150, 176),
                                          fontSize: 19,
                                          fontFamily: 'Hubballi'),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "16:00 sati",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 71, 69, 84),
                                          fontSize: 19,
                                          fontFamily: 'Hubballi'),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 55,
                                  child: TextButton(
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(0.5),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20))),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color.fromARGB(
                                                    255, 235, 235, 235))),
                                    onPressed: () {},
                                    child: Column(children: const [
                                      Text(
                                        "Prijavi",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 107, 150, 176),
                                            fontSize: 19,
                                            fontFamily: 'Hubballi'),
                                      ),
                                      Text(
                                        "00:00 sati",
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 71, 69, 84),
                                            fontSize: 19,
                                            fontFamily: 'Hubballi'),
                                      )
                                    ]),
                                  ),
                                )
                              ]),
                        ),
                      ),
                      const SizedBox(height: 5),
                      ListView.builder(
                          itemCount: daysToGenerate + 1,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return FutureBuilder(
                              future: FirebaseFirestore.instance
                                  .collection("korisnici")
                                  .doc(korisnik.uid)
                                  .collection("radni sati")
                                  .doc(
                                      ('${days[index].year}-${days[index].month}-${days[index].day}'))
                                  .get(),
                              builder: (context, asyncSnapshot) {
                                if (asyncSnapshot.hasData) {
                                  var radniSat = asyncSnapshot.data;

                                  if (radniSat!.exists) {
                                    return ListaRadnihSati(
                                        aktivnost: radniSat['aktivnost'],
                                        datum:
                                            '${days[index].year}-${days[index].month}-${days[index].day}',
                                        ukupno: radniSat['ukupno sati']);
                                  } else {
                                    return Container();
                                  }
                                } else {
                                  return const Ucitavanje();
                                }
                              },
                            );
                          }),
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
      dateRange = newDateRange;
    });
  }
}
