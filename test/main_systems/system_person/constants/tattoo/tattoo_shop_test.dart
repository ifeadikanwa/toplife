import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_shop.dart';

void main() {
  group("Tattoo shop:", () {
    test("one star has correct information", () {
      expect(
        TattooShop.oneStar.presentationtName,
        "☆",
        reason: "Cause: presentation name",
      );

      expect(
        TattooShop.oneStar.discountPercentage,
        70,
        reason: "Cause: discount percentage",
      );

      expect(
        TattooShop.oneStar.botchedChance,
        80,
        reason: "Cause: botched chance",
      );

      expect(
        TattooShop.oneStar.artisticChance,
        10,
        reason: "Cause: artistic chance",
      );
    });

    test("two stars has correct information", () {
      expect(
        TattooShop.twoStars.presentationtName,
        "☆☆",
        reason: "Cause: presentation name",
      );

      expect(
        TattooShop.twoStars.discountPercentage,
        50,
        reason: "Cause: discount percentage",
      );

      expect(
        TattooShop.twoStars.botchedChance,
        60,
        reason: "Cause: botched chance",
      );

      expect(
        TattooShop.twoStars.artisticChance,
        20,
        reason: "Cause: artistic chance",
      );
    });

    test("three stars has correct information", () {
      expect(
        TattooShop.threeStars.presentationtName,
        "☆☆☆",
        reason: "Cause: presentation name",
      );

      expect(
        TattooShop.threeStars.discountPercentage,
        30,
        reason: "Cause: discount percentage",
      );

      expect(
        TattooShop.threeStars.botchedChance,
        40,
        reason: "Cause: botched chance",
      );

      expect(
        TattooShop.threeStars.artisticChance,
        30,
        reason: "Cause: artistic chance",
      );
    });

    test("four stars has correct information", () {
      expect(
        TattooShop.fourStars.presentationtName,
        "☆☆☆☆",
        reason: "Cause: presentation name",
      );

      expect(
        TattooShop.fourStars.discountPercentage,
        10,
        reason: "Cause: discount percentage",
      );

      expect(
        TattooShop.fourStars.botchedChance,
        20,
        reason: "Cause: botched chance",
      );

      expect(
        TattooShop.fourStars.artisticChance,
        40,
        reason: "Cause: artistic chance",
      );
    });

    test("five stars has correct information", () {
      expect(
        TattooShop.fiveStars.presentationtName,
        "☆☆☆☆☆",
        reason: "Cause: presentation name",
      );

      expect(
        TattooShop.fiveStars.discountPercentage,
        0,
        reason: "Cause: discount percentage",
      );

      expect(
        TattooShop.fiveStars.botchedChance,
        10,
        reason: "Cause: botched chance",
      );

      expect(
        TattooShop.fiveStars.artisticChance,
        50,
        reason: "Cause: artistic chance",
      );
    });
  });
}
