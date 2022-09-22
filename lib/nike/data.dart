import 'package:flutter/material.dart';
import 'package:shopify/nike/nike.dart';

final listCategory = ["Basketball", "Runing", "Training"];

final listShoes = [
  Shoes(
    "Suite",
    "Coperate",
    "\$1200",
    2,
    [
      ImageShoes("assets/NASY1.jpg", Colors.blue.shade900),
      ImageShoes("assets/NASY2.jpg", Colors.grey.shade500),
    ],
  ),
   Shoes(
    "Jordan",
    "Non Coperate",
    "\$1000",
    2,
    [
      ImageShoes("assets/NZZY1.jpg", Colors.amber.shade900),
      ImageShoes("assets/NZZY2.jpg", Colors.grey.shade500),
    ],
  )
];
