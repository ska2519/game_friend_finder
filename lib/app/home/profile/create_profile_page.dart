import 'package:custom_buttons/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:game_friend_finder/app/home/profile/set_birthday.dart';
import 'package:game_friend_finder/constants/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/strings.dart';
import '../../../models/userProfile.dart';

import '../../top_level_providers.dart';

class CreateProfilePage extends StatefulWidget {
  @override
  _CreateProfilePageState createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  String _name = '';
  final TextEditingController _textController = TextEditingController();

  _submitNext() => Navigator.push(
      context, MaterialPageRoute(builder: (context) => SetBirthday()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: appbarColor, elevation: 0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '내 닉네임:',
                style: Theme.of(context).textTheme.headline4,
              ),
              TextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  maxLength: 10,
                  controller: _textController,
                  decoration: const InputDecoration.collapsed(
                      hintText: '${Strings.gameFrindFinder} 프로필에 표시되는 이름',
                      hintStyle:
                          const TextStyle(fontSize: 17, color: Colors.grey),
                      border: UnderlineInputBorder()),
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                  onChanged: (name) {
                    setState(() {
                      _name = name;
                      _textController.selection = TextSelection.fromPosition(
                          TextPosition(offset: _textController.text.length));
                    });
                  }),
              Text(
                '${Strings.gameFrindFinder} 프로필에 표시되는 이름으로,\n이후 변경할 수 없습니다.',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              CustomRaisedButton(
                onPressed: _name.length >= 3 ? _submitNext : null,
                color: Colors.indigo,
                disableColor: Colors.grey[300],
                textColor: Colors.white,
                disableTextColor: Colors.white,
                borderRadius: 23,
                child: Text(
                  '계속',
                  style: TextStyle(fontSize: 23),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // UserProfile _userProfileromState() {
  //   final start = DateTime(_startDate.year, _startDate.month, _startDate.day,
  //       _startTime.hour, _startTime.minute);
  //   final end = DateTime(_endDate.year, _endDate.month, _endDate.day,
  //       _endTime.hour, _endTime.minute);
  //   final id = widget.entry?.id ?? documentIdFromCurrentDate();
  //   return Entry(
  //     id: id,
  //     jobId: widget.job.id,
  //     start: start,
  //     end: end,
  //     comment: _comment,
  //   );
  // }

  //method도 function 중 하나
  Future _createProfile() async {
    final database = context.read(databaseProvider);
    await database.setUserProfile(UserProfile(
      name: _name,
    ));
  }
}
