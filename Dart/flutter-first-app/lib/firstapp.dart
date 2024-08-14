import 'package:firstapp/models/vehicle.dart';

void main() {
  collectionWithMaps();
}

int calculate() {
  return 6 * 7;
}

// num soma(int a, double b) {
//   return a + b;
// }

void collectionWithMaps() {
  Vehicle onix2024 = Vehicle.year2024(210, "Chevrolet", "Onix", 80.000);
  Vehicle polo2024 = Vehicle.year2024(210, "VolksWagen", "Polo", 82.000);

  // Map<int, List<Vehicle>> cars = {
  //   2024: [onix2024, polo2024]
  // };

  Map<int, Map<List<Vehicle>, String>> cars = {
    1: {[]:"Chevrolet"},
    2: {[]:"Chevrolet"}
  };

  Vehicle hb20 = Vehicle.year2024(210, "Hyundai", "HB20", 84.000);

  // cars[2024]?.add(hb20);
}

void methodcollecion() {
  Vehicle onix = Vehicle(312, "Chevrolet", "Onix", 2024, 89000.00);
  Vehicle polo = Vehicle(313, "VolksWagen", "Polo", 2024, 94000.00);
  Vehicle hyundai = Vehicle(322, "Hyundai", "HB20", 2024, 96100.00);
  Vehicle strada = Vehicle(319, "Fiat", "Strada", 2024, 92000.00);

  List<Vehicle> cars = [onix, polo, hyundai, strada];

  List<Vehicle> orcamento =
      cars.where((car) => car.getValue() <= 95000.00).toList();

  orcamento.forEach((car) {
    print("${car.getBrand()} : ${car.getModel()}");
  });

  List<int> numbers = [1, 2, 5, 8, 14];
  numbers.add(15);
  numbers.add(8);

  print("Lista de numeros: $numbers");

  Set<int> numbersOdds = {1, 3, 5, 7, 9}; // odds é ímpares
  numbersOdds.add(7);
  numbersOdds.add(11);

  print("Set numeros impares: $numbersOdds");

  Map<int, List<String>> shop = {
    14: ["Carne", "Carvão", "Pinga", "Farofa"],
    10: ["Gelatina", "Doce de Leite"]
  };

  print("Minha coleção de compras $shop");
}
