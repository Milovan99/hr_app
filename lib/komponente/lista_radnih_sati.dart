import 'package:flutter/material.dart';

class ListaRadnihSati extends StatefulWidget {
  final String datum;
  final String aktivnost;
  final String ukupno;
  const ListaRadnihSati(
      {super.key,
      required this.aktivnost,
      required this.datum,
      required this.ukupno});

  @override
  State<ListaRadnihSati> createState() => _ListaRadnihSatiState();
}

class _ListaRadnihSatiState extends State<ListaRadnihSati> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 25,
          width: 90,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 249, 249, 249),
            borderRadius: BorderRadius.all(
              Radius.circular(7),
            ),
          ),
          child: Center(
            child: Text(
              widget.datum,
              style: const TextStyle(
                  color: Color.fromARGB(255, 107, 150, 176),
                  fontSize: 17,
                  fontFamily: 'Hubballi'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.aktivnost,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 107, 150, 176)),
                      ),
                    ],
                  ),
                  Text(widget.ukupno),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
