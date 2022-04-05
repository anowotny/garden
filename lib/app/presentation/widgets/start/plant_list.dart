import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garden/app/data/models/plant_model.dart';
import 'package:garden/app/presentation/bloc/plant/plant_bloc.dart';
import 'package:garden/app/presentation/screens/plant_form.dart';
import 'package:intl/intl.dart';

class PlantsList extends StatefulWidget {
  const PlantsList({
    Key key,
  }) : super(key: key);

  @override
  _PlantsListState createState() => _PlantsListState();
}

class _PlantsListState extends State<PlantsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(color: Colors.white)),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Scrollbar(
        child: BlocConsumer<PlantBloc, PlantState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is PlantLoadSuccess) {
              if (state.filteredPlants.length == 0) {
                return Center(child: Text('No elements found'));
              } else {
                return ListView.builder(
                    itemCount: state.filteredPlants == null
                        ? 0
                        : state.filteredPlants.length,
                    itemBuilder: (context, index) {
                      final plant = state.filteredPlants[index];
                      final type = state.plantTypes
                          .firstWhere((element) => element.id == plant.typeId);
                      final date = DateFormat("dd/MM/yyyy").format(
                          DateTime.fromMillisecondsSinceEpoch(
                              plant.plantingDate));
                      return ListTile(
                        title: Text(
                          plant.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        leading: Text(
                            plant.name[0] + plant.name[plant.name.length - 1]),
                        isThreeLine: true,
                        subtitle: Text('${type.name}\nPlanting date: ${date}'),
                        // on
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder:(context)=>PlantForm(title: 'Edit plant',plant: plant,)));
                        },
                      );
                    });
              }
            } else if (state is PlantLoading || state is PlantInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PlantLoadFailure) {
              return Column(
                children: [
                  Text(state.error),
                  RaisedButton(
                    onPressed: () {},
                    child: Text('Try again'),
                  )
                ],
              );
            } else
              return Center(child: Text(state.toString()));
          },
        ),
      ),
    );
  }
}
