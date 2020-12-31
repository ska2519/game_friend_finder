import 'package:flutter/material.dart';
import 'package:custom_buttons/custom_buttons.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    Key key,
    @required String assetName,
    @required String text,
    @required VoidCallback onPressed,
    Color color,
    Color textColor,
  })  : assert(assetName != null),
        assert(text != null),
        super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(assetName),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 15.0,
                ),
              ),
              Opacity(
                opacity: 0,
                child: Image.asset(assetName),
              ),
            ],
          ),
          color: color,
          borderRadius: 8.0,
          onPressed: onPressed,
        );
}
