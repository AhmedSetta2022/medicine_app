// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MedicineModel {
  final String NameofMedicine;
  final double Price;
  final String ImagePath;
  MedicineModel({
    required this.NameofMedicine,
    required this.Price,
    required this.ImagePath,
  });
}
