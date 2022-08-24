import 'package:flutter/widgets.dart';

import 'camera_view_builder.dart';
import 'constants.dart';

class CameraView extends StatelessWidget {
  final String id;

  const CameraView({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CameraViewBuilder.instance.build(
      id: id,
      viewType: '$uri/camera_view',
    );
  }
}
