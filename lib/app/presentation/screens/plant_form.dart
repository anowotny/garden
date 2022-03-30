import 'package:flutter/material.dart';

class PlantForm extends StatefulWidget {
  const PlantForm({ Key key }) : super(key: key);

  @override
  State<PlantForm> createState() => _PlantFormState();
}

class _PlantFormState extends State<PlantForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: Center(child: Text('Add/Edit'),)),
    );
  }
}