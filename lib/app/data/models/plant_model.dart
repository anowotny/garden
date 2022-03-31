import 'package:floor/floor.dart';
import 'package:garden/app/domain/entities/plant.dart';
import 'package:garden/app/domain/entities/plant_type.dart';

@Entity(tableName: 'Plant')
class PlantModel extends Plant {
  @PrimaryKey(autoGenerate: true)
  final int plantId;
  final String name;
  final int typeId;
  final int plantingDate;

  PlantModel({this.plantId, this.name, this.typeId, this.plantingDate})
      : super(
            name: name,
            plantId: plantId,
            plantingDate: plantingDate,
            typeId: typeId);

  factory PlantModel.fromJson(Map<String, dynamic> json) {
    return PlantModel(
        plantId: json['plantId'],
        name: json['name'],
        plantingDate: json['plantingDate'],
        typeId: json['type']);
  }

  Map<String, dynamic> toJson() {
    return {
      "plandId": plantId,
      "name": name,
      "plantingDate": plantingDate,
      "type": typeId,
    };
  }
}
