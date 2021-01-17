import 'package:custom_buttons/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:game_friend_finder/constants/colors.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'set_gender.dart';

class SetBirthday extends StatefulWidget {
  @override
  _SetBirthdayState createState() => _SetBirthdayState();
}

class _SetBirthdayState extends State<SetBirthday> {
  DateTime _birthDay, _maximumAgeDate, _minimumAgeDate, _initialAgeDate;
  int userMaximumAge = 80;
  int userMinimumAge = 14;
  int userInitialAge = 20;
  String _birthDayStr;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ko_KR', null);
    DateTime now = DateTime.now();

    _maximumAgeDate = now.subtract(Duration(days: 365 * userMaximumAge));
    _minimumAgeDate = now.subtract(Duration(days: 365 * userMinimumAge));
    _initialAgeDate = now.subtract(Duration(days: 365 * userInitialAge));
  }

  _submitNext() => Navigator.push(
      context, MaterialPageRoute(builder: (context) => SetGender()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColor,
        elevation: 0,
        leading: Builder(
            builder: (context) => IconButton(
                  icon: const Icon(LineAwesomeIcons.angle_left,
                      color: Colors.grey),
                  onPressed: () => Navigator.pop(context),
                )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('🎂 내 생일:', style: Theme.of(context).textTheme.headline4),
              Text(_birthDayStr != null ? _birthDayStr : '생일을 선택해주세요',
                  style: const TextStyle(
                      fontSize: 17, color: Colors.black, letterSpacing: 9)),
              CalendarDatePicker(
                initialCalendarMode: DatePickerMode.year,
                firstDate: _maximumAgeDate,
                lastDate: _minimumAgeDate,
                initialDate: _initialAgeDate,
                onDateChanged: (date) => setState(() {
                  _birthDay = date;
                  _birthDayStr = DateFormat('yMMMd', 'ko_KR').format(_birthDay);
                }),
              ),
              CustomRaisedButton(
                onPressed: _birthDay != null ? _submitNext : null,
                color: Colors.indigo,
                disableColor: Colors.grey[300],
                textColor: Colors.white,
                disableTextColor: Colors.white,
                borderRadius: 23,
                child: Text('계속', style: TextStyle(fontSize: 23)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
