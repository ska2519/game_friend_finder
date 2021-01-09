import 'package:custom_buttons/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:game_friend_finder/constants/colors.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SetBirthday extends StatefulWidget {
  @override
  _SetBirthdayState createState() => _SetBirthdayState();
}

class _SetBirthdayState extends State<SetBirthday> {
  String _birthday = '';
  final TextEditingController _textController = TextEditingController();

  _submitNext() => Navigator.push(
      context, MaterialPageRoute(builder: (context) => SetBirthday()));
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
              Text(
                '내 생일:',
                style: Theme.of(context).textTheme.headline4,
              ),
              Column(
                children: [
                  TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      maxLength: 8,
                      controller: _textController,
                      decoration: const InputDecoration(
                          hintText: '2 0 0 0 / M M / D D',
                          hintStyle: const TextStyle(
                              fontSize: 17, color: Colors.grey)),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                      onChanged: (birthday) {
                        setState(() {
                          _birthday = birthday;
                          _textController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: _textController.text.length));
                        });
                      }),
                  SizedBox(height: 3),
                  Text(
                    '나이는 공개됩니다.',
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
              CustomRaisedButton(
                onPressed: _birthday.length >= 8 ? _submitNext : null,
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
}
