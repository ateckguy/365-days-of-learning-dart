import 'dart:math' as math;

final random = math.Random();

class SmartSprinkler {
  SmartSprinkler(this.isOn, this.waterlevel);

  bool isOn;
  int waterlevel;

  bool turnOn() => isOn = true;
  bool turnOff() => isOn = false;

  int setWaterLevel(int value) {
    if (value < 0) value = 0;
    if (value > 100) value = 100;

    waterlevel = value;
    return waterlevel;
  }

  String status() => "Is on: $isOn | Waterlevel: $waterlevel";
}

class SmartSoilSensor {
  SmartSoilSensor(this.moisture);

  int moisture;

  int measure() => moisture = random.nextInt(101);
  String status() => "Moisture: $moisture";
}

class SmartSunlightSensor {
  SmartSunlightSensor(this.sunlight);

  int sunlight;

  int measure() => sunlight = random.nextInt(101);
  String status() => "Sunlight: $sunlight";
}

class GardenController {
  GardenController(this.sprinkler, this.soilSensor, this.sunlightSensor);

  SmartSprinkler sprinkler;
  SmartSoilSensor soilSensor;
  SmartSunlightSensor sunlightSensor;

  void activateMorningRoutine() {
    sprinkler.turnOff();
    soilSensor.measure();
    sunlightSensor.measure();
  }

  void activateWateringRoutine() {
    if (soilSensor.moisture < 40) {
      sprinkler.turnOn();
    } else {
      sprinkler.turnOff();
    }
  }

  void activateEveningRoutine() {
    sprinkler.turnOff();
    soilSensor.measure();
    sunlightSensor.measure();
  }

  void reportAll() => print(
    """Sprinkler => ${sprinkler.status()} | Soil Sensor => ${soilSensor.status()} | Sunlight Sensor => ${sunlightSensor.status()}""",
  );
}

void main() {
  final sprinkler = SmartSprinkler(true, 66);
  final soilSensor = SmartSoilSensor(25);
  final sunlightSensor = SmartSunlightSensor(45);

  final controller = GardenController(sprinkler, soilSensor, sunlightSensor);

  controller.activateMorningRoutine();
  controller.activateEveningRoutine();
  controller.activateWateringRoutine();

  controller.reportAll();
}
