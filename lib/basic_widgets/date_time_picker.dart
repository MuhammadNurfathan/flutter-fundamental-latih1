  import 'dart:async';
  import 'package:flutter/material.dart';

  class DateTimePicker extends StatefulWidget {
    const DateTimePicker({super.key});

    @override
    _DateTimePickerState createState() => _DateTimePickerState();
  }

  class _DateTimePickerState extends State<DateTimePicker> {
    DateTime selectedDate = DateTime.now();

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    }

    @override
    Widget build(BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("${selectedDate.toLocal()}".split(' ')[0]),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              _selectDate(context);
            },
            child: const Text('Pilih Tanggal'),
          ),
        ],
      );
    }
  }
