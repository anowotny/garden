import 'package:flutter/material.dart';

class ChooseDateButton extends StatefulWidget {
  const ChooseDateButton({Key key}) : super(key: key);

  @override
  State<ChooseDateButton> createState() => _ChooseDateButtonState();
}

class _ChooseDateButtonState extends State<ChooseDateButton> {
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
            label: Text('DD/MM/RRRR'),
            icon: Icon(Icons.calendar_today),
            onPressed: () {})
      ],
    );
  }
}
