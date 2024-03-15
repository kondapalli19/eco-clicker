import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '/controllers/add_energy.dart';
import '/data/building_types.dart';
import '/data/buildings_bloc.dart';
import 'data/timer_bloc.dart';

class Passive extends StatelessWidget {
  const Passive({super.key});

  @override
  Widget build(BuildContext context) {
    final timerCubit = context.read<TimerCubit>();
    final buildingCubit = context.watch<BuildingsCubit>();
    final addEnergy = useAddEnergy(context);

    var energyPerSec = 0.0;
    var pollutionPerSec = 0.0;

    for (final (id, count) in buildingCubit.state.counts.indexed) {
      energyPerSec += buildingTypes[id].energyRate * count;
    }

    timerCubit.setPeriodicFunction(() {
      addEnergy(energyPerSec);
    });

    return Container();
  }
}
