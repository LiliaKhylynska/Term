import 'package:flutter/material.dart';
import 'package:term/constants/colors.dart';
import 'package:term/models/day.dart';
import 'package:term/models/lesson.dart';
import 'package:term/models/student.dart';
import 'package:term/models/subject.dart';
import 'package:term/widgets/box.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  int dayIndex = 17;
  final List<String> daysOfWeek = ['пн', 'вт', 'ср', 'чт', 'пт', 'сб', 'нд'];
  final List<Day> days = [
    Day(number: 30, isCurrentMonth: false, lessons: []),
    Day(number: 31, isCurrentMonth: false, lessons: []),
    Day(number: 1, isCurrentMonth: true, lessons: []),
    Day(number: 2, isCurrentMonth: true, lessons: []),
    Day(number: 3, isCurrentMonth: true, lessons: []),
    Day(number: 4, isCurrentMonth: true, lessons: []),
    Day(number: 5, isCurrentMonth: true, lessons: []),
    Day(number: 6, isCurrentMonth: true, lessons: []),
    Day(
      number: 7,
      isCurrentMonth: true,
      lessons: [
        Lesson(
          date: DateTime(2025, 1, 7, 18, 0),
          student: Student(
            id: 1,
            firstName: 'Malta',
            lastName: 'Nervuoy',
            grade: 7,
            price: 100,
            image: '',
          ),
          subject: Subject.Algebra,
        ),
        Lesson(
          date: DateTime(2025, 1, 7, 19, 0),
          student: Student(
            id: 2,
            firstName: 'Yamaika',
            lastName: 'ShoHoch',
            grade: 5,
            price: 100,
            image: '',
          ),
          subject: Subject.Geometry,
        ),
      ],
    ),
    Day(number: 8, isCurrentMonth: true, lessons: []),
    Day(number: 9, isCurrentMonth: true, lessons: []),
    Day(number: 10, isCurrentMonth: true, lessons: []),
    Day(number: 11, isCurrentMonth: true, lessons: []),
    Day(number: 12, isCurrentMonth: true, lessons: []),
    Day(number: 13, isCurrentMonth: true, lessons: []),
    Day(number: 14, isCurrentMonth: true, lessons: []),
    Day(number: 15, isCurrentMonth: true, lessons: []),
    Day(number: 16, isCurrentMonth: true, lessons: [], isSelected: true),
    Day(number: 17, isCurrentMonth: true, lessons: []),
    Day(number: 18, isCurrentMonth: true, lessons: []),
    Day(number: 19, isCurrentMonth: true, lessons: []),
    Day(number: 20, isCurrentMonth: true, lessons: []),
    Day(number: 21, isCurrentMonth: true, lessons: []),
    Day(number: 22, isCurrentMonth: true, lessons: []),
    Day(number: 23, isCurrentMonth: true, lessons: [
      Lesson(
        date: DateTime(2025, 1, 7, 18, 0),
        student: Student(
          id: 1,
          firstName: 'Malta',
          lastName: 'Nervuoy',
          grade: 7,
          price: 100,
          image: '',
        ),
        subject: Subject.Algebra,
      ),
      Lesson(
        date: DateTime(2025, 1, 7, 19, 0),
        student: Student(
          id: 2,
          firstName: 'Yamaika',
          lastName: 'ShoHoch',
          grade: 5,
          price: 100,
          image: '',
        ),
        subject: Subject.Geometry,
      ),
      Lesson(
        date: DateTime(2025, 1, 7, 18, 0),
        student: Student(
          id: 1,
          firstName: 'Malta',
          lastName: 'Nervuoy',
          grade: 7,
          price: 100,
          image: '',
        ),
        subject: Subject.Math,
      ),
      Lesson(
        date: DateTime(2025, 1, 7, 19, 0),
        student: Student(
          id: 2,
          firstName: 'Yamaika',
          lastName: 'ShoHoch',
          grade: 5,
          price: 100,
          image: '',
        ),
        subject: Subject.Geometry,
      ),
    ]),
    Day(number: 24, isCurrentMonth: true, lessons: []),
    Day(number: 25, isCurrentMonth: true, lessons: []),
    Day(number: 26, isCurrentMonth: true, lessons: []),
    Day(number: 27, isCurrentMonth: true, lessons: []),
    Day(number: 28, isCurrentMonth: true, lessons: []),
    Day(number: 29, isCurrentMonth: true, lessons: []),
    Day(number: 30, isCurrentMonth: true, lessons: []),
    Day(number: 31, isCurrentMonth: true, lessons: []),
    Day(number: 1, isCurrentMonth: false, lessons: []),
    Day(number: 2, isCurrentMonth: false, lessons: []),
    Day(number: 3, isCurrentMonth: false, lessons: []),
    Day(number: 4, isCurrentMonth: false, lessons: []),
    Day(number: 5, isCurrentMonth: false, lessons: []),
    Day(number: 6, isCurrentMonth: false, lessons: []),
    Day(number: 7, isCurrentMonth: false, lessons: []),
    Day(number: 8, isCurrentMonth: false, lessons: []),
    Day(number: 9, isCurrentMonth: false, lessons: []),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Calendar',
          style: TextStyle(
            color: AppColors.green,
            fontWeight: FontWeight.bold,
            fontFamily: "Blogger-Sans",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Box(
              padding: const EdgeInsets.only(top: 20),
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Column(
                    children: [
                      Text(
                        'Січень 2005',
                        style: const TextStyle(
                            color: AppColors.brown,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: "Blogger-Sans"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: new List.generate(
                            daysOfWeek.length,
                            (index) => Text(
                                  daysOfWeek[index],
                                  style: const TextStyle(
                                      color: AppColors.brown,
                                      fontSize: 18,
                                      fontFamily: "Blogger-Sans"),
                                )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 330,
                    child: GridView.builder(
                      itemCount: days.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                      ),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          if (days[index].isCurrentMonth) {
                            setState(() {
                              for (int i = 0; i < days.length; i++) {
                                if (index == i) {
                                  days[i].isSelected = true;
                                  dayIndex = index;
                                } else {
                                  days[i].isSelected = false;
                                }
                              }
                            });
                          }
                        },
                        child: days[index].isSelected
                            ? Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.green,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(100)),
                                child: CalendarNumber(day: days[index]),
                              )
                            : Center(
                                child: CalendarNumber(day: days[index]),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: List.generate(
                days[dayIndex].lessons.length,
                (index) => Box(
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.only(
                      left: 20, bottom: 20, right: 20, top: 0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text('06:00',
                          style: TextStyle(
                            color: AppColors.brown,
                            fontFamily: "Blogger-Sans",
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            days[dayIndex].lessons[index].student.firstName,
                            style: TextStyle(
                                color: AppColors.green,
                                fontFamily: "Blogger-Sans",
                                fontSize: 18),
                          ),
                          Text(
                            days[dayIndex]
                                    .lessons[index]
                                    .student
                                    .grade
                                    .toString() +
                                ' клас',
                            style: TextStyle(
                                color: AppColors.gray,
                                fontFamily: "Blogger-Sans"),
                          )
                        ],
                      ),
                      Spacer(),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(7.0),
                          topRight: Radius.circular(7.0),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            CalendarNumber.GetLessonName(
                                days[dayIndex].lessons[index].subject),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Blogger-Sans",
                              fontSize: 18,
                            ),
                          ),
                          width: 150,
                          height: 70,
                          color: CalendarNumber.GetLessonColor(
                              days[dayIndex].lessons[index].subject),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CalendarNumber extends StatelessWidget {
  const CalendarNumber({
    super.key,
    required this.day,
  });

  final Day day;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text(
            day.number.toString(),
            style: TextStyle(
              fontWeight:
                  day.number == 16 ? FontWeight.bold : FontWeight.normal,
              fontSize: 18,
              color: day.isCurrentMonth
                  ? AppColors.green
                  : AppColors.green.withAlpha(50),
              fontFamily: "Blogger-Sans",
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, 0.6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              day.lessons.isEmpty ? 0 : day.lessons.length * 2 - 1,
              (index) => index % 2 == 0
                  ? Container(
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(3),
                        color: GetLessonColor(day.lessons[index ~/ 2].subject),
                      ),
                    )
                  : const SizedBox(
                      width: 1,
                    ),
            ),
          ),
        )
      ],
    );
  }

  static Color GetLessonColor(Subject subject) {
    switch (subject) {
      case Subject.Algebra:
        return AppColors.orange;
      case Subject.Geometry:
        return AppColors.lightGreen;
      case Subject.Math:
        return AppColors.yellow;
      default:
        return AppColors.gray;
    }
  }

  static String GetLessonName(Subject subject) {
    switch (subject) {
      case Subject.Algebra:
        return 'Алгебра';
      case Subject.Geometry:
        return 'Геометрія';
      case Subject.Math:
        return 'Математика';
      default:
        return '';
    }
  }
}
