import 'package:flutter/material.dart';
import 'package:garden/app/data/models/plant_model.dart';
import 'package:garden/app/presentation/screens/plant_form.dart';
import 'package:garden/core/util/mock_json.dart';
import 'package:google_fonts/google_fonts.dart';

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
        child: SingleChildScrollView(
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
                            labelStyle: GoogleFonts.roboto(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                        cursorColor: Colors.white,
                        style: GoogleFonts.roboto(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: Colors.white)),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Scrollbar(
                                          child: ListView.builder(
                          itemCount: mockPlants == null ? 0 : mockPlants.length,
                          itemBuilder: (context, index) {
                            final plant=PlantModel.fromJson(mockPlants[index]);
                            return ListTile(
                              title: Text(plant.name, style: TextStyle(fontWeight: FontWeight.bold),),
                              leading: Text(plant.name[0]+plant.name[plant.name.length-1]),
                              isThreeLine: true,
                              subtitle: Text('${plant.type.toUpperCase()}\n${plant.plantingDate}'),
                            );
                          }),
                    ),
                  ),
                  SizedBox(height: 30),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlantForm()));
                    },
                    elevation: 0,
                    child: Text(
                      'Add plant'.toUpperCase(),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
