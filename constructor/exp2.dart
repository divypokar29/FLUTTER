// paramiterize controctor
import '../class_object/exp1.dart';

class Student {
  String? name;
  int? score;

  Student(this.name, this.score) {
    print("hi, ${name} welcom to tops tecnology , your score is ${score}");
  }
}

void main() {
  Student Disha = Student("disa", 85);
}
