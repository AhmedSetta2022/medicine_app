import 'package:flutter/material.dart';

void SnakeBarMessege(BuildContext context, String Messege) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(Messege)));
}
