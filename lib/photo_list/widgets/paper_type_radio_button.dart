import 'package:flutter/material.dart';
import '../models/photo.dart';

class PaperTypeRadioButton extends StatelessWidget {
  final String title;
  final PaperType value;
  final PaperType? groupValue;
  final ValueChanged<PaperType?> onChanged;

  const PaperTypeRadioButton({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        dense: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        contentPadding: const EdgeInsets.all(0.0),
        tileColor: const Color(0xff9b9b9b),
        horizontalTitleGap: -4.0,
        title: Text(title),
        leading: Radio<PaperType>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
