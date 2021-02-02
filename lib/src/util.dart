import 'package:flutter/material.dart';

List<Offset> toCorners(List<dynamic> data) {
  return data?.map((e) => Offset(e['x'], e['y']))?.toList();
}
