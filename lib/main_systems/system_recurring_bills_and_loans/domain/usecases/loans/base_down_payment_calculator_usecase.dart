class BaseDownPaymentCalculatorUsecase {
  int execute({
    required int downPaymentPercentage,
    required int basePrice,
  }) {
    final int downPayment = ((downPaymentPercentage / 100) * basePrice).ceil();

    return downPayment;
  }
}
