import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hr_app/komponente/ucitavanje.dart';
import 'package:hr_app/stranice/detelji_poruka.dart';
import 'package:hr_app/stranice/kalendar.dart';
import 'package:hr_app/stranice/odmor.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'korisnik.dart';

class ListaObavestenja extends StatefulWidget {
  final String tipObavestenja;
  final String naslov;
  final String sadrzaj;
  final Timestamp vreme;

  const ListaObavestenja({
    super.key,
    required this.tipObavestenja,
    required this.naslov,
    required this.sadrzaj,
    required this.vreme,
  });

  @override
  State<ListaObavestenja> createState() => _ListaObavestenjaState();
}

class _ListaObavestenjaState extends State<ListaObavestenja> {
  @override
  Widget build(BuildContext context) {
    String ime = '';
    String profilnaSlika = '';
    String slika = "";
    final korisnik = Provider.of<Korisnik?>(context);
    DateTime dt = widget.vreme.toDate();
    String vreme = DateFormat.Hm().format(dt);

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          if (widget.tipObavestenja == "poruka") {
            return DetaljiPoruka(
                profilnaurl: profilnaSlika,
                ime: ime,
                posiljalacId: korisnik!.uid,
                primalacId: widget.naslov);
          } else if (widget.tipObavestenja == "odmor") {
            return const Odmor();
          } else {
            return const Kalendar();
          }
        }));
      },
      child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("korisnici").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              for (var i = 0; i < snapshot.data!.docs.length; i++) {
                if (snapshot.data!.docs[i].id == widget.naslov) {
                  ime = snapshot.data!.docs[i]['ime'].toString();
                  profilnaSlika = snapshot.data!.docs[i]['slika'].toString();
                }
              }
            } else {
              return const Ucitavanje();
            }
            String naslov =
                widget.tipObavestenja == 'poruka' ? ime : widget.naslov;
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 249, 249, 249),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    tooltip: (() {
                      if (widget.tipObavestenja == "odmor") {
                        return slika = "lib/assets/Ikonice/suncobran1.png";
                      } else if (widget.tipObavestenja == "poruka") {
                        return slika = "lib/assets/Ikonice/poruka.png";
                      } else {
                        return slika = "lib/assets/icon_calendar.png";
                      }
                    }()),
                    icon: Image.asset(slika, width: 28, height: 30),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 40,
                    width: 152,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(naslov.length > 16
                            ? naslov.substring(0, 16)
                            : naslov),
                        Text(
                          widget.sadrzaj.length > 18
                              ? '${widget.sadrzaj.substring(0, 18)}...'
                              : widget.sadrzaj,
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 50, child: Center(child: Text(vreme)))
                ],
              ),
            );
          }),
    );
  }
}
