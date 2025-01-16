enum CarType {
  sportsCar(presentationName: "Sports Car"),
  suv(presentationName: "SUV"),
  sedan(presentationName: "Sedan"),
  minivan(presentationName: "Minivan"),
  convertible(presentationName: "Convertible"),
  truck(presentationName: "Truck"),
  bus(presentationName: "Bus"),
  train(presentationName: "Train"),
  taxi(presentationName: "Taxi");

  const CarType({required this.presentationName});

  final String presentationName;
}
