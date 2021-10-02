import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.cairo(
        fontSize: 14.0, fontWeight: FontWeight.w700, color: Colors.black),
    headline1: GoogleFonts.cairo(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline2: GoogleFonts.cairo(
        fontSize: 21.0, fontWeight: FontWeight.w700, color: Colors.black),
    headline3: GoogleFonts.cairo(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
    headline6: GoogleFonts.cairo(
        fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.black),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.cairo(
        fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.white),
    headline1: GoogleFonts.cairo(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline2: GoogleFonts.cairo(
        fontSize: 21.0, fontWeight: FontWeight.w700, color: Colors.white),
    headline3: GoogleFonts.cairo(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
    headline6: GoogleFonts.cairo(
        fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
  );

  static ThemeData light() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        actionsIconTheme: IconThemeData(
          color: Colors.yellow[700],
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        titleTextStyle: GoogleFonts.cairo(
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      brightness: Brightness.light,
      primaryColor: Colors.yellow[700],
      backgroundColor: const Color(0xffF5F6F7),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.yellow[700]),
        ),
      ),
      textSelectionTheme:
          const TextSelectionThemeData(selectionColor: Colors.yellow),
      textTheme: lightTextTheme,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        splashColor: Colors.white12,
        backgroundColor: Colors.yellow[700],
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 1,
          actionsIconTheme: IconThemeData(
            color: Colors.yellow[700],
          ),
          titleTextStyle: GoogleFonts.cairo(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        brightness: Brightness.dark,
        primaryColor: Colors.yellow[700],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.yellow[700]),
          ),
        ),
        backgroundColor: const Color(0xff3A3A3A),
        textTheme: darkTextTheme,
        // colorScheme: ColorScheme.fromSwatch().copyWith(
        //   secondary: Colors.red[700],
        // ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.yellow[700],
        ));
  }
}
