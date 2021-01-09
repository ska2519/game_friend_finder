import 'package:flutter/material.dart';
import 'package:game_friend_finder/constants/colors.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SetGender extends StatefulWidget {
  @override
  _SetGenderState createState() => _SetGenderState();
}

class _SetGenderState extends State<SetGender> {
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
                '내 성별:',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
