import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garden/app/data/datasources/dao/plant_types_dao.dart';
import 'package:garden/app/data/datasources/database.dart';
import 'package:garden/app/data/models/plant_model.dart';
import 'package:garden/app/domain/entities/plant_type.dart';
import 'package:garden/app/presentation/bloc/plant/plant_bloc.dart';
import 'package:garden/app/presentation/screens/plant_form.dart';
import 'package:garden/app/presentation/widgets/start/plant_list.dart';
import 'package:garden/core/util/mock_json.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  PlantTypeDao plantTypeDao;
  @override
  void initState() {
    super.initState();
    initDatabase();
  }

  Future<void> initDatabase() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('my_database.db').build();
    plantTypeDao = database.plantTypeDao;
    // Get all data when start app.
    // if (plantTypeDao != null) {
    //   setState(() {
    //     isLoading = true;
    //   });
    //   list = await getAllData();
    //   setState(() {
    //     isLoading = false;
    //   });
    // } else {
    //   setState(() {
    //     isLoading = false;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocConsumer<PlantBloc, PlantState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            print(state.toString());
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
                        // Row(
                        //   children: [
                        //     RaisedButton(
                        //       onPressed: () async {
                        //         // final PlantType pt =
                        //         //     PlantType(id: null, name: 'alpines');
                        //         // await plantTypeDao.insertPlantType(pt);
                        //       },
                        //       elevation: 0,
                        //       child: Text(
                        //         'Add types'.toUpperCase(),
                        //       ),
                        //     ),
                        //     RaisedButton(
                        //       onPressed: () async {
                        //         // List<PlantType> types =
                        //         //     await plantTypeDao.getAllPlantTypes();
                        //         // if (types.isNotEmpty) {
                        //         //   types.forEach((element) {
                        //         //     print(
                        //         //         'id ${element.id} name ${element.name}');
                        //         //   });
                        //         // } else
                        //         //   print('no elements');
                        //       },
                        //       elevation: 0,
                        //       child: Text(
                        //         'get types'.toUpperCase(),
                        //       ),
                        //     ),
                        //     RaisedButton(
                        //       onPressed: () async {
                        //         final PlantType pt =
                        //             PlantType(id: 18, name: 'trees');
                        //        final vari= await plantTypeDao.deletePlantType(pt);
                        //        print(vari);
                        //       },
                        //       elevation: 0,
                        //       child: Text(
                        //         'delete types'.toUpperCase(),
                        //       ),
                        //     ),
                        //   ],
                        // ),
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
