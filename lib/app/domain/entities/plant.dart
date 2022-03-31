import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:garden/app/domain/entities/plant_type.dart';

@Entity(tableName: 'Plant', foreignKeys: [
  ForeignKey(
      childColumns: ['typeId'], parentColumns: ['id'], entity: PlantType),
])
class Plant extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int plantId;
  final String name;
  @ColumnInfo(name: 'typeId')
  final int typeId;
  final int plantingDate;

  Plant({this.plantId, this.name, this.typeId, this.plantingDate});
  @override
  List<Object> get props => [plantingDate, plantId, name, typeId];
}
