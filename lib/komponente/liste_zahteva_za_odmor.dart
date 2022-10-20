import 'package:flutter/material.dart';

class ListeZahtevaZaOdmor extends StatefulWidget {
  final String nazivZahteva;
  final String datum;
  final String status;
  const ListeZahtevaZaOdmor(
      {super.key,
      required this.datum,
      required this.nazivZahteva,
      required this.status});

  @override
  State<ListeZahtevaZaOdmor> createState() => _ListeZahtevaZaOdmorState();
}

class _ListeZahtevaZaOdmorState extends State<ListeZahtevaZaOdmor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 249, 249, 249),
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("lib/assets/Ikonice/suncobran1.png"),
                    const SizedBox(width: 10),
                    Text(
                      widget.nazivZahteva,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 107, 150, 176),
                        fontSize: 20,
                        fontFamily: 'Hubballi',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(widget.datum),
              ],
            ),
            SizedBox(
              width: 90,
              height: 30,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 127, 209, 174),
                    borderRadius: BorderRadius.circular(3)),
                child: Center(
                  child: Text(
                    widget.status,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 249, 249, 249),
                        fontSize: 19,
                        fontFamily: 'Hubballi',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
