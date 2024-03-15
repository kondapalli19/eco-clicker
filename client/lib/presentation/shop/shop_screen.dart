import 'package:flutter/material.dart';
import 'shop_menu.dart';
import 'buildings/shop_buildings_view.dart';
import 'shop_upgrades_view.dart';
import '/theme.dart';

class ShopScreen extends StatefulWidget {
  /// Creates a ShopScreen
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() {
    return ShopScreenState();
  }
}

class ShopScreenState extends State<ShopScreen> {
  // the current view (i.e. buildings or upgrades)
  ViewOptions currentView = ViewOptions.buildings;
  // the number of items to buy, when on the buildings view
  BuyAmountOptions buyAmount = BuyAmountOptions.one;

  ShopScreenState();

  setCurrentView(ViewOptions newView) {
    setState(() {
      currentView = newView;
    });
  }

  setBuyAmount(BuyAmountOptions newBuyAmount) {
    setState(() {
      buyAmount = newBuyAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
       color: EcoColors.bgDark.withOpacity(0.5),
        child: Column(
          children: [
            const Text("shop screen",
            style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
            ),
            currentView == ViewOptions.buildings
                ? ShopBuildingsView(buyAmount: buyAmount)
                : const ShopUpgradesView(),
            const Spacer(),
            ShopMenu(
              setView: setCurrentView,
              setBuyAmount: setBuyAmount,
            ),
          ],
        ),
      ),
    );
  }
}
