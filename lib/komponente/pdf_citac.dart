import 'package:flutter/material.dart';

import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfCitac extends StatefulWidget {
  final String url;
  final String naslov;
  const PdfCitac({super.key, required this.url, required this.naslov});

  @override
  State<PdfCitac> createState() => _PdfCitacState();
}

class _PdfCitacState extends State<PdfCitac> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.naslov), //appbar title
            backgroundColor: Colors.redAccent //appbar background color
            ),
        body: Container(
            child: const PDF().cachedFromUrl(
          widget.url,
          maxAgeCacheObject: const Duration(days: 30), //duration of cache
          placeholder: (progress) => Center(child: Text('$progress %')),
          errorWidget: (error) => Center(child: Text(error.toString())),
        )));
  }
}
