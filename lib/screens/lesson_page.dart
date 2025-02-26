import 'package:flutter/material.dart';
import 'package:term/constants/colors.dart';
import 'package:term/widgets/box.dart';
import 'package:term/widgets/picker_popup.dart';
import 'package:term/widgets/primary_text_field.dart';
import 'package:term/widgets/time_picker_popup.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  String student = 'Кройф';
  String subject = 'Математика';
  TimeOfDay time = const TimeOfDay(
    hour: 16,
    minute: 00,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Урок',
          style: TextStyle(
            color: AppColors.orange,
            fontWeight: FontWeight.bold,
            fontFamily: "Blogger-Sans",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10, bottom: 5),
              child: Text(
                'Учень',
                style: TextStyle(color: AppColors.gray, fontSize: 16),
              ),
            ),
            GestureDetector(
              onTap: () async {
                String? value = await showDialog<String>(
                  context: context,
                  builder: (context) => PickerPopup(
                    title: 'Учні',
                    items: const ['Марфа', 'Роналдо', 'Кройф', 'Пеле', 'Тіаго'],
                    initialItem: student,
                  ),
                );
                setState(() {
                  if (value != null) {
                    student = value;
                  }
                });
              },
              child: Box(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Text(
                  student,
                  style: TextStyle(color: AppColors.brown),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, bottom: 5),
              child: Text(
                'Час',
                style: TextStyle(color: AppColors.gray, fontSize: 16),
              ),
            ),
            GestureDetector(
              onTap: () async {
                TimeOfDay? value = await showDialog<TimeOfDay>(
                  context: context,
                  builder: (context) => TimePickerPopup(
                    initialTime: time,
                  ),
                );
                setState(() {
                  if (value != null) {
                    time = value;
                  }
                });
              },
              child: Box(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Text(
                  time.toString(),
                  style: TextStyle(color: AppColors.brown),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, bottom: 5),
              child: Text(
                'Предмет',
                style: TextStyle(color: AppColors.gray, fontSize: 16),
              ),
            ),
            GestureDetector(
              onTap: () async {
                String? value = await showDialog<String>(
                  context: context,
                  builder: (context) => PickerPopup(
                    title: 'Предмети',
                    items: const ['Математика', 'Алгебра', 'Геометрія'],
                    initialItem: subject,
                  ),
                );
                setState(() {
                  if (value != null) {
                    subject = value;
                  }
                });
              },
              child: Box(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Text(
                  subject,
                  style: const TextStyle(color: AppColors.brown),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, bottom: 5),
              child: Text(
                'Нотатки',
                style: TextStyle(color: AppColors.gray, fontSize: 16),
              ),
            ),
            const Box(
              child: SizedBox(
                height: 150,
                child: PrimaryTextField(
                  maxLines: null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
