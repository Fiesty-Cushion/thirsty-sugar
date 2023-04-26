import 'package:flutter/material.dart';
import 'package:attendy/theme/pallete.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark().copyWith(
    dividerColor: HexColor('#F0F0F0'),
    cardColor: Colors.white,
    textTheme: GoogleFonts.poppinsTextTheme(),
    scaffoldBackgroundColor: Pallete.backgroundColor,
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      backgroundColor: Colors.black,
      elevation: 0,
    ),
  );
}
