import 'package:equatable/equatable.dart';
import 'package:toplife/core/utils/sectioned_list/section_data.dart';

//We used a sealed class so that our classes can take in a list with or without sections and figure out which it is without hassle
sealed class SectionedList<T> extends Equatable {
  abstract final List<T> content;
}

//This is used for packaging a list that is divided into sections
class Sectioned<T> extends Equatable implements SectionedList<T> {
  @override
  final List<T> content;

  final List<SectionData<T>> _sectionDataList;

  late final Map<int, String> sectionStartingIndexToTitleMap;

  Sectioned(
    this._sectionDataList,
  ) : content = _mapSectionDataListToContent(_sectionDataList) {
    sectionStartingIndexToTitleMap = _setSectionStartingIndexToTitleMap();
  }

  @override
  List<Object?> get props => [
        _sectionDataList,
      ];

  //convert the sectioned data list into a single list
  static List<T> _mapSectionDataListToContent<T>(
    List<SectionData<T>> sectionDataList,
  ) {
    final List<T> content = [];

    for (var sectionData in sectionDataList) {
      content.addAll(sectionData.content);
    }
    return content;
  }

  //go through the section data passed in and mark the first index in each section
  //this is marking cumulative index, we are basically saying if all the section content was put in one list what is the index of the section starting elements
  Map<int, String> _setSectionStartingIndexToTitleMap() {
    Map<int, String> startingIndexToTitle = {};

    int cumulativeLength = 0;

    //loop through all sections
    for (var i = 0; i < _sectionDataList.length; i++) {
      //add the cumulative length as the starting index and map to title
      startingIndexToTitle[cumulativeLength] = _sectionDataList[i].title;

      //add this sections length to the cumulative length
      cumulativeLength += _sectionDataList[i].content.length;
    }

    //return the map
    return startingIndexToTitle;
  }

  //get section title,
  //this will be used to check if a given index is the start of a new section
  String? getSectionTitle(int index) {
    //if the given index is one of our starting index
    if (sectionStartingIndexToTitleMap.keys.contains(index)) {
      return sectionStartingIndexToTitleMap[index];
    }

    //if not
    return null;
  }

  //check if this is the start of a new section
  bool startOfSection(int index) {
    return sectionStartingIndexToTitleMap.keys.contains(index);
  }

  //check if this is the end of a section
  bool endOfSection(int index) {
    //this is the end of a section if the next index will be a start of a section
    return sectionStartingIndexToTitleMap.keys.contains(index + 1);
  }
}

//this is used for packaging a list with no section
class NoSection<T> extends Equatable implements SectionedList<T> {
  @override
  final List<T> content;

  const NoSection({required this.content});

  @override
  List<Object?> get props => [
        content,
      ];
}
