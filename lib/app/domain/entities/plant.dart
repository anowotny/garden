import 'package:equatable/equatable.dart';

class Plant extends Equatable {
  final int plantId;
  final String name;
  //TODO change to enum
  final String type;
  final DateTime plantingDate;

  Plant({this.plantId, this.name, this.type, this.plantingDate});
  @override
  List<Object> get props => [plantingDate, plantId, name, type];
}
