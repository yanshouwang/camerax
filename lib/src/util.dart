import 'package:flutter/material.dart';

List<Offset> toCorners(List<dynamic> data) {
  return List.unmodifiable(data.map((e) => Offset(e['x'], e['y'])));
}
