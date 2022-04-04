import 'package:flutter/material.dart';
import 'package:garden/app/presentation/widgets/plant_form/choose_date_button.dart';
import 'package:garden/app/presentation/widgets/start/custom_textfield.dart';
import 'package:garden/app/presentation/widgets/plant_form/plant_type_dropdown.dart';
import 'package:garden/core/util/mock_json.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantForm extends StatefulWidget {
  const PlantForm({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  State<PlantForm> createState() => _PlantFormState();
}

class _PlantFormState extends State<PlantForm> {
  final TextEditingController plantController = TextEditingController();
  String currentValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                widget.title,
                style:
                    GoogleFonts.paytoneOne(color: Colors.white, fontSize: 40),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextfield(controller: plantController),
            PlantTypeDropdown(),
            ChooseDateButton()
          ],
        ),
      )),
    );
  }
}
