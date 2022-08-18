import 'package:dynamic_not/consts/constants.dart';
import 'package:dynamic_not/model/ders.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<String> tumHarfler() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'CD', 'DD', 'FF'];
  }

  static double harfiNotaCevir(String harf) {
    switch (harf) {
      case 'AA':
        return 4.0;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3.0;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2.0;
      case 'CD':
        return 1.5;
      case 'DD':
        return 1.0;
      case 'FF':
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return tumHarfler()
        .map(
          (e) => DropdownMenuItem(
            child: Text(
              e,
              style: Sabitler.dropDownStyle,
            ),
            value: harfiNotaCevir(e),
          ),
        )
        .toList();
  }

  static List<int> krediler() {
    return List.generate(10, (index) => index + 1);
  }

  static List<DropdownMenuItem<int>> tumKrediler() {
    return krediler()
        .map((e) => DropdownMenuItem(
              child: Text('$e', style: Sabitler.dropDownStyle),
              value: e,
            ))
        .toList();
  }

  static List<Ders> tumEklenecekDersler = [];
  static dersEkle(Ders ders) {
    tumEklenecekDersler.add(ders);
  }

  static ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;
    // ignore: avoid_function_literals_in_foreach_calls
    tumEklenecekDersler.forEach(
      (element) {
        toplamNot = toplamNot + (element.krediDegeri * element.harfDegeri);
        toplamKredi += element.krediDegeri;
      },
    );
    return toplamNot / toplamKredi;
  }
}
