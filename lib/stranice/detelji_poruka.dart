import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:hr_app/komponente/ucitavanje.dart';
import 'package:provider/provider.dart';

import '../komponente/korisnik.dart';

class DetaljiPoruka extends StatefulWidget {
  final String ime;
  final String primalacId;
  final String posiljalacId;
  final String profilnaurl;
  const DetaljiPoruka(
      {super.key,
      required this.ime,
      required this.posiljalacId,
      required this.primalacId,
      required this.profilnaurl});

  @override
  State<DetaljiPoruka> createState() => _DetaljiPorukaState();
}

class _DetaljiPorukaState extends State<DetaljiPoruka> {
  @override
  Widget build(BuildContext context) {
    final korisnik = Provider.of<Korisnik?>(context);
    TextEditingController textControler = TextEditingController();
    posaljiPoruku() {
      return Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
          height: 60,
          width: double.infinity,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: TextField(
                  controller: textControler,
                  decoration: const InputDecoration(
                      hintText: "Write message...",
                      hintStyle: TextStyle(color: Colors.black54),
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              FloatingActionButton(
                onPressed: () async {
                  String poruke = textControler.text;
                  textControler.clear();
                  await FirebaseFirestore.instance
                      .collection("korisnici")
                      .doc(widget.posiljalacId)
                      .collection("poruke")
                      .doc(widget.primalacId)
                      .collection("čet")
                      .add({
                    "posiljalacId": widget.posiljalacId,
                    "primalacId": widget.primalacId,
                    "poruka": poruke,
                    "vrsta poruke": "text",
                    "Datum": DateTime.now()
                  }).then((value) {
                    FirebaseFirestore.instance
                        .collection("korisnici")
                        .doc(widget.posiljalacId)
                        .collection("poruke")
                        .doc(widget.primalacId)
                        .set({"poslednja poruke": poruke});
                  });
                  await FirebaseFirestore.instance
                      .collection("korisnici")
                      .doc(widget.primalacId)
                      .collection("poruke")
                      .doc(widget.posiljalacId)
                      .collection("čet")
                      .add({
                    "posiljalacId": widget.posiljalacId,
                    "primalacId": widget.primalacId,
                    "poruka": poruke,
                    "vrsta poruke": "text",
                    "Datum": DateTime.now()
                  }).then((value) {
                    FirebaseFirestore.instance
                        .collection("korisnici")
                        .doc(widget.primalacId)
                        .collection("poruke")
                        .doc(widget.posiljalacId)
                        .set({"poslednja poruke": poruke});
                  });
                  await FirebaseFirestore.instance
                      .collection("korisnici")
                      .doc(widget.primalacId)
                      .collection("obavestenja")
                      .add({
                    "naslov": widget.posiljalacId,
                    "sadrzaj": poruke,
                    "tip obavestenja": "poruka",
                    "vreme": DateTime.now()
                  });
                },
                backgroundColor: Colors.blue,
                elevation: 0,
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  maxRadius: 20,
                  child: Image.asset(widget.profilnaurl),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.ime,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("korisnici")
              .doc(widget.posiljalacId)
              .collection("poruke")
              .doc(widget.primalacId)
              .collection("čet")
              .orderBy("Datum", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.docs.isEmpty) {
                return Stack(
                  children: [
                    const Center(child: Text("Pošaljite poruku kolegi")),
                    posaljiPoruku()
                  ],
                );
              } else {
                return Stack(
                  children: <Widget>[
                    ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      reverse: true,
                      padding: const EdgeInsets.only(top: 10, bottom: 50),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        bool daLiJeKorinik = snapshot.data!.docs[index]
                                ['posiljalacId'] ==
                            korisnik!.uid;
                        return Container(
                          padding: const EdgeInsets.only(
                              left: 14, right: 14, top: 10, bottom: 10),
                          child: Align(
                            alignment: (daLiJeKorinik == false
                                ? Alignment.topLeft
                                : Alignment.topRight),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (daLiJeKorinik == false
                                    ? Colors.grey.shade200
                                    : Colors.blue[200]),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                snapshot.data!.docs[index]["poruka"] ?? '',
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    posaljiPoruku()
                  ],
                );
              }
            } else {
              return const Ucitavanje();
            }
          }),
    );
  }
}
