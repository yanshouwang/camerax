import 'dart:io';

import 'package:camerax_example/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class InteractiveView extends StatelessWidget {
  final Uri uri;

  const InteractiveView({
    super.key,
    required this.uri,
  });

  @override
  Widget build(BuildContext context) {
    final file = File.fromUri(uri);
    return CupertinoPageScaffold(
      child: file.isVideo
          ? Center(
              child: InteractiveVideo.file(
                key: ValueKey(uri),
                file: file,
              ),
            )
          : InteractiveViewer(
              child: Center(
                child: Image.file(file),
              ),
            ),
    );
  }
}

class InteractiveVideo extends StatefulWidget {
  final File file;

  const InteractiveVideo.file({
    super.key,
    required this.file,
  });

  @override
  State<InteractiveVideo> createState() => _InteractiveVideoState();
}

class _InteractiveVideoState extends State<InteractiveVideo> {
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
                          bufferedColor: CupertinoTheme.of(context)
                              .primaryColor
                              .withValues(alpha: 0.3),
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
