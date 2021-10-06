import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
        fontSize: 14.0, fontWeight: FontWeight.w700, color: Colors.black),
    headline1: GoogleFonts.openSans(
        fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline2: GoogleFonts.openSans(
        fontSize: 21.0, fontWeight: FontWeight.w700, color: Colors.black),
    headline3: GoogleFonts.openSans(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
    headline6: GoogleFonts.openSans(
        fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.black),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
        fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.white),
    headline1: GoogleFonts.openSans(
        fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline2: GoogleFonts.openSans(
        fontSize: 21.0, fontWeight: FontWeight.w700, color: Colors.white),
    headline3: GoogleFonts.openSans(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
    headline6: GoogleFonts.openSans(
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
        titleTextStyle: GoogleFonts.openSans(
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
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.yellowAccent.shade700,
        selectionColor: Colors.yellowAccent.shade700,
        selectionHandleColor: Colors.yellowAccent.shade700,
      ),
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
          backgroundColor: Colors.grey[800],
          centerTitle: true,
          elevation: 1,
          actionsIconTheme: IconThemeData(
            color: Colors.yellow[700],
          ),
          titleTextStyle: GoogleFonts.openSans(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        brightness: Brightness.dark,
        primaryColor: Colors.yellow[700],
        colorScheme: ColorScheme.dark(
          surface: const Color(0xff3A3A3A),
          secondary: Colors.yellow.shade700,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.yellowAccent.shade700,
          selectionColor: Colors.yellowAccent.shade700,
          selectionHandleColor: Colors.yellowAccent.shade700,
        ),
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
