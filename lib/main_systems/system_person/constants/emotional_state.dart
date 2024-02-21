enum EmotionalState {
  normal(presentationName: "Normal"),
  happy(presentationName: "Happy"),
  sad(presentationName: "Sad"),
  pain(presentationName: "Pain"),
  angry(presentationName: "Angry"),
  stressed(presentationName: "Stressed");

  const EmotionalState({
    required this.presentationName,
  });

  final String presentationName;
}
