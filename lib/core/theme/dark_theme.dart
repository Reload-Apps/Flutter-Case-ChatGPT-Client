import 'package:chatgpt_flutter_case/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData _darkTheme = ThemeData(
    scaffoldBackgroundColor: MainColors.mainBlack,
    fontFamily: GoogleFonts.quicksand().fontFamily,
    appBarTheme: const AppBarTheme(
      backgroundColor: MainColors.mainBlack,
      elevation: 0,
      iconTheme: IconThemeData(
        color: textPrimaryDark,
      ),
    )
    // inputDecorationTheme: InputDecorationTheme(
    //   enabledBorder: OutlineInputBorder(
    //     borderSide: BorderSide(
    //       color: borderDark,
    //     ),
    //     borderRadius: BorderRadius.all(
    //       Radius.circular(18),
    //     ),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderSide: BorderSide(
    //       color: borderDark,
    //     ),
    //     borderRadius: BorderRadius.all(
    //       Radius.circular(18),
    //     ),
    //   ),
    //   contentPadding: EdgeInsets.all(15),
    //   hintStyle: TextStyle(fontSize: 14, color: textSecondaryDark),
    // ),
    );

ThemeData getDarkTheme() => _darkTheme;
