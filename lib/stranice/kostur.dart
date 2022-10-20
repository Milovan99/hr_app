import 'package:hr_app/komponente/ucitavanje.dart';
import 'package:hr_app/stranice/Obavestenja.dart';
import 'package:hr_app/stranice/planiranje_aktivnosti.dart';
import 'package:hr_app/stranice/pocetna.dart';
import 'package:hr_app/stranice/poruke.dart';
import 'package:flutter/material.dart';
import 'package:hr_app/stranice/profil.dart';
import 'package:provider/provider.dart';
import '../komponente/korisnik.dart';
import '../usluge/baza.dart';
import 'imenik.dart';

class Kostur extends StatefulWidget {
  const Kostur({super.key});

  @override
  State<Kostur> createState() => _KosturState();
}

class _KosturState extends State<Kostur> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Pocetna(),
    const Imenik(),
    const Poruka(),
    const PlaniranjeAkrivnosti()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final korisnik = Provider.of<Korisnik?>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 235, 224),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.8,
        backgroundColor: const Color.fromARGB(255, 155, 193, 188),
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: const Color.fromARGB(255, 248, 248, 248),
                child: IconButton(
                  icon: const Icon(Icons.notifications),
                  color: const Color.fromARGB(255, 93, 87, 107),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Obavestenja()),
                    );
                  },
                ),
              ),
              const Text(
                "Naziv aplikacije",
                style: TextStyle(
                    color: Color.fromARGB(255, 93, 87, 107),
                    fontSize: 16,
                    fontFamily: 'IndieFlower'),
              ),
              StreamBuilder<DetaljiKorisnika>(
                  stream: BazaUsluga(uid: korisnik!.uid).detaljiKorisnika,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      DetaljiKorisnika? detaljiKorisnika = snapshot.data;
                      return CircleAvatar(
                        maxRadius: 22,
                        backgroundColor:
                            const Color.fromARGB(255, 248, 248, 248),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profil(
                                        id: korisnik.uid,
                                        uloga: 'Korisnik',
                                        ime: detaljiKorisnika.ime,
                                        slika: detaljiKorisnika.slika,
                                        datumZaposlenja:
                                            detaljiKorisnika.datumZaposlenja,
                                        email: detaljiKorisnika.email,
                                        mesto: detaljiKorisnika.mesto,
                                        odeljenje: detaljiKorisnika.odeljenje,
                                        telefon: detaljiKorisnika.telefon,
                                        tim: detaljiKorisnika.tim,
                                      )),
                            );
                          },
                          child: Image.asset(detaljiKorisnika!.slika,
                              width: 44, height: 44),
                        ),
                      );
                    } else {
                      return const Ucitavanje();
                    }
                  }),
            ],
          ),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: CircleAvatar(
                radius: 17,
                backgroundColor: Color.fromARGB(255, 242, 252, 236),
                child: Icon(
                  Icons.home,
                  color: Color.fromARGB(255, 122, 160, 179),
                )),
            icon: Icon(
              Icons.home,
              color: Color.fromARGB(255, 93, 87, 107),
            ),
            label: 'Početna',
            backgroundColor: Color.fromARGB(255, 235, 232, 219),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              color: Color.fromARGB(255, 93, 87, 107),
            ),
            activeIcon: CircleAvatar(
                radius: 17,
                backgroundColor: Color.fromARGB(255, 242, 252, 236),
                child: Icon(
                  Icons.people,
                  color: Color.fromARGB(255, 122, 160, 179),
                )),
            label: 'Imenik',
            backgroundColor: Color.fromARGB(255, 235, 232, 219),
          ),
          BottomNavigationBarItem(
            activeIcon: CircleAvatar(
                radius: 17,
                backgroundColor: Color.fromARGB(255, 242, 252, 236),
                child: Icon(
                  size: 20,
                  Icons.markunread_rounded,
                  color: Color.fromARGB(255, 122, 160, 179),
                )),
            icon: Icon(
              Icons.markunread_rounded,
              size: 20,
              color: Color.fromARGB(255, 93, 87, 107),
            ),
            label: 'Poruke',
            backgroundColor: Color.fromARGB(255, 235, 232, 219),
          ),
          BottomNavigationBarItem(
            activeIcon: CircleAvatar(
                radius: 17,
                backgroundColor: Color.fromARGB(255, 242, 252, 236),
                child: Icon(
                  size: 20,
                  Icons.assignment,
                  color: Color.fromARGB(255, 122, 160, 179),
                )),
            icon: Icon(
              size: 20,
              Icons.assignment,
              color: Color.fromARGB(255, 93, 87, 107),
            ),
            label: 'Aktivnosti',
            backgroundColor: Color.fromARGB(255, 235, 232, 219),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 107, 150, 176),
        onTap: _onItemTapped,
      ),
    );
  }
}
