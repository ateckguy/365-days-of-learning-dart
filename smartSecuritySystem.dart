class SmartCamera {
  SmartCamera(this.isRecording, this.resolution);

  bool isRecording;
  int resolution;

  bool startRecording() {
    isRecording = true;
    return isRecording;
  }

  bool stopRecording() {
    isRecording = false;
    return isRecording;
  }

  int setResolution(int value) {
    resolution = value;
    return resolution;
  }

  bool statusRecording() => isRecording;
  int statusResolution() => resolution;
}

class SmartAlarm {
  SmartAlarm(this.isArmed, this.isSirenActive);

  bool isArmed;
  bool isSirenActive;

  bool arm() {
    isArmed = true;
    return isArmed;
  }

  bool disarm() {
    isArmed = false;
    return isArmed;
  }

  bool triggerSiren() {
    isSirenActive = true;
    return isSirenActive;
  }

  bool stopSiren() {
    isSirenActive = false;
    return isSirenActive;
  }

  bool statusArmed() => isArmed;
  bool statusSiren() => isSirenActive;
}

class SmartMotionSensor {
  SmartMotionSensor(this.motionDetected);

  bool motionDetected;

  bool detectMotion() {
    motionDetected = true;
    return motionDetected;
  }

  bool reset() {
    motionDetected = false;
    return motionDetected;
  }

  bool statusMotionDetector() => motionDetected;
}

class SecurityController {
  SecurityController(this.camera, this.alarm, this.motionSensor);

  SmartCamera camera;
  SmartAlarm alarm;
  SmartMotionSensor motionSensor;

  void activateHomeMode() {
    camera.stopRecording();
    alarm.disarm();
    alarm.stopSiren();
    motionSensor.reset();
  }

  void activateAwayMode() {
    camera.startRecording();
    alarm.arm();
    alarm.stopSiren();
    motionSensor.reset();
  }

  void activateAlertMode() {
    camera.startRecording();
    alarm.arm();
    alarm.triggerSiren();
  }

  void reportAll() {
    print("""
  Camera: recording=${camera.isRecording}, resolution=${camera.resolution}
  Alarm: armed=${alarm.isArmed}, siren=${alarm.isSirenActive}
  MotionSensor: detected=${motionSensor.motionDetected}
""");
  }
}

void main() {
  final camera = SmartCamera(true, 1080);
  final alarm = SmartAlarm(true, true);
  final motionSensor = SmartMotionSensor(false);

  final controller = SecurityController(camera, alarm, motionSensor);

  controller.activateAlertMode();
  controller.reportAll();
}
