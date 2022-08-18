import 'package:dynamic_not/consts/constants.dart';
import 'package:flutter/material.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;
  const OrtalamaGoster({
    Key? key,
    required this.dersSayisi,
    required this.ortalama,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14.0, bottom: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            dersSayisi > 0 ? '$dersSayisi ders girildi' : 'Ders Seçiniz',
            style: Sabitler.dersSayisiStyle,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            ortalama >= 0 ? ortalama.toStringAsFixed(2) : '0.0',
            style: Sabitler.ortalamaStyle,
          ),
          const SizedBox(
            height: 5,
          ),
          Text('ortalama', style: Sabitler.dersSayisiStyle),
        ],
      ),
    );
  }
}
