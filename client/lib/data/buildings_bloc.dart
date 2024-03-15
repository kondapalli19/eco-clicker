import 'package:flutter_bloc/flutter_bloc.dart';

import 'building_types.dart';

class BuildingsState {
  final List<int> counts;
  final List<bool> isUpgraded;

  BuildingsState({required this.counts, required this.isUpgraded});

  static BuildingsState defaultState() {
    return BuildingsState(
      counts: [for (final _ in buildingTypes) 0],
      isUpgraded: [for (final _ in buildingTypes) false],
    );
  }
}

// BuildingsCubit stores the state of all purchaseable buildings in the game
// Each type of building is uniquely identified by an integer id
// The state is a list of integers where list[id] is the number of buildings of type id
class BuildingsCubit extends Cubit<BuildingsState> {
  BuildingsCubit() : super(BuildingsState.defaultState());

  void buyBuildings(int buildingId, {int amount = 1}) {
    var newCounts = List<int>.from(state.counts);
    newCounts[buildingId] += amount;
    emit(BuildingsState(counts: newCounts, isUpgraded: state.isUpgraded));
  }

  void upgradeBuilding(int buildingId) {
    var newIsUpgraded = List<bool>.from(state.isUpgraded);
    newIsUpgraded[buildingId] = true;
    emit(BuildingsState(counts: state.counts, isUpgraded: newIsUpgraded));
  }
}
