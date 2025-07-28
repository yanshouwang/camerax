import 'dart:io';

import 'package:camerax_example/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class Thumbnail extends StatelessWidget {
  final Uri uri;

  const Thumbnail({
    super.key,
    required this.uri,
  });

  @override
  Widget build(BuildContext context) {
    final file = File.fromUri(uri);
    if (file.isVideo) {
      return Video.file(
        key: ValueKey(uri),
        file: file,
        fit: BoxFit.cover,
      );
    } else {
      return Image.file(
        file,
        fit: BoxFit.cover,
      );
    }
  }
}

class Video extends StatefulWidget {
  final File file;
  final BoxFit? fit;

  const Video.file({
    super.key,
    required this.file,
    this.fit,
  });

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late final VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(
      widget.file,
    )..initialize();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _controller,
      builder: (context, videoPlayerValue, child) {
        if (videoPlayerValue.isInitialized) {
          return FittedBox(
            fit: widget.fit ?? BoxFit.scaleDown,
            child: SizedBox.fromSize(
              size: videoPlayerValue.size,
              child: VideoPlayer(_controller),
            ),
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
