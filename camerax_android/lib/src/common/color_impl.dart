import 'dart:ui';

extension ColorX on Color {
  int get api => toARGB32();
}
