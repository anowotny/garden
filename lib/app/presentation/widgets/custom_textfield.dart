import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfield extends StatefulWidget {
  final TextEditingController controller;
  const CustomTextfield({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  _CustomTextfieldState createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Theme(
        data: ThemeData(primaryColor: Colors.white),
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
              labelText: 'Plant name',
              labelStyle: GoogleFonts.roboto(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white))),
          cursorColor: Colors.white,
          style: GoogleFonts.roboto(color: Colors.white),
        ),
      ),
    );
  }
}
