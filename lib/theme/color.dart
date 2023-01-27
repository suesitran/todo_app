import 'package:flutter/material.dart';

const MaterialColor primarySwatch = MaterialColor(
  0xff3F4EA0, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
  <int, Color>{
    50: Color(0x193F4EA0),//10%
    100: Color(0x333F4EA0),//20%
    200: Color(0x4C3F4EA0),//30%
    300: Color(0x663F4EA0),//40%
    400: Color(0x7f3F4EA0),//50%
    500: Color(0x993F4EA0),//60%
    600: Color(0xB23F4EA0),//70%
    700: Color(0xCC3F4EA0),//80%
    800: Color(0xE53F4EA0),//90%
    900: Color(0xff3F4EA0),//100%
  },
);