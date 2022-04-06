import 'package:flutter/material.dart';
import 'package:garden/app/presentation/widgets/plant_form/plant_type_dropdown.dart';
import 'package:garden/core/util/date_converter.dart';

class ChooseDateButton extends StatefulWidget {
  DateTime pickedDate;
  final OnChangeCallback onChanged;
  ChooseDateButton(
      {Key key, @required this.pickedDate, @required this.onChanged})
      : super(key: key);

  @override
  State<ChooseDateButton> createState() => _ChooseDateButtonState();
}

class _ChooseDateButtonState extends State<ChooseDateButton> {
  String buttonText;
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    if (widget.pickedDate != null) {
      selectedDate = widget.pickedDate;
      buttonText = convertDate(selectedDate);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            'Planting date',
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
        RaisedButton.icon(
            elevation: 0,
            label: Text(buttonText ?? 'DD/MM/RRRR'),
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              _pickDate(context);
            })
      ],
    );
  }

  void _pickDate(
    BuildContext context,
  ) async {
    DateTime date = DateTime(1900);
    FocusScope.of(context).requestFocus(new FocusNode());

    date = await showDatePicker(
        builder: (context, Widget child) {
          return Theme(
              data: ThemeData.light().copyWith(
                  colorScheme: ColorScheme.light(primary: Colors.teal[400]),
                  buttonTheme:
                      ButtonThemeData(textTheme: ButtonTextTheme.primary)),
              child: child);
        },
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime.now());

    if (date != null) {
      final convertedDate = convertDate(date);
      buttonText = convertedDate;
      setState(() {
        selectedDate = date;
        widget.onChanged(date);
      });
    } else {
      buttonText = convertDate(DateTime.now());
    }
  }
}
