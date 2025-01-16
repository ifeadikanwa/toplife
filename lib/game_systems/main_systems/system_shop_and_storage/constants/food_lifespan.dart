enum FoodLifespan {
  short(2),
  mid(4),
  long(6),
  indefinite(5000);

  const FoodLifespan(this.days);
  final int days;
}
