import 'dart:io';
import 'dart:ui' as ui;

import 'package:camerax/camerax.dart' hide AspectRatio;
import 'package:camerax_example/util.dart';
import 'package:camerax_example/view_models.dart';
import 'package:clover/clover.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class InteractiveView extends StatelessWidget {
  const InteractiveView({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = MediaQuery.devicePixelRatioOf(context);
    final viewModel = ViewModel.of<InteractiveViewModel>(context);
    final uri = viewModel.uri;
    final visionObjects = viewModel.visionObjects;
    final file = File.fromUri(uri);
    return CupertinoPageScaffold(
      navigationBar: file.isVideo
          ? null
          : CupertinoNavigationBar(
              trailing: CupertinoButton(
                onPressed: () => viewModel.detect(),
                child: Icon(CupertinoIcons.eye),
              ),
            ),
      child: SafeArea(
        child: file.isVideo
            ? Center(
                child: InteractiveVideo.file(key: ValueKey(uri), file: file),
              )
            : InteractiveViewer(
                child: Center(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.file(file),
                      FutureBuilder(
                        future: Future(() async {
                          final path = uri.toFilePath();
                          final buffer = await ui.ImmutableBuffer.fromFilePath(
                            path,
                          );
                          final descriptor = await ui.ImageDescriptor.encoded(
                            buffer,
                          );
                          final width = descriptor.width / ratio;
                          final height = descriptor.height / ratio;
                          return Size(width, height);
                        }),
                        builder: (context, snapshot) {
                          final size = snapshot.data;
                          if (size == null) return Offstage();
                          return FittedBox(
                            fit: BoxFit.contain,
                            child: CustomPaint(
                              painter: VisionObjectsPainter(visionObjects),
                              size: ui.Size(size.width, size.height),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class InteractiveVideo extends StatefulWidget {
  final File file;

  const InteractiveVideo.file({super.key, required this.file});

  @override
  State<InteractiveVideo> createState() => _InteractiveVideoState();
}

class _InteractiveVideoState extends State<InteractiveVideo> {
  late final VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.file)..initialize();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _controller,
      builder: (context, videoPlayerValue, child) {
        if (videoPlayerValue.isInitialized) {
          return Column(
            children: [
              const Spacer(),
              AspectRatio(
                aspectRatio: videoPlayerValue.aspectRatio,
                child: VideoPlayer(_controller),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CupertinoButton(
                      onPressed: () {
                        if (videoPlayerValue.isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                      },
                      child: Icon(
                        videoPlayerValue.isPlaying
                            ? CupertinoIcons.pause_solid
                            : CupertinoIcons.play_arrow_solid,
                      ),
                    ),
                    Expanded(
                      child: VideoProgressIndicator(
                        _controller,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                          playedColor: CupertinoTheme.of(context).primaryColor,
                          bufferedColor: CupertinoTheme.of(
                            context,
                          ).primaryColor.withValues(alpha: 0.3),
                        ),
                        padding: const EdgeInsets.only(
                          top: 20.0,
                          right: 20.0,
                          bottom: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const Offstage();
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class VisionObjectsPainter extends CustomPainter {
  final List<VisionObject> visionObjects;

  VisionObjectsPainter(this.visionObjects);

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = CupertinoColors.systemOrange;
    for (var visionObject in visionObjects) {
      final corners = visionObject.$uiCorners(size.width, size.height);
      // canvas.drawPoints(ui.PointMode.polygon, corners, paint);
      final path = Path()..addPolygon(corners, true);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is! VisionObjectsPainter ||
        oldDelegate.visionObjects != visionObjects;
  }
}

extension on VisionObject {
  List<ui.Offset> $uiCorners(double scaleX, double scaleY) {
    final visionObject = this;
    if (visionObject is VisionMachineReadableCodeObject) {
      return visionObject.corners.map((e) => e.$ui(scaleX, scaleY)).toList();
    }
    final bounds = visionObject.bounds;
    final left = bounds.left;
    final top = bounds.top;
    final right = bounds.right;
    final bottom = bounds.bottom;
    return [
      ui.Offset(left, top).scale(scaleX, scaleY),
      ui.Offset(right, top).scale(scaleX, scaleY),
      ui.Offset(right, bottom).scale(scaleX, scaleY),
      ui.Offset(left, bottom).scale(scaleX, scaleY),
    ];
  }
}

extension on Point<double> {
  ui.Offset $ui(double scaleX, double scaleY) =>
      ui.Offset(x, y).scale(scaleX, scaleY);
}
