import 'package:flutter/material.dart';

final whitecolor = Colors.white;
final greens = const Color(0xff4e9c81);
final greenm = const Color(0xff358873);
final greenl = const Color(0xff207567);

final maingradient = LinearGradient(
  begin: Alignment(-1.0, -0.59),
  end: Alignment(1.0, 0.0),
  colors: [greens, greenm, greenl],
  stops: [0.0, 0.519, 1.0],
);
