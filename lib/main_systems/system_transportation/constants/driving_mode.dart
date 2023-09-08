enum DrivingMode {
  careful(
    travelTimeEffect: 15,
    accidentChanceEffect: -15,
  ),
  normal(
    travelTimeEffect: 0,
    accidentChanceEffect: 0,
  ),
  highSpeed(
    travelTimeEffect: -15,
    accidentChanceEffect: 15,
  );

  const DrivingMode({
    required this.travelTimeEffect,
    required this.accidentChanceEffect,
  });

  final int travelTimeEffect;
  final int accidentChanceEffect;
}
