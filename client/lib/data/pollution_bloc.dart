import 'package:hydrated_bloc/hydrated_bloc.dart';

class PollutionCubit extends HydratedCubit<double> {
  PollutionCubit() : super(0);

  void increment(double delta) => emit(state + delta);
  void decrement(double delta) => emit(state - delta);

  // deserialization function for loading state from storage via hydrated_bloc
  @override
  double fromJson(Map<String, dynamic> json) {
    return (json['pollution'] as num).toDouble();
  }

  // serialization function for persisting state to storage via hydrated_bloc
  @override
  Map<String, dynamic> toJson(double state) {
    return {'pollution': state};
  }
}
