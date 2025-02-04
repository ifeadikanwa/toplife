enum StayType {
  visit(presentationName: "Visitor"),
  temporary(presentationName: "Temporary Occupant"),
  indefinitely(presentationName: "Occupant"),
  roommate(presentationName: "Roommate");

  const StayType({required this.presentationName});

  final String presentationName;
}
