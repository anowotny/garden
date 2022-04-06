import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garden/app/domain/entities/plant.dart';
import 'package:garden/app/presentation/bloc/plant/plant_bloc.dart';
import 'package:garden/app/presentation/screens/start.dart';
import 'package:garden/app/presentation/widgets/plant_form/choose_date_button.dart';
import 'package:garden/app/presentation/widgets/start/custom_textfield.dart';
import 'package:garden/app/presentation/widgets/plant_form/plant_type_dropdown.dart';
import 'package:garden/core/util/mock_json.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantForm extends StatefulWidget {
  const PlantForm({Key key, @required this.title, this.plant})
      : super(key: key);
  final String title;
  final Plant plant;

  @override
  State<PlantForm> createState() => _PlantFormState();
}

class _PlantFormState extends State<PlantForm> {
  final TextEditingController plantController = TextEditingController();
  int selectedTypeId;
  String currentValue;
  DateTime selectedDate;
  String plantName;
  @override
  void initState() {
    if (widget.plant != null) {
      selectedTypeId = widget.plant.typeId;
      selectedDate =
          DateTime.fromMillisecondsSinceEpoch(widget.plant.plantingDate);
      plantName = widget.plant.name;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: BlocConsumer<PlantBloc, PlantState>(
        listener: (context, state) {
          if (state is PlantAddedSuccessfully) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => StartScreen()),
                (route) => false);
          }
        },
        builder: (context, state) {
          if (state is PlantLoading || state is PlantInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PlantLoadFailure) {
            return Center(
                child: Column(children: [
              Text(
                state.error,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              RaisedButton(child: Text('Try again'), onPressed: () {})
            ]));
          } else if (state is PlantLoadSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    widget.title,
                    style: GoogleFonts.paytoneOne(
                        color: Colors.white, fontSize: 40),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextfield(
                  controller: plantController,
                  plantName: plantName,
                ),
                PlantTypeDropdown(
                  selectedTypeId: selectedTypeId,
                  plantTypes: state.plantTypes,
                  onChanged: (value) {
                    selectedTypeId = value;
                  },
                ),
                ChooseDateButton(
                  pickedDate: selectedDate,
                  onChanged: (value) {
                    selectedDate = value;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                RaisedButton(
                    child: Text('Save'.toUpperCase()),
                    onPressed: () {
                      _onSavePressed();
                    })
              ],
            );
          } else if (state is PlantAddedSuccessfully) {
            return Center(
              child: Column(
                children: [
                  Text('Saving changes',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  CircularProgressIndicator(),
                ],
              ),
            );
          } else
            return Container(
              child: Text(state.toString()),
            );
        },
      )),
    );
  }

  _onSavePressed() {
    if (widget.title.toLowerCase().contains('add')) {
      BlocProvider.of<PlantBloc>(context).add(SaveNewPlantPressed(Plant(
          name: plantController.text,
          plantingDate: selectedDate.millisecondsSinceEpoch,
          typeId: selectedTypeId)));
    } else if (widget.title.toLowerCase().contains('update')) {
      BlocProvider.of<PlantBloc>(context).add(SaveUpdatedPlantPressed(Plant(
          plantId: widget.plant.plantId,
          name: plantController.text,
          plantingDate: selectedDate.millisecondsSinceEpoch,
          typeId: selectedTypeId)));
    }
  }
}
