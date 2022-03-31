import 'package:flutter/material.dart';
import 'package:garden/core/util/mock_json.dart';

class PlantTypeDropdown extends StatefulWidget {
  const PlantTypeDropdown({
    Key key,
  }) : super(key: key);

  @override
  _PlantTypeDropdownState createState() => _PlantTypeDropdownState();
}

class _PlantTypeDropdownState extends State<PlantTypeDropdown> {
  String currentValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      // padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: DropdownButtonFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 10.0),
            labelText: 'Plant type',
            // labelStyle: TextStyle(color: Colors.white),
          ),
          items: mockPlantTypes.map((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              currentValue = value;
            });
          }),
    );
  }
}
