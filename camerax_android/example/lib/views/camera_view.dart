import 'package:camerax_android_example/view_models.dart';
import 'package:camerax_android_example/widgets.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:clover/clover.dart';
import 'package:flutter/cupertino.dart';
import 'package:material_symbols_icons/symbols.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<CameraViewModel>(context);
    final zoomState = viewModel.zoomState;
    return CupertinoPageScaffold(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PreviewView(
                  controller: viewModel.controller,
                  scaleType: ScaleType.fillCenter,
                ),
                if (zoomState != null)
                  ZoomWidget(
                    minimum: zoomState.minZoomRatio,
                    maximum: zoomState.maxZoomRatio,
                    value: zoomState.zoomRatio,
                    onChanged: (value) {
                      viewModel.setZoomRatio(value).ignore();
                    },
                  ),
              ],
            ),
          ),
          const SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedTapWidget(
                duration: const Duration(milliseconds: 100),
                onTap: () {},
                child: Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CupertinoColors.quaternarySystemFill
                        .resolveFrom(context),
                  ),
                  child: Icon(
                    Symbols.image,
                    color: CupertinoColors.label.resolveFrom(context),
                  ),
                ),
              ),
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                    color: CupertinoColors.label.resolveFrom(context),
                  ),
                  shape: BoxShape.circle,
                ),
                child: AnimatedTapWidget(
                  duration: const Duration(milliseconds: 100),
                  child: Container(
                    margin: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CupertinoColors.label.resolveFrom(context),
                    ),
                  ),
                ),
              ),
              AnimatedTapWidget(
                duration: const Duration(milliseconds: 100),
                onTap: () {
                  viewModel.toggleLensFacing();
                },
                child: Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CupertinoColors.quaternarySystemFill
                        .resolveFrom(context),
                  ),
                  child: FlipWidget(
                    duration: const Duration(milliseconds: 100),
                    front: Icon(
                      Symbols.camera_front,
                      color: CupertinoColors.label.resolveFrom(context),
                    ),
                    back: Transform.flip(
                      flipX: true,
                      child: Icon(
                        Symbols.camera_rear,
                        color: CupertinoColors.label.resolveFrom(context),
                      ),
                    ),
                    flip: viewModel.lensFacing == LensFacing.back,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
