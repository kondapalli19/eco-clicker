import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data/building_types.dart';
import '/data/buildings_bloc.dart';
import '/data/energy_bloc.dart';
import '/data/pollution_bloc.dart';

// Controller function for buying a building
typedef BuyBuildingsFunction = void Function(int buildingId, {int amountToBuy});

BuyBuildingsFunction useBuyBuildings(BuildContext context) {
  final buildingsCubit = context.watch<BuildingsCubit>();
  final energyCubit = context.read<EnergyCubit>();
  final pollutionCubit = context.read<PollutionCubit>();

  void buyBuildings(int buildingId, {int amountToBuy = 1}) {
    final buildingCount = buildingsCubit.state.counts[buildingId];
    final cost = buildingTypes[buildingId]
        .costCurve
        .computeCostMultiple(buildingCount, amountToBuy);
    
    energyCubit.decrement(cost.toDouble());
    final buildingType = buildingTypes[buildingId];
    pollutionCubit.increment(buildingType.pollutionRate * amountToBuy);

      buildingsCubit.buyBuildings(buildingId, amount: amountToBuy);
    
      // Handle the error case where cost is not a double
     
  }

  return buyBuildings;
}
