enum CollegeStatus {
  droppedOut(presentationName: "Dropped Out"),
  expelled(presentationName: "Expelled"),
  transferred(presentationName: "Transferred"),
  active(presentationName: "Active"),
  completed(presentationName: "Completed");


  const CollegeStatus ({required  this.presentationName,});

  final String presentationName;
}
