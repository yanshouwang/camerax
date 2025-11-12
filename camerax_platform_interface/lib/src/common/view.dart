import 'package:flutter/widgets.dart';

abstract base class View {
  View.impl();

  Widget build(BuildContext context);
}
