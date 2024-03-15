import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'data/timer_bloc.dart';
import 'data/energy_bloc.dart';
import 'data/pollution_bloc.dart';
import 'data/buildings_bloc.dart';
import 'data/overall_stats_bloc.dart';
import 'router.dart';

void main() async {
  // hydrated_bloc initialization
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(const EcoClickerApp());
}

class EcoClickerApp extends StatelessWidget {
  const EcoClickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EnergyCubit>(create: (_) => EnergyCubit()),
        BlocProvider<PollutionCubit>(create: (_) => PollutionCubit()),
        BlocProvider<TimerCubit>(create: (_) => TimerCubit()),
        BlocProvider<BuildingsCubit>(create: (_) => BuildingsCubit()),
        BlocProvider<OverallStatsCubit>(create: (_) => OverallStatsCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: goRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
