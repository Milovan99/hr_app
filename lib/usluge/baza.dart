import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hr_app/komponente/kolega.dart';
import 'package:hr_app/komponente/radni_sati.dart';
import 'package:intl/intl.dart';

import '../komponente/korisnik.dart';

class BazaUsluga {
  final String? uid;
  BazaUsluga({this.uid});

  final CollectionReference korisniciCollection =
      FirebaseFirestore.instance.collection("korisnici");

  Future kreirajKorisnikaPrviPut() async {
    final doc = await korisniciCollection.doc(uid).get();
    var trenutnoVreme = DateTime.now();
    var formater = DateFormat('yyyy-MM-dd');

    String formatiraniDatum = formater.format(trenutnoVreme);
    if (!doc.exists) {
      return await korisniciCollection.doc(uid).set({
        'ime': '',
        'opis rada': '',
        'mesto': '',
        'email': '',
        'telefon': '',
        'tim': '',
        'datum zaposlenja': '',
        'slika': ''
      });
    }
    await korisniciCollection
        .doc(uid)
        .collection('zadaci')
        .get()
        .then((value) => {
              if (value.docs.isEmpty)
                {
                  korisniciCollection.doc(uid).collection('zadaci').add({
                    'dan': 1,
                    'duzina': 1,
                    'minute': 1,
                    'naziv': 'naziv',
                    'sati': 1
                  })
                }
            });

    await korisniciCollection
        .doc(uid)
        .collection('obavestenja')
        .get()
        .then((value) => {
              if (value.docs.isEmpty)
                {
                  korisniciCollection.doc(uid).collection('obavestenja').add({
                    'tip obavestenja': "",
                    'naslov': "",
                    'sadrzaj': "",
                    'vreme': '',
                  })
                }
            });

    await korisniciCollection
        .doc(uid)
        .collection('dogadjaji')
        .get()
        .then((value) => {
              if (value.docs.isEmpty)
                {
                  korisniciCollection.doc(uid).collection('dogadjaji').add({
                    'datum': "Feb 05",
                    'dan': "Uto",
                    'naziv dogadjaja': "Dan drzavnosti",
                    'opis': 'opis',
                  })
                }
            });

    await korisniciCollection
        .doc(uid)
        .collection('radni sati')
        .doc(formatiraniDatum.toString())
        .collection("aktivnosti")
        .get()
        .then((value) => {
              if (value.docs.isEmpty)
                {
                  korisniciCollection
                      .doc(uid)
                      .collection('radni sati')
                      .doc(formatiraniDatum.toString())
                      .set({
                    'pocetak rada': "--:--",
                    'kraj rada': "--:--",
                    'ukupno sati': "0",
                    'aktivnost': 'akrivnost',
                  })
                }
            });

    await korisniciCollection
        .doc(uid)
        .collection("odmor")
        .get()
        .then((value) => {
              if (value.docs.isEmpty)
                {
                  korisniciCollection.doc(uid).collection('odmor').add({
                    'neiskoristeno': 8,
                    'iskoristeno': 9,
                    'rezervisano': 0,
                    'ukupno': 17,
                  })
                }
            });
  }

  Future azurirajBazu(String ime, String opisRada, String mesto, String email,
      String telefon, String tim, String datumZaposlenja, String slika) async {
    return await korisniciCollection.doc(uid).set({
      'ime': ime,
      'opis rada': opisRada,
      'mesto': mesto,
      'email': email,
      'telefon': telefon,
      'tim': tim,
      'datum zaposlenja': datumZaposlenja,
      'slika': slika
    });
  }

  List<Kolega> _listaKolegaIzSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Kolega(
        id: doc.id,
        ime: doc['ime'] ?? '',
        odeljenje: doc['opis rada'] ?? '',
        mesto: doc['mesto'] ?? '',
        slika: doc['slika'] ?? '',
        datumZaposlenja: doc['datum zaposlenja'] ?? '',
        email: doc['email'] ?? '',
        telefon: doc['telefon'] ?? '',
        tim: doc['tim'] ?? '',
      );
    }).toList();
  }

  Stream<List<Kolega?>?> get korisnici {
    return korisniciCollection.snapshots().map(_listaKolegaIzSnapshot);
  }

  DetaljiKorisnika _detaljiKorisnika(DocumentSnapshot snapshot) {
    return DetaljiKorisnika(
        datumZaposlenja: snapshot['datum zaposlenja'] ?? '',
        email: snapshot['email'] ?? '',
        mesto: snapshot['mesto'],
        odeljenje: snapshot['opis rada'] ?? '',
        telefon: snapshot['telefon'] ?? '',
        tim: snapshot['tim'] ?? '',
        ime: snapshot['ime'] ?? '',
        uid: uid ?? '',
        slika: snapshot['slika'] ?? '');
  }

  Stream<DetaljiKorisnika> get detaljiKorisnika {
    return korisniciCollection.doc(uid).snapshots().map(_detaljiKorisnika);
  }

  RadniSati _radniSati(DocumentSnapshot snapshot) {
    return RadniSati(
        pocetakRada: snapshot['pocetak rada'] ?? '',
        aktivnost: snapshot['aktivnost'] ?? '',
        krajRada: snapshot['kraj rada'] ?? '',
        ukupnoSati: snapshot['ukupno sati'] ?? '');
  }

  Stream<RadniSati> get radniSati {
    DateTime now = DateTime.now();
    var formater = DateFormat('yyyy-MM-dd');
    String formatiraniDatum = formater.format(now);

    return korisniciCollection
        .doc(uid)
        .collection("radni sati")
        .doc(formatiraniDatum)
        .snapshots()
        .map(_radniSati);
  }
}
