enum CarProblem {
  noProblem("", 0),
  sputteringEngine("Sputtering Engine", 0),
  alternatorFailure("Alternator Failure", 0),
  faultyFuse("Faulty Fuse", 0),
  damagedOxygenSensors("Damaged Oxygen Sensors", 0),
  deadBattery("Dead Battery", 0),
  faultyBrakes("Faulty Brakes", 0),
  faultySparkPlugs("Faulty Spark Plugs", 0),
  overheating("Overheating", 0),
  faultyOilPump("Faulty Oil Pump", 0);

  const CarProblem(
    this.fullName,
    this.basePrice,
  );

  final String fullName;
  final int basePrice;
}
