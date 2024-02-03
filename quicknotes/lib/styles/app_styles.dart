import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgcolor = const Color.fromARGB(255, 20, 5, 61);
  static Color maincolor = Colors.black;
  static Color accentcolor = Colors.purple;

  static List<Color> cardscolors = [
    Colors.red.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.yellow.shade100,
    Colors.orange.shade100,
    Colors.purple.shade100,
    Colors.cyan.shade100,
    Colors.pink.shade100,
  ];
  static TextStyle mainTexts =
      GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle maincontent =
      GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.normal);
  static TextStyle datetitle =
      GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.normal);
}
