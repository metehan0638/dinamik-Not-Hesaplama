import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const MaterialColor mainColor = Colors.indigo;
  static const String baslikName = 'Ortalama Hesapla';
  static BorderRadius borderRadius = BorderRadius.circular(18);
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: mainColor,
  );
  static final TextStyle dersSayisiStyle = GoogleFonts.quicksand(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: mainColor,
  );
  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
    fontSize: 50,
    fontWeight: FontWeight.w700,
    color: mainColor,
  );
  static const EdgeInsets dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static final TextStyle dropDownStyle = GoogleFonts.quicksand(
      fontWeight: FontWeight.bold, fontSize: 18, color: mainColor);
}
