import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hr_app/komponente/ucitavanje.dart';
import 'package:provider/provider.dart';

import 'package:time_planner/time_planner.dart';
import 'package:intl/intl.dart';
import '../komponente/korisnik.dart';

class PlaniranjeAkrivnosti extends StatefulWidget {
  const PlaniranjeAkrivnosti({super.key});

  @override
  State<PlaniranjeAkrivnosti> createState() => _PlaniranjeAkrivnostiState();
}

class _PlaniranjeAkrivnostiState extends State<PlaniranjeAkrivnosti> {
  List<TimePlannerTask> tasks = [];

  final TextEditingController vremeController = TextEditingController();
  final TextEditingController satiController = TextEditingController();
  final TextEditingController danController = TextEditingController();
  final TextEditingController minuteController = TextEditingController();
  @override
  void initState() {
    vremeController.text = ""; //set the initial value of text field
    satiController.text = ""; //set the initial value of text field
    danController.text = ""; //set the initial value of text field
    minuteController.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> dani = {
      "Monday": "Ponedeljak",
      "Tuesday": "Utorak",
      "Wednesday": "Sreda",
      "Thursday": "Četvrtak",
      "Friday": "Petak",
      "Saturday": "Subota",
      "Sunday": "Nedelja"
    };
    List<TimePlannerTask> tasksFirestore = [];
    late int redniDan;

//

    final TextEditingController duzinaController = TextEditingController();
    final TextEditingController nazivController = TextEditingController();
//
    final DateTime trenutnoVreme = DateTime.now();
//
    final DateFormat formater = DateFormat('dd/MM/yyyy');
    final DateFormat danFormater = DateFormat('EEEE');
//
    final String danasniDan = danFormater.format(trenutnoVreme);
    final String danasniDatum = formater.format(trenutnoVreme);
//
    final DateTime sutrasnjeVreme = trenutnoVreme.add(const Duration(days: 1));

//
    final String sutrasnjiDan = danFormater.format(sutrasnjeVreme);
    final String sutranjiDatum = formater.format(sutrasnjeVreme);
//
    final DateTime prekosutrasnjeVreme =
        trenutnoVreme.add(const Duration(days: 2));

//
    final String prekosutrasnjiDan = danFormater.format(prekosutrasnjeVreme);
    final String prekosutrasnjiDatum = formater.format(prekosutrasnjeVreme);

    final korisnik = Provider.of<Korisnik?>(context);

    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("korisnici")
              .doc(korisnik!.uid)
              .collection("zadaci")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              tasksFirestore =
                  List.generate(snapshot.data!.docs.length, ((index) {
                var zadatak = snapshot.data!.docs[index];
                Timestamp t = zadatak['dan'];
                DateTime datumFirestore = t.toDate();
                final String datumFirestoreStr =
                    formater.format(datumFirestore);
                if (datumFirestoreStr == danasniDatum) {
                  redniDan = 0;
                } else if (datumFirestoreStr == sutranjiDatum) {
                  redniDan = 1;
                } else {
                  redniDan = 2;
                }

                return TimePlannerTask(
                  color: Colors.purple,
                  dateTime: TimePlannerDateTime(
                    day: redniDan,
                    hour: zadatak['sati'],
                    minutes: zadatak['minute'],
                  ),
                  minutesDuration: zadatak['duzina'],
                  child: Text(
                    zadatak['naziv'],
                    style: TextStyle(color: Colors.grey[350], fontSize: 12),
                  ),
                );
              }));
              tasks.addAll(tasksFirestore);
              return TimePlanner(
                style: TimePlannerStyle(
                  dividerColor: const Color.fromARGB(255, 155, 193, 188),
                ),
                // time will be start at this hour on table
                startHour: 8,
                // time will be end at this hour on table
                endHour: 22,
                // each header is a column and a day
                headers: [
                  TimePlannerTitle(
                    date: danasniDatum,
                    title: dani[danasniDan]!,
                  ),
                  TimePlannerTitle(
                    date: sutranjiDatum,
                    title: dani[sutrasnjiDan]!,
                  ),
                  TimePlannerTitle(
                    date: prekosutrasnjiDatum,
                    title: dani[prekosutrasnjiDan]!,
                  ),
                ],
                // List of task will be show on the time planner
                tasks: tasks,
              );
            } else {
              return const Ucitavanje();
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: ((context) => AlertDialog(
                    title: const Text("Dodaj zadatak"),
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration:
                                const InputDecoration(hintText: "Naziv"),
                            controller: nazivController,
                          ),
                          TextFormField(
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.calendar_today),
                                  hintText: "Dan"),
                              readOnly: true,
                              controller: danController,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime
                                        .now(), //DateTime.now() - not to allow to choose before today.
                                    lastDate: prekosutrasnjeVreme);

