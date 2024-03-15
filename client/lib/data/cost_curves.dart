import "dart:math";

abstract class CostCurve {
  const CostCurve();

  // Compute the cost of the next single item
  int compute(int currentQuantity);

  // Compute the cost of n more items (i.e. cost of 10 more solar panels)
  int computeCostMultiple(int currentQuantity, int quantity);
}

class LinearCostCurve extends CostCurve {
  final double baseCost;
  final double slope;

  const LinearCostCurve({
    required this.baseCost,
    required this.slope,
  }) : super();

  @override
  int compute(int currentQuantity) {
    return (baseCost + slope * currentQuantity).round();
  }

  // Can be computed iteratively using a for loop
  // This will become necessary if we implement more complex cost functions
  @override
  int computeCostMultiple(int currentQuantity, int quantity) {
    var cost = 0.0;
    for (var i = 0; i < quantity; i++) {
      cost += compute(currentQuantity + i);
    }
    return cost.round();
  }
}

class ExponentialCostCurve extends CostCurve {
  final double baseCost;
  final double exp;

  const ExponentialCostCurve({
    required this.baseCost,
    required this.exp,
  }) : super();

  @override
  int compute(int currentQuantity) {
    return (baseCost * pow(exp, currentQuantity)).round();
  }

  // Can computed mathematically using a formula
  // This works well for simple cost functions
  // In this case, see: https://en.wikipedia.org/wiki/Geometric_series
  @override
  int computeCostMultiple(int currentQuantity, int quantity) {
    final nextCost = compute(currentQuantity);
    return (nextCost * ((pow(exp, quantity) - 1) / (exp - 1))).round();
  }
}
