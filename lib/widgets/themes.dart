import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  static ThemeData get lightThemeData => ThemeData(
      primarySwatch: Colors.deepPurple,
      appBarTheme: const AppBarTheme(
          color: Color.fromARGB(83, 255, 255, 255),
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(color: Colors.black)),
          primaryColor: Colors.white,
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              color: Colors.black,
            )
          ),
          primaryColorDark: Colors.white,
         
          
      fontFamily: GoogleFonts.poppins().fontFamily);
  static ThemeData get darkThemeData => ThemeData(
     appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 46, 46, 46),
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(color: Colors.white)),
          primaryColor: const Color.fromARGB(255, 29, 29, 29),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              color: Colors.white,
            ), 
            titleSmall:TextStyle(color: Colors.white70),
            
          ), 
          hintColor: Colors.white54,
          cardColor: Color.fromARGB(255, 16, 16, 16),
          highlightColor: Color.fromARGB(255, 255, 254, 254),
          dividerColor: Colors.white54,
          brightness: Brightness.dark,
          splashColor: Colors.black54,
           primaryColorDark: Colors.black,

          
          
    );
}
