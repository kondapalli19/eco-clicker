import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data/energy_bloc.dart';
import '/data/overall_stats_bloc.dart';

Function useAddEnergy(BuildContext context) {
  final energyCubit = context.read<EnergyCubit>();
  final overallStatsCubit = context.read<OverallStatsCubit>();

  addEnergy(int amount) {
    energyCubit.increment(amount.toDouble());
    overallStatsCubit.incrementEnergy(amount.toDouble());
  }

  return addEnergy;
}
