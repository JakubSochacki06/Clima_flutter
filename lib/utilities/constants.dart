import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Outfit-Bold',
  fontSize: 24,
  color: Color(0xFF34374C),
  fontWeight: FontWeight.w700,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kNowTextStyle = TextStyle(
  fontSize: 12,
  fontFamily: 'Outfit-Medium',
  fontWeight: FontWeight.w500,
  color: Color(0xFF34374C),
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter city name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10),),
    borderSide: BorderSide.none,
  ),
);

const kDateTextStyle = TextStyle(
  fontSize: 24
);

