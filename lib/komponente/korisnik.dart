class Korisnik {
  final String uid;

  Korisnik({required this.uid});
}

class DetaljiKorisnika {
  final String? uid;
  final String ime;
  final String slika;
  final String odeljenje;
  final String mesto;
  final String email;
  final String telefon;
  final String tim;
  final String datumZaposlenja;

  DetaljiKorisnika(
      {required this.uid,
      required this.ime,
      required this.slika,
      required this.odeljenje,
      required this.mesto,
      required this.email,
      required this.telefon,
      required this.tim,
      required this.datumZaposlenja});
}
