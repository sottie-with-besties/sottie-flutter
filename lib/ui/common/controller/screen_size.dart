import 'package:flutter/material.dart';

double wu = 1;
double hu = 1;

void initSize(BuildContext context) {
  wu = MediaQuery.of(context).size.width / 320;
  hu = MediaQuery.of(context).size.height / 690;
}
