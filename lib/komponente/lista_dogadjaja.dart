import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListaDogadjaja extends StatefulWidget {
  final Timestamp datum;
  final String dan;
  final String nazivDogadjaja;
  final String opis;
  const ListaDogadjaja(
      {super.key,
      required this.datum,
      required this.dan,
      required this.nazivDogadjaja,
      required this.opis});

  @override
  State<ListaDogadjaja> createState() => _ListaDogadjajaState();
}

class _ListaDogadjajaState extends State<ListaDogadjaja> {
  @override
  Widget build(BuildContext context) {
    DateTime datum = widget.datum.toDate();
    final DateFormat formatterDatum = DateFormat('MMMd');
    final DateFormat formatterDan = DateFormat('E');
    final String formatiranDatum = formatterDatum.format(datum);
    final String formatiranDan = formatterDan.format(datum);
    Map<String, String> dani = {
      "Mon": "Pon",
      "Tue": "Uto",
      "Wed": "Sre",
      "Thu": "Čet",
      "Fri": "Pet",
      "Sat": "Sub",
      "Sun": "Ned"
    };

    return Padding(
      padding: const EdgeInsets.only(left: 35),
      child: IntrinsicHeight(
        child: Row(
          children: [
            SizedBox(
              width: 60,
              child: Column(
                children: [
                  Text(formatiranDatum),
                  Text(
                    dani[formatiranDan]!,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const VerticalDivider(
              thickness: 2,
              width: 25,
              color: Color.fromARGB(255, 155, 193, 188),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.nazivDogadjaja,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 155, 193, 188),
                    ),
                  ),
                  Text(widget.opis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
