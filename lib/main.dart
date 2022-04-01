import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/presentation/bloc/plant/plant_bloc.dart';
import 'app/presentation/screens/start.dart';
import 'core/injection/injection.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection('dev');
  runApp(MultiBlocProvider(
    providers:[
      BlocProvider(create: (_)=>PlantBloc(getIt())..add(AppStarted()))
    ],
    child: MyApp(),
  ));
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
            textTheme: ButtonTextTheme.accent),
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
