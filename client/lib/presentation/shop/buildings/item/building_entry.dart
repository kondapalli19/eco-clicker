import 'package:flutter/material.dart';

import 'building_entry_buy_button.dart';

class BuildingEntry extends StatelessWidget {
  final int count;
  final String name;
  final VoidCallback onBuy;
  final int cost;

  // Creates a row in the shop for a building type
  const BuildingEntry({
    super.key,
    required this.count,
    required this.name,
    required this.onBuy,
    required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$name: $count   ',
        style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
        ),
        BuildingEntryBuyButton(onBuy: onBuy, cost: cost)
      ],
    );
  }
}
