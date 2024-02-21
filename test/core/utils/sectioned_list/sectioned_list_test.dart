import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/sectioned_list/section_data.dart';
import 'package:toplife/core/utils/sectioned_list/sectioned_list.dart';

void main() {
  group('Sectioned list:', () {
    group("Sectioned:", () {
      final Sectioned<String> testObject = Sectioned(const [
        SectionData(
          title: "title1",
          content: [
            "content1",
            "content2",
            "content3",
            "content4",
            "content5",
          ],
        ),
        SectionData(
          title: "title2",
          content: [
            "content6",
            "content7",
            "content8",
          ],
        ),
        SectionData(
          title: "title3",
          content: [
            "content9",
            "content10",
            "content11",
            "content12",
          ],
        ),
        SectionData(
          title: "title4",
          content: [
            "content13",
          ],
        ),
      ]);

      test(
          'mapSectionDataListToContent sets object content variable to the correct value',
          () {
        expect(
          testObject.content,
          [
            "content1",
            "content2",
            "content3",
            "content4",
            "content5",
            "content6",
            "content7",
            "content8",
            "content9",
            "content10",
            "content11",
            "content12",
            "content13",
          ],
        );
      });

      test(
          'setSectionStartingIndexToTitleMap sets object sectionStartingIndexToTitleMap variable to the correct value',
          () {
        expect(
          testObject.sectionStartingIndexToTitleMap,
          {
            0: "title1",
            5: "title2",
            8: "title3",
            12: "title4",
          },
        );
      });

      test('getSectionTitle returns null when given an out of bound index', () {
        expect(testObject.getSectionTitle(20), null);
      });

       test('getSectionTitle returns null when given a NON section starting index', () {
        expect(testObject.getSectionTitle(3), null);
      });

       test('getSectionTitle returns the correct title when given a section starting index', () {
        expect(testObject.getSectionTitle(5), "title2");
      });

       test('startOfSection returns true when given a section starting index', () {
        expect(testObject.startOfSection(8), true);
      });

       test('startOfSection returns false when given a NON section starting index', () {
        expect(testObject.startOfSection(11), false);
      });

       test('endOfSection returns true when given a section ending index', () {
        expect(testObject.endOfSection(7), true);
      });

       test('endOfSection returns false when given a NON section ending index', () {
        expect(testObject.endOfSection(12), false);
      });
    });
  });
}
