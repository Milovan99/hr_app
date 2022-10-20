import 'package:flutter/material.dart';
import 'package:hr_app/komponente/ucitavanje.dart';

import 'package:hr_app/usluge/auth.dart';

class Prijava extends StatefulWidget {
  const Prijava({super.key});

  @override
  State<Prijava> createState() => _PrijavaState();
}

class _PrijavaState extends State<Prijava> {
  final AuthUsluga _auth = AuthUsluga();
  bool ucitavanje = false;

  String email = '';
  String password = '';
  String error = '';
  final _formKljuc = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ucitavanje
        ? const Ucitavanje()
        : Scaffold(
            backgroundColor: const Color.fromARGB(255, 230, 235, 224),
            appBar: AppBar(
              elevation: 0.8,
              backgroundColor: const Color.fromARGB(255, 155, 193, 188),
              title: const Text(
                "Ofis",
                style: TextStyle(
                    color: Color.fromARGB(255, 93, 87, 107),
                    fontSize: 16,
                    fontFamily: 'IndieFlower'),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Form(
                key: _formKljuc,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "DOBRO DOŠLI U Ofis",
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: ((value) =>
                          value!.isEmpty ? "Unesite email" : null),
                      onChanged: (value) => {setState((() => email = value))},
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontFamily: 'Hubballi',
                            fontSize: 18.5),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.grey.shade600,
                          size: 20,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        contentPadding: const EdgeInsets.all(8),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.grey.shade100)),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      validator: ((value) => value!.length < 6
                          ? "Sifra treba da ima 6+ karaktera"
                          : null),
                      onChanged: (value) =>
                          {setState((() => password = value))},
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: "Sifra",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontFamily: 'Hubballi',
                            fontSize: 18.5),
                        prefixIcon: Icon(
                          Icons.password,
                          color: Colors.grey.shade600,
                          size: 20,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        contentPadding: const EdgeInsets.all(8),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.grey.shade100)),
                      ),
                    ),
                    const SizedBox(height: 15),
                    FloatingActionButton.extended(
                        elevation: 0,
                        label: const Text(
                          'Prijavi se',
                          style: TextStyle(
                            fontFamily: 'Hubballi',
                            fontSize: 17,
                            color: Color.fromARGB(255, 93, 87, 107),
                          ),
                        ), // <-- Text
                        backgroundColor:
                            const Color.fromARGB(255, 248, 248, 248),
                        icon: const Icon(
                          Icons.login,
                          size: 17.0,
                          color: Color.fromARGB(255, 93, 87, 107),
                        ),
                        onPressed: () async {
                          if (_formKljuc.currentState!.validate()) {
                            setState(() => ucitavanje = true);

                            dynamic rezultat = await _auth.prijavaAuth(
                                email: email, password: password);

                            if (rezultat == null) {
                              setState(() => ucitavanje = false);
                              setState(() => error =
                                  "Neuspeno prijavljivanje , unesite druge podatke");
                            }
                          }
                        }),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      error,
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
