import 'package:hydrated_bloc/hydrated_bloc.dart';

class EnergyCubit extends HydratedCubit<double> {
  EnergyCubit() : super(0);

  void increment(double delta) => emit(state + delta);
  void decrement(double delta) => emit(state - delta);

  // deserialization function for loading state from storage via hydrated_bloc
  @override
  double fromJson(Map<String, dynamic> json) {
    return json['energy'] as double;
  }

  // serialization function for persisting state to storage via hydrated_bloc
  @override
  Map<String, dynamic> toJson(double state) {
    return {'energy': state};
  }
}
