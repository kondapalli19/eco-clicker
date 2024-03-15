import 'package:flutter/material.dart';

import 'earth_clicker.dart';

class ClickerScreen extends StatelessWidget {
  const ClickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: EarthClicker(),
      ),
    );
  }
}
