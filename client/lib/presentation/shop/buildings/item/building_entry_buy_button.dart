import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eco_clicker/data/energy_bloc.dart';

class BuildingEntryBuyButton extends StatelessWidget {
  final VoidCallback onBuy;
  final int cost;

  // Creates a button for buying a building
  const BuildingEntryBuyButton(
      {super.key, required this.onBuy, required this.cost});

  @override
  Widget build(BuildContext context) {
    final energyCubit = context.watch<EnergyCubit>();
    final isAffordable = energyCubit.state >= cost;

    return isAffordable
        ? Container(
            decoration: BoxDecoration(
              color: Colors.white, // Set color to green for the box
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TextButton(
              onPressed: onBuy,
              child: Text('Buy ($cost)'),
            ),
          )
        : TextButton(
            onPressed: null,
            child: Text('Buy ($cost)'),
          );
  }
}
