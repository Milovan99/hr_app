import 'package:flutter/material.dart';
import 'package:hr_app/komponente/kolega.dart';
import 'package:hr_app/stranice/profil.dart';
import 'package:provider/provider.dart';

class ListaKontakata extends StatefulWidget {
  final String pretrazivanje;
  const ListaKontakata({super.key, required this.pretrazivanje});

  @override
  State<ListaKontakata> createState() => _ListaKontakataState();
}

class _ListaKontakataState extends State<ListaKontakata> {
  @override
  Widget build(BuildContext context) {
    final korisnici = Provider.of<List<Kolega?>?>(context);

    return SingleChildScrollView(
      child: ListView.builder(
        itemCount: korisnici?.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 5),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          if (widget.pretrazivanje.isEmpty) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Profil(
                    id: korisnici[index]!.id,
                    uloga: 'Kolega',
                    ime: korisnici[index]!.ime,
                    slika: korisnici[index]!.slika,
                    datumZaposlenja: korisnici[index]!.datumZaposlenja,
                    email: korisnici[index]!.email,
                    mesto: korisnici[index]!.mesto,
                    odeljenje: korisnici[index]!.odeljenje,
                    telefon: korisnici[index]!.telefon,
                    tim: korisnici[index]!.tim,
                  );
                }));
              },
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 10, bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              maxRadius: 30,
                              child: Image.asset(korisnici![index]!.slika),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.transparent,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      korisnici[index]!.ime,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Hubballi',
                                          color:
                                              Color.fromARGB(255, 93, 87, 107)),
                                    ),
                                    Text(
                                      "${korisnici[index]!.odeljenje},${korisnici[index]!.mesto}",
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Hubballi',
                                        color: Color.fromARGB(255, 93, 87, 107),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 2,
                  thickness: 1,
                  color: Color.fromARGB(255, 248, 248, 248),
                ),
              ]),
            );
          }
          if (korisnici![index]!.ime.contains(widget.pretrazivanje) ||
              korisnici[index]!.odeljenje.startsWith(widget.pretrazivanje) ||
              korisnici[index]!.mesto.startsWith(widget.pretrazivanje)) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Profil(
                    id: korisnici[index]!.id,
                    uloga: 'Kolega',
                    ime: korisnici[index]!.ime,
                    slika: korisnici[index]!.slika,
                    datumZaposlenja: korisnici[index]!.datumZaposlenja,
                    email: korisnici[index]!.email,
                    mesto: korisnici[index]!.mesto,
                    odeljenje: korisnici[index]!.odeljenje,
                    telefon: korisnici[index]!.telefon,
                    tim: korisnici[index]!.tim,
                  );
                }));
              },
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 10, bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              maxRadius: 30,
                              child: Image.asset(korisnici[index]!.slika),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.transparent,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      korisnici[index]!.ime,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Hubballi',
                                          color:
                                              Color.fromARGB(255, 93, 87, 107)),
                                    ),
                                    Text(
                                      "${korisnici[index]!.odeljenje},${korisnici[index]!.mesto}",
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Hubballi',
                                        color: Color.fromARGB(255, 93, 87, 107),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 2,
                  thickness: 1,
                  color: Color.fromARGB(255, 248, 248, 248),
                ),
              ]),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
