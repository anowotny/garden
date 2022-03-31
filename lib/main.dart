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
          scaffoldBackgroundColor: Colors.teal[400],
          appBarTheme: AppBarTheme(elevation: 0),
          primaryColor: Colors.teal[400],
          accentColor: Colors.white,
          buttonTheme: ButtonThemeData(
            splashColor: Colors.teal[400],
            buttonColor: Colors.teal[400],
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
