import 'dart:ui';

import 'package:camerax_android_example/view_models.dart';
import 'package:camerax_android_example/widgets.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:clover/clover.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of<HomeViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PreviewWidget(
                  controller: viewModel.cameraController,
                  scaleType: ScaleType.fillCenter,
                ),
                ZoomWidget(
                  minimum: 1.0,
                  maximum: 10.0,
                  value: viewModel.zoomRatio,
                  onChanged: (value) {
                    viewModel.setZoomRatio(value);
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
                child: Material(
                  type: MaterialType.button,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  color: Theme.of(context).colorScheme.primary,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 24.0,
                      sigmaY: 24.0,
                    ),
                    child: SizedBox(
                      width: 48.0,
                      height: 48.0,
                      child: Icon(
                        Symbols.image,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                    color: Colors.white,
                  ),
                  shape: BoxShape.circle,
                ),
                child: AnimatedTapWidget(
                  duration: const Duration(milliseconds: 100),
                  child: Container(
                    margin: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              AnimatedTapWidget(
                duration: const Duration(milliseconds: 100),
                onTap: () {
                  viewModel.toggleLensFacing();
                },
                child: Material(
                  type: MaterialType.button,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  color: Theme.of(context).colorScheme.primary,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 24.0,
                      sigmaY: 24.0,
                    ),
                    child: SizedBox(
                      width: 48.0,
                      height: 48.0,
                      child: Icon(
                        viewModel.lensFacing == LensFacing.back
                            ? Symbols.camera_rear
                            : Symbols.camera_front,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
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
