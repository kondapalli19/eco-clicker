import 'cost_curves.dart';

enum BuildingType {
  coal(
    id: 0,
    name: 'Coal-Fired Plant',
    energyRate: 1,
    pollutionRate: 0.5,
    costCurve: ExponentialCostCurve(baseCost: 5, exp: 1.15),
  ),
  oil(
    id: 1,
    name: 'Oil-Fired Plant',
    energyRate: 10,
    pollutionRate: 0.6,
    costCurve: ExponentialCostCurve(baseCost: 50, exp: 1.15),
  ),
  gas(
    id: 2,
    name: 'Natural Gas Plant',
    energyRate: 100,
    pollutionRate: 0.4,
    costCurve: ExponentialCostCurve(baseCost: 500, exp: 1.15),
  ),
  waste2e(
    id: 3,
    name: 'Waste-to-Energy Plant',
    energyRate: 1000,
    pollutionRate: 1,
    costCurve: ExponentialCostCurve(baseCost: 5000, exp: 1.15),
  ),
  nuclear(
    id: 4,
    name: 'Nuclear Plant',
    energyRate: 10000,
    pollutionRate: 2,
    costCurve: ExponentialCostCurve(baseCost: 50000, exp: 1.15),
  ),
  biomass(
    id: 5,
    name: 'Biomass Facility',
    energyRate: 1,
    pollutionRate: 4,
    costCurve: ExponentialCostCurve(baseCost: 10, exp: 1.2),
  ),
  wind(
    id: 6,
    name: 'Wind Farm',
    energyRate: 10,
    pollutionRate: 0.3,
    costCurve: ExponentialCostCurve(baseCost: 100, exp: 1.2),
  ),
  solar(
    id: 7,
    name: 'Solar Farm',
    energyRate: 100,
    pollutionRate: 0.3,
    costCurve: ExponentialCostCurve(baseCost: 1000, exp: 1.2),
  ),
  geothermal(
    id: 8,
    name: 'Geothermal Plant',
    energyRate: 1000,
    pollutionRate: 12,
    costCurve: ExponentialCostCurve(baseCost: 10000, exp: 1.2),
  ),
  hydro(
    id: 9,
    name: 'Hydroelectric Plant',
    energyRate: 10000,
    pollutionRate: 5,
    costCurve: ExponentialCostCurve(baseCost: 100000, exp: 1.2),
  );

  final int id;
  final String name;
  final double energyRate;
  final double pollutionRate;
  final CostCurve costCurve;

  const BuildingType({
    required this.id,
    required this.name,
    required this.energyRate,
    required this.pollutionRate,
    required this.costCurve,
  });
}

const buildingTypes = BuildingType.values;
