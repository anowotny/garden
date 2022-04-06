import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/datasources/dao/plant_types_dao.dart';
import '../../data/datasources/database.dart';
import '../bloc/plant/plant_bloc.dart';
import '../widgets/start/plant_list.dart';
import 'plant_form.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocConsumer<PlantBloc, PlantState>(
          listener: (context, state) {
            if (state is PlantAddedSuccessfully) {
              Scaffold.of(context).showSnackBar(SnackBar(
                duration: Duration(seconds: 1),
                content: Text('Zaktualizowano pole ${state.plantName}'),
              ));
            }
          },
          builder: (context, state) {
            if (state is PlantLoadSuccess) {
              return SingleChildScrollView(
                child: Center(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 50),
                          child: Text(
                            'Garden',
                            style: GoogleFonts.paytoneOne(
                                color: Colors.white, fontSize: 60),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Theme(
                            data: ThemeData(primaryColor: Colors.white),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Search plant',
                                  labelStyle:
                                      GoogleFonts.roboto(color: Colors.white),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                              cursorColor: Colors.white,
                              style: GoogleFonts.roboto(color: Colors.white),
                              onChanged: (String value) {
                                BlocProvider.of<PlantBloc>(context)
                                    .add(PlantFiltered(value));
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        PlantsList(),
                        const SizedBox(height: 30),
                        RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PlantForm(
                                      title: "Add plant",
                                    )));
                          },
                          elevation: 0,
                          child: Text(
                            'Add plant'.toUpperCase(),
                          ),
                        ),
                      ]),
                ),
              );
            } else if (state is PlantLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PlantLoadFailure) {
              return Column(
                children: [
                  Text(state.error),
                  RaisedButton(
                    onPressed: () {},
                    child: Text('Try again'),
                  )
                ],
              );
            } else {
              return Text(state.toString());
            }
          },
        ),
      ),
    );
  }
}
