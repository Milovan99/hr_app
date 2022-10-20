import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hr_app/komponente/liste_konverzacija.dart';
import 'package:hr_app/komponente/ucitavanje.dart';
import 'package:provider/provider.dart';

import '../komponente/korisnik.dart';

class Poruka extends StatefulWidget {
  const Poruka({super.key});

  @override
  State<Poruka> createState() => _PorukaState();
}

class PorukeKorisnika {
  String ime;
  String tekstPoruke;
  String profilnaUrl;
  String vreme;
  String primalacId;
  PorukeKorisnika(
      {required this.ime,
      required this.tekstPoruke,
      required this.profilnaUrl,
      required this.vreme,
      required this.primalacId});
}

class _PorukaState extends State<Poruka> {
  String pretrazivanje = "";
  @override
  Widget build(BuildContext context) {
    final korisnik = Provider.of<Korisnik?>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 235, 224),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    "Poruke",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                onChanged: ((value) {
                  setState(() {
                    pretrazivanje = value;
                  });
                }),
                decoration: InputDecoration(
                  hintText: "Ime...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
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
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("korisnici")
                    .doc(korisnik!.uid)
                    .collection("poruke")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text("Nema poruka"),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 16),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var kolegaId = snapshot.data!.docs[index].id;
                        var poslednjaPoruka =
                            snapshot.data!.docs[index]['poslednja poruke'];
                        return Column(
                          children: [
                            FutureBuilder(
                              future: FirebaseFirestore.instance
                                  .collection("korisnici")
                                  .doc(kolegaId)
                                  .get(),
                              builder: (context, asyncSnapshot) {
                                if (asyncSnapshot.hasData) {
                                  var kolega = asyncSnapshot.data;

                                  if (kolega!['ime']
                                      .toString()
                                      .contains(pretrazivanje)) {
                                    return ListaKonverzacija(
                                        posiljalacId: korisnik.uid,
                                        primalacId: kolegaId,
                                        ime: kolega['ime'],
                                        tekstPoruke: poslednjaPoruka,
                                        profilnaUrl: kolega['slika']
                                        //vreme: chatUsers[index].vreme,
                                        //  daLiJePorukaProcitana:
                                        //  (index == 0 || index == 3)
                                        //     ? true
                                        //      : false,
                                        );
                                  } else {
                                    return Container();
                                  }
                                } else {
                                  return const Ucitavanje();
                                }
                              },
                            ),
                            const Divider(
                              height: 2,
                              thickness: 1,
                              color: Color.fromARGB(255, 248, 248, 248),
                            )
                          ],
                        );
                      },
                    );
                  } else {
                    return const Ucitavanje();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
