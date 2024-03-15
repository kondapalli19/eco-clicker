import 'package:flutter/material.dart';

import '/theme.dart';
import 'shop_menu_button.dart';

enum ViewOptions {
  buildings(name: "Buildings"),
  upgrades(name: "Upgrades");

  const ViewOptions({required this.name});

  final String name;
}

enum BuyAmountOptions {
  one(name: "1", value: 1),
  ten(name: "10", value: 10),
  hundred(name: "100", value: 100);

  const BuyAmountOptions({required this.name, required this.value});

  final String name;
  final int value;
}

class ShopMenu extends StatelessWidget {
  final Function setView;
  final Function setBuyAmount;

  const ShopMenu({
    super.key,
    required this.setView,
    required this.setBuyAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            children: [
              ShopMenuButton(
                onPressed: () => setView(ViewOptions.buildings),
                text: ViewOptions.buildings.name,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ShopMenuButton(
                      onPressed: () {},
                      text: "Eco",
                    ),
                  ),
                  Expanded(
                    child: ShopMenuButton(
                      onPressed: () {},
                      text: "Ind",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              ShopMenuButton(
                onPressed: () => setView(ViewOptions.upgrades),
                text: ViewOptions.upgrades.name,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ShopMenuButton(
                      onPressed: () {},
                      text: "Eco",
                    ),
                  ),
                  Expanded(
                    child: ShopMenuButton(
                      onPressed: () {},
                      text: "Ind",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              ShopMenuButton(
                onPressed: () => {},
                text: "Buy",
                baseColor: EcoColors.secondaryDark,
                highlightColor: EcoColors.secondaryLight,
              ),
              ShopMenuButton(
                onPressed: () => {},
                text: "Sell",
                baseColor: EcoColors.warningDark,
                highlightColor: EcoColors.warningLight,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ShopMenuButton(
                      onPressed: () {},
                      text: "1",
                    ),
                  ),
                  Expanded(
                    child: ShopMenuButton(
                      onPressed: () {},
                      text: "10",
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ShopMenuButton(
                      onPressed: () {},
                      text: "100",
                    ),
                  ),
                  Expanded(
                    child: ShopMenuButton(
                      onPressed: () {},
                      text: "Max",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}