                                if (pickedDate != null) {
                                  //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  //formatted date output using intl package =>  2021-03-16
                                  //you can implement different kind of Date Format here according to your requirement

                                  setState(() {
                                    danController.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                }
                              }),
                          TextFormField(
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.timer), hintText: "Sati"),
                              controller: vremeController,
                              readOnly: true,
                              onTap: () async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  initialTime: TimeOfDay.now(),
                                  context: context,
                                );
                                if (pickedTime != null) {
                                  //output 10:51 PM
                                  DateTime parsedTime = DateFormat.jm().parse(
                                      pickedTime.format(context).toString());
                                  //converting to DateTime so that we can further format on different pattern.
                                  //output 1970-01-01 22:53:00.000

                                  String formattedTime =
                                      DateFormat('jm').format(parsedTime);

                                  String formattedTimeSati =
                                      DateFormat('H').format(parsedTime);
                                  String formattedMinute =
                                      DateFormat('m').format(parsedTime);
                                  //output 14
                                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                                  setState(() {
                                    vremeController.text = formattedTime;
                                    satiController.text =
                                        formattedTimeSati; //set the value of text field.
                                    minuteController.text = formattedMinute;
                                  });
                                }
                              }),
                          TextFormField(
                            decoration:
                                const InputDecoration(hintText: "Duzina"),
                            controller: duzinaController,
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
                            .doc(korisnik.uid)
                            .collection("zadaci")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return TextButton(
                                onPressed: (() {
                                  if (duzinaController.text.isNotEmpty &&
                                      minuteController.text.isNotEmpty &&
                                      nazivController.text.isNotEmpty &&
                                      danController.text.isNotEmpty &&
                                      satiController.text.isNotEmpty) {
                                    DateTime datum =
                                        DateTime.parse(danController.text);
                                    FirebaseFirestore.instance
                                        .collection("korisnici")
                                        .doc(korisnik.uid)
                                        .collection("zadaci")
                                        .add({
                                      "dan": datum,
                                      "duzina":
                                          int.parse(duzinaController.text),
                                      "minute":
                                          int.parse(minuteController.text),
                                      "naziv": nazivController.text,
                                      "sati": int.parse(satiController.text),
                                    });
                                  }
                                  /* _addObject(
                                      context,
                                      int.parse(danController.text),
                                      int.parse(satiController.text),
                                      int.parse(minuteController.text),
                                      int.parse(duzinaController.text),
                                      nazivController.text);**/
                                  Navigator.pop(context);
                                  vremeController.clear;
                                  danController.clear;
                                  duzinaController.clear;
                                  minuteController.clear;
                                  nazivController.clear;
                                  satiController.clear;
                                  setState(() {
                                    vremeController.text =
                                        ""; //set the initial value of text field
                                    satiController.text =
                                        ""; //set the initial value of text field
                                    danController.text =
                                        ""; //set the initial value of text field
                                    minuteController.text =
                                        ""; //set the initial value of text field
                                  });
                                  return;
                                }),
                                child: const Text("Posalji"));
                          } else {
                            return const Ucitavanje();
                          }
                        },
                      )
                    ]))),
        tooltip: 'Add random task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
//_addObject(context)
