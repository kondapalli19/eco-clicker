import 'package:eco_clicker/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data/energy_bloc.dart';
import '/data/pollution_bloc.dart';

class TopInfoBar extends StatelessWidget {
  /// Creates a widget that displays energy and pollution stats.
  const TopInfoBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var energyCubit = context.watch<EnergyCubit>();
    var pollutionCubit = context.watch<PollutionCubit>();

    return Row(
      children: [
        _buildImageWithBox(
          'assets/energy_counter.png',
          '${energyCubit.state.round()}',
          context,
        ),
        Spacer(), // Add space between the widgets
        _buildImageWithBox(
          'assets/pollution_counter.png',
          '${pollutionCubit.state.round()}',
          context,
        ),
      ],
    );
  }

 Widget _buildImageWithBox(String imagePath, String text, BuildContext context) {
    return Stack(
      children: [
      Padding(
        padding: EdgeInsets.only(top: 10.0, left: 10.0), // Adjusted padding to move the box downwards
        child: Align(
          alignment: Alignment(0.2, 0), // Adjusted alignment
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: _buildRoundedBox(text, context),
          ),
        ),
      ),
      Image.asset(
        imagePath,
        height: 54, // Adjust the height as needed
        width: 56, // Adjust the width as needed   
      ),
    ],
  );
}
  Widget _buildRoundedBox(String text, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        
        color: EcoColors.textbgColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),     
      ),
      width: 109,
      padding: EdgeInsets.fromLTRB(56.0, 0, 0.0, 0), // Adjusted padding
      child: Text(
        text,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: EcoColors.text),
      ),
    );
  }
}