import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:hr_app/komponente/pdf_citac.dart';
import 'package:hr_app/komponente/ucitavanje.dart';

class Dokumenti extends StatefulWidget {
  const Dokumenti({Key? key}) : super(key: key);

  @override
  State<Dokumenti> createState() => _DokumentiState();
}

class _DokumentiState extends State<Dokumenti> {
  late Future<ListResult> futureFiles;

  @override
  void initState() {
    super.initState();
    futureFiles = FirebaseStorage.instance.ref('/fajlovi').listAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 235, 224),
      appBar: AppBar(
        elevation: 0.8,
        backgroundColor: const Color.fromARGB(255, 155, 193, 188),
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: const Color.fromARGB(255, 248, 248, 248),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: const Color.fromARGB(255, 93, 87, 107),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              const Text(
                "Naziv aplikacije",
                style: TextStyle(
                    color: Color.fromARGB(255, 93, 87, 107),
                    fontSize: 16,
                    fontFamily: 'IndieFlower'),
              ),
              const SizedBox(width: 44),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  "Dokumenti",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 300,
            child: FutureBuilder<ListResult>(
                future: futureFiles,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final files = snapshot.data!.items;

                    return ListView.builder(
                      itemCount: files.length,
                      itemBuilder: (context, index) {
                        final file = files[index];

                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              child: Container(
                                height: 70,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 249, 249, 249),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7),
                                  ),
                                ),
                                child: Center(
                                  child: ListTile(
                                    leading: Image.asset(
                                      'lib/assets/Ikonice/pdf.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                    title: Text(file.name),
                                    trailing: IconButton(
                                      icon: const Icon(
                                        Icons.open_in_new,
                                        color: const Color.fromARGB(
                                            255, 93, 87, 107),
                                      ),
                                      onPressed: () => downloadFile(file),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("Greska"),
                    );
                  } else {
                    return const Ucitavanje();
                  }
                }),
          ),
        ],
      ),
    );
  }

  Future downloadFile(Reference ref) async {
    final url = await ref.getDownloadURL();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PdfCitac(naslov: ref.name, url: url)));
  }
}
