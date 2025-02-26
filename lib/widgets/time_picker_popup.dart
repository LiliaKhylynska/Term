import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:term/constants/colors.dart';
import 'package:term/widgets/primary_button.dart';
import 'package:term/widgets/secondary_button.dart';

class TimePickerPopup extends StatefulWidget {
  final TimeOfDay initialTime;
  final List<String> hours = const [
    '00',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23'
  ];
  final List<String> minutes = const [
    '00',
    '05',
    '10',
    '15',
    '20',
    '25',
    '30',
    '35',
    '40',
    '45',
    '50',
    '55'
  ];

  const TimePickerPopup({
    super.key,
    required this.initialTime,
  });

  @override
  State<TimePickerPopup> createState() => _TimePickerPopupState();
}

class _TimePickerPopupState extends State<TimePickerPopup> {
  late String selectedItem;
  late int selectedHour;
  late int selectedMinute;

  @override
  Widget build(BuildContext context) {
    selectedHour = widget.initialTime.hour;
    selectedMinute = widget.initialTime.minute;
    final screenWidth = MediaQuery.of(context).size.width - 100;
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        width: double.infinity,
        margin: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: Color(0xFFEFEFF4),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Час',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 30, bottom: 50),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text('Година'),
                        SizedBox(
                          height: 150,
                          width: screenWidth / 2,
                          child: CupertinoPicker(
                            scrollController: FixedExtentScrollController(
                                initialItem: selectedHour),
                            useMagnifier: true,
                            magnification: 1.22,
                            squeeze: 1.2,
                            itemExtent: 32,
                            onSelectedItemChanged: (index) {
                              selectedHour = index;
                            },
                            children: List<Widget>.generate(
                              widget.hours.length,
                              (index) => Text(widget.hours[index]),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Хвилина'),
                        SizedBox(
                          height: 150,
                          width: screenWidth / 2,
                          child: CupertinoPicker(
                            scrollController: FixedExtentScrollController(
                                initialItem: selectedMinute),
                            useMagnifier: true,
                            magnification: 1.22,
                            squeeze: 1.2,
                            itemExtent: 32,
                            onSelectedItemChanged: (index) {
                              selectedMinute = index;
                            },
                            children: List<Widget>.generate(
                              widget.minutes.length,
                              (index) => Text(widget.minutes[index]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            PrimaryButton(
              text: 'Ok',
              onPressed: () {
                Navigator.pop(context,
                    TimeOfDay(hour: selectedHour, minute: selectedMinute));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            SecondaryButton(
              text: 'Cancel',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ]);
  }
}
