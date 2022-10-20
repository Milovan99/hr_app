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
      body: FutureBuilder<ListResult>(
          future: futureFiles,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final files = snapshot.data!.items;

              return ListView.builder(
                itemCount: files.length,
                itemBuilder: (context, index) {
                  final file = files[index];

                  return ListTile(
                    title: Text(file.name),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.open_in_new,
                        color: Colors.black,
                      ),
                      onPressed: () => downloadFile(file),
                    ),
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
