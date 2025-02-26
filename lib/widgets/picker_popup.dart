import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:term/constants/colors.dart';
import 'package:term/widgets/primary_button.dart';
import 'package:term/widgets/secondary_button.dart';

class PickerPopup extends StatefulWidget {
  final String title;
  final List<String> items;
  final String initialItem;

  const PickerPopup({
    super.key,
    required this.title,
    required this.items,
    required this.initialItem,
  });

  @override
  State<PickerPopup> createState() => _PickerPopupState();
}

class _PickerPopupState extends State<PickerPopup> {
  late String selectedItem;

  @override
  Widget build(BuildContext context) {
    selectedItem = widget.initialItem;
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
                  widget.title,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 30, bottom: 50),
                child: SizedBox(
                  height: 150,
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(
                        initialItem: widget.items.indexOf(widget.initialItem)),
                    useMagnifier: true,
                    magnification: 1.22,
                    squeeze: 1.2,
                    itemExtent: 32,
                    onSelectedItemChanged: (index) {
                      selectedItem = widget.items[index];
                    },
                    children: List<Widget>.generate(
                      widget.items.length,
                      (index) => Text(widget.items[index]),
                    ),
                  ),
                )),
            PrimaryButton(
              text: 'Ok',
              onPressed: () {
                Navigator.pop(context, selectedItem);
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
