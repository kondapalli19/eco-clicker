import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data/building_types.dart';
import '/data/buildings_bloc.dart';
import '/controllers/buy_building.dart';
import 'item/building_entry.dart';
import '../shop_menu.dart';

class ShopBuildingsView extends StatelessWidget {
  final BuyAmountOptions buyAmount;

  // Creates a view for buyable buildings in the shop
  const ShopBuildingsView({super.key, required this.buyAmount});

  @override
  Widget build(BuildContext context) {
    final buildingsCubit = context.watch<BuildingsCubit>();
    final buildingCounts = buildingsCubit.state.counts;

    final buyBuildings = useBuyBuildings(context);

    final childEntries = buildingTypes.map(
      (building) {
        final id = building.id;
        final name = building.name;
        final count = buildingCounts[id];
        final buyAmount = this.buyAmount.value;
        final cost = building.costCurve.computeCostMultiple(count, buyAmount);
        return BuildingEntry(
          count: count,
          name: name,
          onBuy: () => buyBuildings(id, amountToBuy: buyAmount),
          cost: cost,
        );
      },
    ).toList();

    return Column(
      children: childEntries,
    );
  }
}
