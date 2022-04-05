import 'package:flutter/material.dart';

import '../../../domain/entities/plant_type.dart';

typedef OnChangeCallback = void Function(dynamic value);

class PlantTypeDropdown extends StatefulWidget {
  final List<PlantType> plantTypes;
  int selectedTypeId;
  final OnChangeCallback onChanged;
  PlantTypeDropdown(
      {Key key,
      @required this.plantTypes,
      @required this.selectedTypeId,
      @required this.onChanged})
      : super(key: key);

  @override
  _PlantTypeDropdownState createState() => _PlantTypeDropdownState();
}

class _PlantTypeDropdownState extends State<PlantTypeDropdown> {
  int currentValue;
  @override
  void initState() {
    if (widget.selectedTypeId != null) {
      currentValue = widget.selectedTypeId;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      // padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: DropdownButtonFormField(
          value: currentValue,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 10.0),
            labelText: 'Plant type',
            // labelStyle: TextStyle(color: Colors.white),
          ),
          items: widget.plantTypes.map((pType) {
            return DropdownMenuItem(
              value: pType.id,
              child: Text(
                pType.name,
              ),
            );
          }).toList(),
          onChanged: (int value) {
            setState(() {
              currentValue = value;
              widget.selectedTypeId = currentValue;
              widget.onChanged(value);
            });
          }),
    );
  }
}
