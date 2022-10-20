import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Ucitavanje extends StatelessWidget {
  const Ucitavanje({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 230, 235, 224),
      child: const Center(
          child: SpinKitChasingDots(
        color: Color.fromARGB(255, 155, 193, 188),
        size: 50,
      )),
    );
  }
}
