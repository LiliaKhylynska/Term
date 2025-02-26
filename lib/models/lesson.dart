import 'package:term/models/student.dart';
import 'package:term/models/subject.dart';

class Lesson {
  final DateTime date;
  final Student student;
  final Subject subject;

  Lesson({
    required this.date,
    required this.student,
    required this.subject,
  });
}
