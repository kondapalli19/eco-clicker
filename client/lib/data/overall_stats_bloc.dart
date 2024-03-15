import 'package:hydrated_bloc/hydrated_bloc.dart';

// Cubit that tracks 'all-time' stats for the game
class OverallStatsState {
  final double energy;
  final double pollution;

  const OverallStatsState({required this.energy, required this.pollution});

  OverallStatsState copyWith({double? energy, double? pollution}) {
    return OverallStatsState(
      energy: energy ?? this.energy,
      pollution: pollution ?? this.pollution,
    );
  }
}

class OverallStatsCubit extends HydratedCubit<OverallStatsState> {
  OverallStatsCubit()
      : super(const OverallStatsState(energy: 0, pollution: 0));

  void incrementEnergy(double delta) =>
      emit(state.copyWith(energy: state.energy + delta));

  void incrementPollution(double delta) =>
      emit(state.copyWith(pollution: state.pollution + delta));

  // deserialization function for loading state from storage via hydrated_bloc
  @override
  OverallStatsState fromJson(Map<String, dynamic> json) {
    return OverallStatsState(
      energy: json['energy'] as double,
      pollution: json['pollution'] as double,
    );
  }

  // serialization function for persisting state to storage via hydrated_bloc
  @override
  Map<String, dynamic> toJson(OverallStatsState state) {
    return {'energy': state.energy, 'pollution': state.pollution};
  }
}
