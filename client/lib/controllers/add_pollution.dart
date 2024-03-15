import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data/pollution_bloc.dart';
import '/data/overall_stats_bloc.dart';

Function useAddPollution(BuildContext context) {
  final pollutionCubit = context.read<PollutionCubit>();
  final overallStatsCubit = context.read<OverallStatsCubit>();

  addPollution(double amount) {
    pollutionCubit.increment(amount);
    overallStatsCubit.incrementPollution(amount);
  }

  return addPollution;
}
