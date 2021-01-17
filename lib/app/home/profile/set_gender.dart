import 'package:custom_buttons/custom_buttons.dart';
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
              Text('성별:', style: Theme.of(context).textTheme.headline4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    child: Text('여성'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                    onPressed: () {},
                  ),
                  OutlinedButton(
                    child: Text('남성'),
                    onPressed: () {},
                  )
                ],
              ),
              CustomRaisedButton(
                onPressed: null,
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
