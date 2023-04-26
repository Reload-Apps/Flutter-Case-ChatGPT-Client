import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

final ThemeData _lightTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xffF6F8FA),
  fontFamily: GoogleFonts.quicksand().fontFamily,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xffF6F8FA),
    elevation: 0,
    iconTheme: IconThemeData(
      color: textPrimaryLight,
    ),
  ),
);

ThemeData getLightTheme() => _lightTheme;
