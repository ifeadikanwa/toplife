enum TransportMode {
  bus(presentationName: "Bus",),
  train(presentationName: "Train",),
  taxi(presentationName: "Taxi",),
  private(presentationName: "Private",);

  const TransportMode({
    required this.presentationName,
  });

  final String presentationName;
}
