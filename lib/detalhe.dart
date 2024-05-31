import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'banda.dart';

class Detalhes extends StatelessWidget {
  const Detalhes({super.key, required this.banda});

  final Banda banda;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(banda.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: Image.network(
                banda.foto,
                width: 300.0,
                height: 300.0,
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(banda.insta),
            ),
          ],
        ),
      ),
    );
  }
}