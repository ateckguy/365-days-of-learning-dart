// Devices //

class SmartLight {
  SmartLight(this.isOn, this.brightness, this.mode);

  bool isOn;
  int brightness;
  String mode;

  bool toggle() {
    isOn = !isOn;
    return isOn;
  }

  int setBrightness(int value) {
    if (value < 0 || value > 100) {
      throw ArgumentError("Brightness must be between 1 and 100.");
    }
    return brightness = value;
  }

  String setMode(String newMode) {
    List<String> modes = ["normal", "light", "dark"];

    if (!modes.contains(newMode)) {
      throw ArgumentError("Does only contain $modes.");
    }
    return mode = newMode;
  }

  String status() => "Mode: $mode, Brightness: $brightness, Active: $isOn";
}

class SmartThermostat {
  SmartThermostat(this.temperature, this.mode);

  double temperature;
  String mode;

  double setTemperature(double value) {
    if (value < 0 || value > 30) {
      throw ArgumentError("Temperature must be between 0 and 30°C.");
    }
    return temperature = value;
  }

  String setMode(String newMode) {
    List<String> modes = ["heat", "cool", "eco"];

    if (!modes.contains(newMode)) {
      throw ArgumentError("Does only contain $modes.");
    }
    return mode = newMode;
  }

  String status() => "Temperature: $temperature, Mode: $mode";
}

class SmartDoor {
  SmartDoor(this.isLocked, this.isOpen);

  bool isLocked;
  bool isOpen;

  bool lock() => isLocked = true;
  bool unlock() => isLocked = false;

  bool open() => isOpen = true;
  bool close() => isOpen = false;

  String status() => "Locked: $isLocked, Open: $isOpen";
}

class SmartHomeController {
  SmartHomeController(this.light, this.thermostat, this.door);

  SmartLight light;
  SmartThermostat thermostat;
  SmartDoor door;

  void activateNightMode() {
    light.setMode("dark");
    thermostat.setMode("eco");
    door.isLocked = true;
  }

  void activateAwayMode() {
    light.isOn = false;
    thermostat.setMode("eco");
    door.isLocked = true;
  }

  void activateMovieMode() {
    light.isOn = true;
    thermostat.setMode("eco");
    door.isLocked = false;
  }

  String reportAll() =>
      "Light is on: ${light.isOn}, Thermostat mode: ${thermostat.mode}, Door locked: ${door.isLocked}";
}

void main() {
  final light = SmartLight(true, 65, "dark");
  final thermostat = SmartThermostat(20, "eco");
  final door = SmartDoor(true, false);
  final controller = SmartHomeController(light, thermostat, door);

  controller.activateNightMode();
  controller.activateAwayMode();
  controller.activateMovieMode();
  print(controller.reportAll());
}
