import 'package:flutter/material.dart';
import 'package:hr_app/komponente/kolega.dart';
import 'package:hr_app/komponente/lista_kontakata.dart';
import 'package:hr_app/usluge/baza.dart';
import 'package:provider/provider.dart';

class Imenik extends StatefulWidget {
  const Imenik({super.key});

  @override
  State<Imenik> createState() => _ImenikState();
}

class _ImenikState extends State<Imenik> {
  String pretrazivanje = "";
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Kolega?>?>.value(
      value: BazaUsluga().korisnici,
      initialData: const [],
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              textAlign: TextAlign.center,
              "Kolege",
              style: TextStyle(
                  color: Color.fromARGB(255, 93, 87, 107),
                  fontFamily: 'Hubballi',
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  pretrazivanje = val;
                });
              },
              decoration: InputDecoration(
                hintText: "Ime,odjeljenje,mjesto ...",
                hintStyle: TextStyle(
                    color: Colors.grey.shade600,
                    fontFamily: 'Hubballi',
                    fontSize: 18.5),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade600,
                  size: 20,
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.all(8),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey.shade100)),
              ),
            ),
          ),
          const SizedBox(height: 25),
          ListaKontakata(pretrazivanje: pretrazivanje)
        ],
      ),
    );
  }
}
