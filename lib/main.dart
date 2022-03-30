import 'package:flutter/material.dart';
import 'package:garden/app/presentation/screens/start.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.lightGreen,
          appBarTheme: AppBarTheme(elevation: 0),
          primaryColor: Colors.lightGreen,
          accentColor: Colors.white,
          buttonTheme: ButtonThemeData(
            splashColor: Colors.lightGreen,
            buttonColor: Colors.lightGreen,
            shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(18.0),
                    ),
            textTheme: ButtonTextTheme.accent
          ),
          primaryTextTheme: TextTheme( 
              subtitle2: GoogleFonts.roboto(),
              button: GoogleFonts.roboto(),
              headline5: GoogleFonts.roboto(),
              headline6: GoogleFonts.roboto(),
              
            ),
          // primarySwatch: Colors.lightGreen,
          // visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
      home: StartScreen(),
    );
  }
}
