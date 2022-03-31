import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'PlantType')
class PlantType extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String name;

  PlantType({this.id, this.name});

  @override
  List<Object> get props => [id, name];
}
