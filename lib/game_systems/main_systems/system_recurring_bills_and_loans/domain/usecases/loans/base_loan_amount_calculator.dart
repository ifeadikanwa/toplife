class BaseLoanAmountCalculatorUsecase {
  int execute({
    required int baseDownPayment,
    required int basePrice,
  }) {
    final int baseLoanAmount = basePrice - baseDownPayment;

    return baseLoanAmount;
  }
}