abstract class Vehicle {
  int _id;
  String _brand;
  String _model;
  late int _year;
  double _value;

  Vehicle(
    this._id,
    this._brand,
    this._model,
    this._year,
    this._value,
  );

  Vehicle.year2024(
    this._id,
    this._brand,
    this._model,
    this._value,
  ) {
    _year = 2024;
  }
  Vehicle.year2023(
    this._id,
    this._brand,
    this._model,
    this._value,
  ) {
    _year = 2023;
  }
  Vehicle.year2022(
    this._id,
    this._brand,
    this._model,
    this._value,
  ) {
    _year = 2022;
  }

  // int getId() {
  //   return this._id;
  // }

  int getId() => _id;

  double getValue() => _value;

  String getBrand() => _brand;

  String getModel() => _model;

  int getYear() => _year;

  // void setYear(int year) {
  //   _year = year;
  // }

  void setYear(int year) => _year = year;
}
