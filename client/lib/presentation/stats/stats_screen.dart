import 'package:eco_clicker/data/pollution_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data/overall_stats_bloc.dart';
import '/theme.dart';
import '/data/pollution_bloc.dart';

class StatsScreen extends StatelessWidget {
  /// Creates a ClickerScreen
  const StatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pollutionCubit = context.watch<PollutionCubit>();
    final overallStatsCubit = context.watch<OverallStatsCubit>();
    return Padding(
      padding: EdgeInsets.only(top: 20), // Adjust the top padding as needed
      child: Container(
        color: EcoColors.bgDark.withOpacity(0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the start (left)
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Statistics",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: const Text(
                "General",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text(
                    "Total energy generated:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  "${overallStatsCubit.state.energy}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text(
                    "Total pollution generated:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  "${pollutionCubit.state}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: const Text(
                "Buildings",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
