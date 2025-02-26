import 'package:term/models/lesson.dart';

class Day {
  final int number;
  final bool isCurrentMonth;
  bool isSelected;
  final List<Lesson> lessons;

  Day({
    required this.number,
    required this.isCurrentMonth,
    required this.lessons,
    this.isSelected = false,
  });
}
