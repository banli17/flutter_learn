import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class _DateTimePicker extends StatefulWidget {
  @override
  DateTimePicker createState() => DateTimePicker();
}

class DateTimePicker extends State<_DateTimePicker> {
  static show(
      {context,
      String minDateTime = '2019-05-15 09:23:10',
      String maxDateTime = '2019-06-03 21:11:00',
      initDateTime = '2019-05-16 09:00:00',
      dateFormat = 'yy年M月d日  EEE,H时:m分',
      locale = DateTimePickerLocale.zh_cn,
      onCancel,
      onChange,
      onConfirm}) {
    TextEditingController _formatCtrl = TextEditingController();

    List<DateTimePickerLocale> _locales = DateTimePickerLocale.values;

    DatePicker.showDatePicker(
      context,
      minDateTime: DateTime.parse(minDateTime),
      maxDateTime: DateTime.parse(maxDateTime),
      initialDateTime: DateTime.parse(initDateTime),
      dateFormat: dateFormat,
      locale: locale,
      pickerTheme: DateTimePickerTheme(
        showTitle: true,
      ),
      pickerMode: DateTimePickerMode.datetime,
      // show TimePicker
      onCancel: () {
        debugPrint('onCancel');
        if (onCancel is Function) {
          onCancel();
        }
      },
      onChange: (dateTime, List<int> index) {
        if (onChange is Function) {
          onChange(dateTime);
        }
      },
      onConfirm: (dateTime, List<int> index) {
        if (onConfirm is Function) {
          onConfirm(dateTime);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
