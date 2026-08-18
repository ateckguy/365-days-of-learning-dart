class Student {
  Student(this.name, this.age, this.id);

  String name;
  int age;
  String id;

  String info() {
    return "Name: $name, Age: $age, ID: $id";
  }
}

class BachelorStudent extends Student {
  BachelorStudent(String name, int age, String id, this.major, this.semester)
    : super(name, age, id);

  String major;
  int semester;

  @override
  String info() => "${super.info()} | Bachelor in $major, Semester: $semester";
}

class MasterStudent extends Student {
  MasterStudent(
    String name,
    int age,
    String id,
    this.specialisation,
    this.isTeachingAssistant,
  ) : super(name, age, id);

  String specialisation;
  bool isTeachingAssistant;

  @override
  String info() =>
      "${super.info()} | Specilisation: $specialisation, Teacher's Assistant: $isTeachingAssistant";
}

class PhDStudent extends Student {
  PhDStudent(
    String name,
    int age,
    String id,
    this.researchTopic,
    this.isTeachingAssistant,
  ) : super(name, age, id);

  String researchTopic;
  bool isTeachingAssistant;

  @override
  String info() =>
      "${super.info()} | Reasearch Topic: $researchTopic, Teacher's Assistant: $isTeachingAssistant";
}

class StudentManager {
  StudentManager(this.students);

  List<Student> students;

  void addStudent(Student s) => students.add(s);

  void removeStudent(String id) {
    students.removeWhere((s) => s.id == id);
  }

  Student? findStudent(String id) {
    return students.firstWhere((s) => s.id == id);
  }

  void reportAll() {
    for (var s in students) {
      print(s.info());
    }
  }
}

void main() {
  final bachelorStudent1 = BachelorStudent("Nils", 19, "556334", "Math", 3);
  final masterStudent1 = MasterStudent(
    "Rebecca",
    23,
    "235644",
    "Management",
    true,
  );
  final pdhStudent1 = PhDStudent("Tom", 25, "112456", "Complex Analysis", true);
  final studentManager = StudentManager([]);

  studentManager.addStudent(bachelorStudent1);
  studentManager.addStudent(masterStudent1);
  studentManager.addStudent(pdhStudent1);

  studentManager.reportAll();
}
