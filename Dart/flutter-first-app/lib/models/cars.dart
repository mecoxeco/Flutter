import 'package:firstapp/models/automatic.dart';
import 'package:firstapp/models/esportive.dart';
import 'package:firstapp/models/vehicle.dart';

class Cars extends Vehicle implements Esportive, Automatic {
  Cars(
    super._id, 
    super._brand, 
    super._model, 
    super._year, 
    super._value,
  );
}
