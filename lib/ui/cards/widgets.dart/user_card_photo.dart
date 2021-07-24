import 'package:flutter/material.dart';

class CardPhoto extends StatelessWidget {
  const CardPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17),
      child: Container(
        width: 250,
        decoration: buildBoxDecoration(),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      );
}
