import 'package:garden/app/domain/entities/plant.dart';

class PlantModel extends Plant {
  final int plantId;
  final String name;
  final String type;
  final DateTime plantingDate;

  PlantModel({this.plantId, this.name, this.type, this.plantingDate})
      : super(
            name: name,
            plantId: plantId,
            plantingDate: plantingDate,
            type: type);

  factory PlantModel.fromJson(Map<String, dynamic> json) {
    return PlantModel(
        plantId: json['plantId'],
        name: json['name'],
        plantingDate: DateTime.parse(json['plantingDate']),
        type: json['type']);
  }

  Map<String, dynamic> toJson() {
    return {
      "plandId": plantId,
      "name": name,
      "plantingDate": plantingDate.toIso8601String(),
      "type": type,
    };
  }
}
