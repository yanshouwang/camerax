// import 'dart:async';

// import 'package:flutter/widgets.dart';
// import 'package:hybrid_v4l2/hybrid_v4l2.dart';

// import 'camera_controller.dart';

// class PlatformView extends StatefulWidget {
//   final CameraControllerImpl controller;

//   const PlatformView({
//     super.key,
//     required this.controller,
//   });

//   @override
//   State<PlatformView> createState() => _PlatformViewState();
// }

// class _PlatformViewState extends State<PlatformView> {
//   late final ValueNotifier<V4L2TextureArgs?> textureArgs;
//   late final StreamSubscription textureChangedSubscription;

//   @override
//   void initState() {
//     super.initState();
//     textureArgs = ValueNotifier(null);

//     textureChangedSubscription = widget.controller.textureChanged.listen(
//       (textureArgs) => this.textureArgs.value = textureArgs,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: textureArgs,
//       builder: (context, textureArgs, child) {
//         return V4L2TextureView(
//           args: textureArgs,
//           fpsVisible: true,
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     textureChangedSubscription.cancel();

//     textureArgs.dispose();
//     super.dispose();
//   }
// }
