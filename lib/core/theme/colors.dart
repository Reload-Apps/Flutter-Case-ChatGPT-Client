import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class MainColors {
  static const Color mainGreen = Color(0xFFB6FBFF);
  static const Color mainBlack = Color(0xFF000000);
  static const Color mainYellow = Color(0xFFFFFFBB);
  static const Color mainPurple = Color(0xFFC8B6FF);
}

const Color bgPrimaryDark = Color(0xFF000000);
const Color bgSecondaryDark = Color(0xff1F1E25);
const Color textPrimaryDark = Color(0xffFFFFFF);
const Color textSecondaryDark = Color(0xffBDBDBD);
const Color chatBubbleDark = Color(0xff1A1A1A);

const Color bgPrimaryLight = Color(0xffF6F8FA);
const Color bgSecondaryLight = Color(0xffFFFFFF);
const Color textPrimaryLight = Color(0xff0D1012);
const Color textSecondaryLight = Color(0xFFB6B3B3);
const Color chatBubbleLight = Color(0xffE5E5E5);

ThemeProvider themeProvider(BuildContext context) => Provider.of<ThemeProvider>(context, listen: true);

Color textPrimary(BuildContext context) => themeProvider(context).isDark() ? textPrimaryDark : textPrimaryLight;

Color textSecondary(BuildContext context) => themeProvider(context).isDark() ? textSecondaryDark : textSecondaryLight;

Color bgPrimary(BuildContext context) => themeProvider(context).isDark() ? bgPrimaryDark : bgPrimaryLight;

Color bgSecondary(BuildContext context) => themeProvider(context).isDark() ? bgSecondaryDark : bgSecondaryLight;

Color chatBubble(BuildContext context) => themeProvider(context).isDark() ? chatBubbleDark : chatBubbleLight;
