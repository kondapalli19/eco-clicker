import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/controllers/add_energy.dart';
import '/data/timer_bloc.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final energyController = TextEditingController();
    final tickRateController = TextEditingController();

    final addEnergy = useAddEnergy(context);
    final timerCubit = context.read<TimerCubit>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: energyController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                addEnergy(int.parse(energyController.text));
              },
              child: const Text("+ ENERGY"),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: tickRateController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                timerCubit.setTickRate(double.parse(tickRateController.text));
              },
              child: const Text("TICK RATE"),
            ),
          ],
        ),
      ],
    );
  }
}
