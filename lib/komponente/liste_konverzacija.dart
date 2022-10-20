import 'package:flutter/material.dart';
import 'package:hr_app/stranice/detelji_poruka.dart';

class ListaKonverzacija extends StatefulWidget {
  final String ime;
  final String tekstPoruke;
  final String profilnaUrl;
  //String vreme;
  // bool daLiJePorukaProcitana;
  final String primalacId;
  final String posiljalacId;

  const ListaKonverzacija({
    super.key,
    required this.ime,
    required this.tekstPoruke,
    required this.profilnaUrl,
    // required this.vreme,
    //required this.daLiJePorukaProcitana,
    required this.posiljalacId,
    required this.primalacId,
  });
  @override
  State<ListaKonverzacija> createState() => _ListaKonverzacijaState();
}

class _ListaKonverzacijaState extends State<ListaKonverzacija> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetaljiPoruka(
            profilnaurl: widget.profilnaUrl,
            ime: widget.ime,
            posiljalacId: widget.posiljalacId,
            primalacId: widget.primalacId,
          );
        }));
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    maxRadius: 30,
                    child: Image.asset(widget.profilnaUrl),
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
                            widget.ime,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.tekstPoruke,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                              //      fontWeight: widget.daLiJePorukaProcitana
                              //          ? FontWeight.bold
                              //          : FontWeight.normal
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /** Text(
              widget.vreme,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: widget.daLiJePorukaProcitana
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),*/
          ],
        ),
      ),
    );
  }
}
