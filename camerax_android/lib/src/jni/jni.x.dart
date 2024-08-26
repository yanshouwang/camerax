import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:camerax_android/src/core.dart';
import 'package:camerax_android/src/ml.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:hybrid_os/hybrid_os.dart';
import 'package:jni/jni.dart';

import 'android/_package.dart' as jni;
import 'android/app/_package.dart' as jni;
import 'android/content/_package.dart' as jni;
import 'android/graphics/_package.dart' as jni;
import 'android/net/_package.dart' as jni;
import 'android/util/_package.dart' as jni;
import 'androidx/camera/core/_package.dart' as jni;
import 'androidx/camera/core/resolutionselector/_package.dart' as jni;
import 'androidx/camera/video/_package.dart' as jni;
import 'androidx/camera/view/_package.dart' as jni;
import 'androidx/camera/view/video/_package.dart' as jni;
import 'androidx/core/util/_package.dart' as jni;
import 'androidx/lifecycle/_package.dart' as jni;
import 'com/google/common/util/concurrent/_package.dart' as jni;
import 'com/google/mlkit/vision/barcode/_package.dart' as jni;
import 'com/google/mlkit/vision/barcode/common/_package.dart' as jni;
import 'com/google/mlkit/vision/face/_package.dart' as jni;
import 'com/google/mlkit/vision/interfaces/_package.dart' as jni;
import 'dev/hebei/camerax_android/_package.dart' as jni;
import 'java/util/concurrent/_package.dart' as jni;

abstract class MyJNI {
  static jni.Activity get activity {
    final reference = Jni.getCurrentActivity();
    return jni.Activity.fromReference(reference);
  }

  static jni.Context get context {
    return activity.castTo(jni.Context.type);
  }
}

extension AuthorizationTypeX on AuthorizationType {
  JArray<JString> get jniValue {
    switch (this) {
      case AuthorizationType.video:
        final permissions = JArray(JString.type, 1);
        permissions[0] = jni.Manifest_permission.CAMERA;
        return permissions;
      case AuthorizationType.audio:
        final permissions = JArray(JString.type, 1);
        permissions[0] = jni.Manifest_permission.RECORD_AUDIO;
        return permissions;
      case AuthorizationType.album:
        final os = OS();
        if (os is Android && os.sdkVersion < AndroidSDKVersions.q) {
          final permissions = JArray(JString.type, 2);
          permissions[0] = jni.Manifest_permission.READ_EXTERNAL_STORAGE;
          permissions[0] = jni.Manifest_permission.WRITE_EXTERNAL_STORAGE;
          return permissions;
        } else {
          return JArray(JString.type, 0);
        }
    }
  }
}

extension LensFacingX on LensFacing {
  int get jniValue {
    switch (this) {
      case LensFacing.front:
        return jni.CameraSelector.LENS_FACING_FRONT;
      case LensFacing.back:
        return jni.CameraSelector.LENS_FACING_BACK;
      case LensFacing.external:
        return jni.CameraSelector.LENS_FACING_EXTERNAL;
    }
  }
}

extension ScaleTypeX on ScaleType {
  jni.MyPreviewView_MyScaleType get jniValue {
    switch (this) {
      case ScaleType.fillCenter:
        return jni.MyPreviewView_MyScaleType.FILL_CENTER;
      case ScaleType.fillStart:
        return jni.MyPreviewView_MyScaleType.FILL_START;
      case ScaleType.fillEnd:
        return jni.MyPreviewView_MyScaleType.FILL_END;
      case ScaleType.fitCenter:
        return jni.MyPreviewView_MyScaleType.FIT_CENTER;
      case ScaleType.fitStart:
        return jni.MyPreviewView_MyScaleType.FIT_START;
      case ScaleType.fitEnd:
        return jni.MyPreviewView_MyScaleType.FIT_END;
    }
  }
}

extension FlashModeX on FlashMode {
  int get jniValue {
    switch (this) {
      case FlashMode.auto:
        return jni.MyImageCapture.FLASH_MODE_AUTO;
      case FlashMode.on:
        return jni.MyImageCapture.FLASH_MODE_ON;
      case FlashMode.off:
        return jni.MyImageCapture.FLASH_MODE_OFF;
    }
  }
}

extension CaptureModeX on CaptureMode {
  int get jniValue {
    switch (this) {
      case CaptureMode.maximizeQuality:
        return jni.MyImageCapture.CAPTURE_MODE_MAXIMIZE_QUALITY;
      case CaptureMode.minimizeLatency:
        return jni.MyImageCapture.CAPTURE_MODE_MINIMIZE_LATENCY;
    }
  }
}

extension AspectRatioX on AspectRatio {
  int get jniValue {
    switch (this) {
      case AspectRatio.withDefault:
        return jni.AspectRatio.RATIO_DEFAULT;
      case AspectRatio.with_4_3:
        return jni.AspectRatio.RATIO_4_3;
      case AspectRatio.with_16_9:
        return jni.AspectRatio.RATIO_16_9;
    }
  }
}

extension AspectRatioFallbackRuleX on AspectRatioFallbackRule {
  int get jniValue {
    switch (this) {
      case AspectRatioFallbackRule.none:
        return jni.AspectRatioStrategy.FALLBACK_RULE_NONE;
      case AspectRatioFallbackRule.auto:
        return jni.AspectRatioStrategy.FALLBACK_RULE_AUTO;
    }
  }
}

extension AspectRatioStrategyX on AspectRatioStrategy {
  jni.AspectRatioStrategy get jniValue {
    switch (this) {
      case AspectRatioStrategy.ratio4_3FallbackAutoStrategy:
        return jni.AspectRatioStrategy.RATIO_4_3_FALLBACK_AUTO_STRATEGY;
      case AspectRatioStrategy.ratio16_9FallbackAutoStrategy:
        return jni.AspectRatioStrategy.RATIO_16_9_FALLBACK_AUTO_STRATEGY;
      default:
        return jni.AspectRatioStrategy(
          preferredAspectRatio.jniValue,
          fallbackRule.jniValue,
        );
    }
  }
}

extension ResolutionModeX on ResolutionMode {
  int get jniValue {
    switch (this) {
      case ResolutionMode.preferCaptureRateOverHigherResolution:
        return jni
            .ResolutionSelector.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION;
      case ResolutionMode.preferHigherResolutionOverCaptureRate:
        return jni
            .ResolutionSelector.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE;
    }
  }
}

extension ResolutionFilterX on ResolutionFilter {
  jni.ResolutionFilter get jniValue {
    return jni.ResolutionFilter.implement(
      jni.$ResolutionFilterImpl(
        filter: (supportedSizes, rotationDegrees) {
          final sizes = this(
            supportedSizes.map((size) => size.dartValue).toList(),
            rotationDegrees,
          ).map((size) => size.jniValue).toJList(jni.Size.type);
          return sizes;
        },
      ),
    );
  }
}

extension ResolutionStrategyX on ResolutionStrategy {
  jni.ResolutionStrategy get jniValue {
    if (this == ResolutionStrategy.highestAvailableStrategy) {
      return jni.ResolutionStrategy.HIGHEST_AVAILABLE_STRATEGY;
    }
    final boundSize = this.boundSize;
    if (boundSize == null) {
      throw ArgumentError.notNull('boundSize');
    }
    return jni.ResolutionStrategy(boundSize.jniValue, fallbackRule.jniValue);
  }
}

extension ResolutionFallbackRuleX on ResolutionFallbackRule {
  int get jniValue {
    switch (this) {
      case ResolutionFallbackRule.none:
        return jni.ResolutionStrategy.FALLBACK_RULE_NONE;
      case ResolutionFallbackRule.closestHigherThenLower:
        return jni.ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER_THEN_LOWER;
      case ResolutionFallbackRule.closestHigher:
        return jni.ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER;
      case ResolutionFallbackRule.closestLowerThenHigher:
        return jni.ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER_THEN_HIGHER;
      case ResolutionFallbackRule.closestLower:
        return jni.ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER;
    }
  }
}

extension SizeX on ui.Size {
  jni.Size get jniValue {
    return jni.Size(
      width.toInt(),
      height.toInt(),
    );
  }
}

extension BackpressureStrategyX on BackpressureStrategy {
  int get jniValue {
    switch (this) {
      case BackpressureStrategy.keepOnlyLatest:
        return jni.MyImageAnalysis.STRATEGY_KEEP_ONLY_LATEST;
      case BackpressureStrategy.blockProducer:
        return jni.MyImageAnalysis.STRATEGY_BLOCK_PRODUCER;
    }
  }
}

extension CoordinateSystemX on CoordinateSystem {
  int get jniValue {
    switch (this) {
      case CoordinateSystem.original:
        return jni.MyImageAnalysis.COORDINATE_SYSTEM_ORIGINAL;
      case CoordinateSystem.viewReferenced:
        return jni.MyImageAnalysis.COORDINATE_SYSTEM_VIEW_REFERENCED;
      case CoordinateSystem.sensor:
        return jni.MyImageAnalysis.COORDINATE_SYSTEM_SENSOR;
    }
  }
}

extension DynamicRangeX on DynamicRange {
  jni.DynamicRange get jniValue {
    switch (this) {
      case DynamicRange.unspecifid:
        return jni.DynamicRange.UNSPECIFIED;
      case DynamicRange.sdr:
        return jni.DynamicRange.SDR;
      case DynamicRange.hdrUnspecified_10Bit:
        return jni.DynamicRange.HDR_UNSPECIFIED_10_BIT;
      case DynamicRange.hlg_10Bit:
        return jni.DynamicRange.HLG_10_BIT;
      case DynamicRange.hdr10_10Bit:
        return jni.DynamicRange.HDR10_10_BIT;
      case DynamicRange.dolbyVision_8Bit:
        return jni.DynamicRange.HDR10_PLUS_10_BIT;
      case DynamicRange.hdr10Plus_10Bit:
        return jni.DynamicRange.DOLBY_VISION_8_BIT;
      case DynamicRange.dolbyVision_10Bit:
        return jni.DynamicRange.DOLBY_VISION_10_BIT;
      default:
        return jni.DynamicRange(encoding.jniValue, bitDepth.jniValue);
    }
  }
}

extension EncodingX on Encoding {
  int get jniValue {
    switch (this) {
      case Encoding.unspecified:
        return jni.DynamicRange.ENCODING_UNSPECIFIED;
      case Encoding.sdr:
        return jni.DynamicRange.ENCODING_SDR;
      case Encoding.hdrUnspecified:
        return jni.DynamicRange.ENCODING_HDR_UNSPECIFIED;
      case Encoding.hlg:
        return jni.DynamicRange.ENCODING_HLG;
      case Encoding.hdr10:
        return jni.DynamicRange.ENCODING_HDR10;
      case Encoding.hdr10Plus:
        return jni.DynamicRange.ENCODING_HDR10_PLUS;
      case Encoding.dolbyVision:
        return jni.DynamicRange.ENCODING_DOLBY_VISION;
    }
  }
}

extension BitDepthX on BitDepth {
  int get jniValue {
    switch (this) {
      case BitDepth.unspecified:
        return jni.DynamicRange.BIT_DEPTH_UNSPECIFIED;
      case BitDepth.with_8Bit:
        return jni.DynamicRange.BIT_DEPTH_8_BIT;
      case BitDepth.with_10Bit:
        return jni.DynamicRange.BIT_DEPTH_10_BIT;
    }
  }
}

extension MirrorModeX on MirrorMode {
  int get jniValue {
    switch (this) {
      case MirrorMode.off:
        return jni.MirrorMode.MIRROR_MODE_OFF;
      case MirrorMode.on:
        return jni.MirrorMode.MIRROR_MODE_ON;
      case MirrorMode.onFrontOnly:
        return jni.MirrorMode.MIRROR_MODE_ON_FRONT_ONLY;
    }
  }
}

extension QualityX on Quality {
  jni.Quality get jniValue {
    switch (this) {
      case Quality.sd:
        return jni.Quality.SD;
      case Quality.hd:
        return jni.Quality.HD;
      case Quality.fhd:
        return jni.Quality.FHD;
      case Quality.uhd:
        return jni.Quality.UHD;
      case Quality.lowest:
        return jni.Quality.LOWEST;
      case Quality.highest:
        return jni.Quality.HIGHEST;
    }
  }
}

extension AnalyzerX on Analyzer {
  JObject get jniValue {
    final analyzer = this;
    if (analyzer is MyMLAnalyzer) {
      return analyzer.jniValue;
    } else {
      return jni.MyImageAnalysis_MyAnalyzerImpl(
        jni.MyImageAnalysis_MyAnalyzer.implement(
          jni.$MyImageAnalysis_MyAnalyzerImpl(
            analyze: (jniImageProxy) {
              final imageProxy = MyImageProxy.jni(jniImageProxy);
              analyzer.analyze(imageProxy);
            },
          ),
        ),
      );
    }
  }
}

extension ImageFormatX on ImageFormat {
  int get jniValue {
    switch (this) {
      case ImageFormat.yuv_420_888:
        return jni.MyImageAnalysis.OUTPUT_IMAGE_FORMAT_YUV_420_888;
      case ImageFormat.rgba_8888:
        return jni.MyImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888;
    }
  }
}

extension MLObjectTypeX on MLObjectType {
  int get jniValue {
    switch (this) {
      case MLObjectType.codabar:
        return jni.Barcode.FORMAT_CODABAR;
      case MLObjectType.code39:
        return jni.Barcode.FORMAT_CODE_39;
      case MLObjectType.code93:
        return jni.Barcode.FORMAT_CODE_93;
      case MLObjectType.code128:
        return jni.Barcode.FORMAT_CODE_128;
      case MLObjectType.ean8:
        return jni.Barcode.FORMAT_EAN_8;
      case MLObjectType.ean13:
        return jni.Barcode.FORMAT_EAN_13;
      case MLObjectType.itf14:
        return jni.Barcode.FORMAT_ITF;
      case MLObjectType.upcE:
        return jni.Barcode.FORMAT_UPC_E;
      case MLObjectType.aztec:
        return jni.Barcode.FORMAT_AZTEC;
      case MLObjectType.dataMatrix:
        return jni.Barcode.FORMAT_DATA_MATRIX;
      case MLObjectType.pdf417:
        return jni.Barcode.FORMAT_PDF417;
      case MLObjectType.qr:
        return jni.Barcode.FORMAT_QR_CODE;
      default:
        return jni.Barcode.FORMAT_UNKNOWN;
    }
  }
}

extension MLObjectTypeListX on List<MLObjectType> {
  JList<jni.Detector> get jniValue {
    final detectors = <jni.Detector>[];
    final formats = map((type) => type.jniValue)
        .where((format) => format != jni.Barcode.FORMAT_UNKNOWN)
        .toList();
    if (formats.isNotEmpty) {
      final format = formats.first;
      final moreFormats = JArray(jint.type, formats.length - 1);
      moreFormats.setRange(0, formats.length - 1, formats, 1);
      final options = jni.BarcodeScannerOptions_Builder()
          .setBarcodeFormats(format, moreFormats)
          .build();
      final detector = jni.BarcodeScanning.getClient1(options).castTo(
        jni.Detector.type(
          JList.type(jni.Barcode.type),
        ),
      );
      detectors.add(detector);
    }
    for (var type in this) {
      switch (type) {
        case MLObjectType.face:
          final options = jni.FaceDetectorOptions_Builder()
              .setPerformanceMode(
                  jni.FaceDetectorOptions.PERFORMANCE_MODE_ACCURATE)
              .enableTracking()
              .build();
          final detector = jni.FaceDetection.getClient1(options).castTo(
            jni.Detector.type(
              JList.type(jni.Face.type),
            ),
          );
          detectors.add(detector);
        default:
          break;
      }
    }
    return detectors.toJList(jni.Detector.type(JObject.type));
  }
}

// ignore: camel_case_extensions
extension intX on int {
  FlashMode get dartFlashMode {
    switch (this) {
      case jni.MyImageCapture.FLASH_MODE_AUTO:
        return FlashMode.auto;
      case jni.MyImageCapture.FLASH_MODE_ON:
        return FlashMode.on;
      case jni.MyImageCapture.FLASH_MODE_OFF:
        return FlashMode.off;
      default:
        throw ArgumentError.value(this);
    }
  }

  CaptureMode get dartCaptureMode {
    switch (this) {
      case jni.MyImageCapture.CAPTURE_MODE_MAXIMIZE_QUALITY:
        return CaptureMode.maximizeQuality;
      case jni.MyImageCapture.CAPTURE_MODE_MINIMIZE_LATENCY:
        return CaptureMode.minimizeLatency;
      default:
        throw ArgumentError.value(this);
    }
  }

  AspectRatio get dartAspectRatio {
    switch (this) {
      case jni.AspectRatio.RATIO_DEFAULT:
        return AspectRatio.withDefault;
      case jni.AspectRatio.RATIO_4_3:
        return AspectRatio.with_4_3;
      case jni.AspectRatio.RATIO_16_9:
        return AspectRatio.with_16_9;
      default:
        throw ArgumentError.value(this);
    }
  }

  AspectRatioFallbackRule get dartAspectRatioFallbackRule {
    switch (this) {
      case jni.AspectRatioStrategy.FALLBACK_RULE_NONE:
        return AspectRatioFallbackRule.none;
      case jni.AspectRatioStrategy.FALLBACK_RULE_AUTO:
        return AspectRatioFallbackRule.auto;
      default:
        throw ArgumentError.value(this);
    }
  }

  ResolutionMode get dartResolutionMode {
    switch (this) {
      case jni.ResolutionSelector.PREFER_CAPTURE_RATE_OVER_HIGHER_RESOLUTION:
        return ResolutionMode.preferCaptureRateOverHigherResolution;
      case jni.ResolutionSelector.PREFER_HIGHER_RESOLUTION_OVER_CAPTURE_RATE:
        return ResolutionMode.preferHigherResolutionOverCaptureRate;
      default:
        throw ArgumentError.value(this);
    }
  }

  ResolutionFallbackRule get dartResolutionFallbackRule {
    switch (this) {
      case jni.ResolutionStrategy.FALLBACK_RULE_NONE:
        return ResolutionFallbackRule.none;
      case jni.ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER_THEN_LOWER:
        return ResolutionFallbackRule.closestHigherThenLower;
      case jni.ResolutionStrategy.FALLBACK_RULE_CLOSEST_HIGHER:
        return ResolutionFallbackRule.closestHigher;
      case jni.ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER_THEN_HIGHER:
        return ResolutionFallbackRule.closestLowerThenHigher;
      case jni.ResolutionStrategy.FALLBACK_RULE_CLOSEST_LOWER:
        return ResolutionFallbackRule.closestLower;
      default:
        throw ArgumentError.value(this);
    }
  }

  BackpressureStrategy get dartBackpressureStrategy {
    switch (this) {
      case jni.MyImageAnalysis.STRATEGY_KEEP_ONLY_LATEST:
        return BackpressureStrategy.keepOnlyLatest;
      case jni.MyImageAnalysis.STRATEGY_BLOCK_PRODUCER:
        return BackpressureStrategy.blockProducer;
      default:
        throw ArgumentError.value(this);
    }
  }

  Encoding get dartEncoding {
    switch (this) {
      case jni.DynamicRange.ENCODING_UNSPECIFIED:
        return Encoding.unspecified;
      case jni.DynamicRange.ENCODING_SDR:
        return Encoding.sdr;
      case jni.DynamicRange.ENCODING_HDR_UNSPECIFIED:
        return Encoding.hdrUnspecified;
      case jni.DynamicRange.ENCODING_HLG:
        return Encoding.hlg;
      case jni.DynamicRange.ENCODING_HDR10:
        return Encoding.hdr10;
      case jni.DynamicRange.ENCODING_HDR10_PLUS:
        return Encoding.hdr10Plus;
      case jni.DynamicRange.ENCODING_DOLBY_VISION:
        return Encoding.dolbyVision;
      default:
        throw ArgumentError.value(this);
    }
  }

  BitDepth get dartBitDepth {
    switch (this) {
      case jni.DynamicRange.BIT_DEPTH_UNSPECIFIED:
        return BitDepth.unspecified;
      case jni.DynamicRange.BIT_DEPTH_8_BIT:
        return BitDepth.with_8Bit;
      case jni.DynamicRange.BIT_DEPTH_10_BIT:
        return BitDepth.with_10Bit;
      default:
        throw ArgumentError.value(this);
    }
  }

  MirrorMode get dartMirrorMode {
    switch (this) {
      case jni.MirrorMode.MIRROR_MODE_OFF:
        return MirrorMode.off;
      case jni.MirrorMode.MIRROR_MODE_ON:
        return MirrorMode.on;
      case jni.MirrorMode.MIRROR_MODE_ON_FRONT_ONLY:
        return MirrorMode.onFrontOnly;
      default:
        throw ArgumentError.value(this);
    }
  }

  ImageFormat get dartImageFormat {
    switch (this) {
      case jni.ImageFormat.YUV_420_888:
        return ImageFormat.yuv_420_888;
      case jni.PixelFormat.RGBA_8888:
        return ImageFormat.rgba_8888;
      default:
        throw ArgumentError.value(this);
    }
  }

  ImageFormat get dartOutputImageFormat {
    switch (this) {
      case jni.MyImageAnalysis.OUTPUT_IMAGE_FORMAT_YUV_420_888:
        return ImageFormat.yuv_420_888;
      case jni.MyImageAnalysis.OUTPUT_IMAGE_FORMAT_RGBA_8888:
        return ImageFormat.rgba_8888;
      default:
        throw ArgumentError.value(this);
    }
  }

  MLObjectType get jniMLCodeType {
    switch (this) {
      case jni.Barcode.FORMAT_CODABAR:
        return MLObjectType.codabar;
      case jni.Barcode.FORMAT_CODE_39:
        return MLObjectType.code39;
      case jni.Barcode.FORMAT_CODE_93:
        return MLObjectType.code93;
      case jni.Barcode.FORMAT_CODE_128:
        return MLObjectType.code128;
      case jni.Barcode.FORMAT_EAN_8:
        return MLObjectType.ean8;
      case jni.Barcode.FORMAT_EAN_13:
        return MLObjectType.ean13;
      case jni.Barcode.FORMAT_ITF:
        return MLObjectType.itf14;
      case jni.Barcode.FORMAT_UPC_A:
        return MLObjectType.upcA;
      case jni.Barcode.FORMAT_UPC_E:
        return MLObjectType.upcE;
      case jni.Barcode.FORMAT_AZTEC:
        return MLObjectType.aztec;
      case jni.Barcode.FORMAT_DATA_MATRIX:
        return MLObjectType.dataMatrix;
      case jni.Barcode.FORMAT_PDF417:
        return MLObjectType.pdf417;
      case jni.Barcode.FORMAT_QR_CODE:
        return MLObjectType.qr;
      default:
        throw ArgumentError.value(this);
    }
  }
}

extension JNIZoomStateX on jni.ZoomState {
  ZoomState get dartValue {
    final minZoomRatio = getMinZoomRatio();
    final maxZoomRatio = getMaxZoomRatio();
    final linearZoom = getLinearZoom();
    final zoomRatio = getZoomRatio();
    return ZoomState(
      minZoomRatio: minZoomRatio,
      maxZoomRatio: maxZoomRatio,
      zoomRatio: zoomRatio,
      linearZoom: linearZoom,
    );
  }
}

extension JNIAspectRatioStrategyX on jni.AspectRatioStrategy {
  AspectRatioStrategy get dartValue {
    if (this == jni.AspectRatioStrategy.RATIO_4_3_FALLBACK_AUTO_STRATEGY) {
      return AspectRatioStrategy.ratio4_3FallbackAutoStrategy;
    }
    if (this == jni.AspectRatioStrategy.RATIO_16_9_FALLBACK_AUTO_STRATEGY) {
      return AspectRatioStrategy.ratio16_9FallbackAutoStrategy;
    }
    final preferredAspectRatio = getPreferredAspectRatio();
    final fallbackRule = getFallbackRule();
    return AspectRatioStrategy(
      preferredAspectRatio: preferredAspectRatio.dartAspectRatio,
      fallbackRule: fallbackRule.dartAspectRatioFallbackRule,
    );
  }
}

extension JNIResolutionFilterX on jni.ResolutionFilter {
  ResolutionFilter get dartValue {
    return (supportedSizes, rotationDegrees) {
      final sizes = filter(
        supportedSizes.map((size) => size.jniValue).toJList(jni.Size.type),
        rotationDegrees,
      ).map((size) => size.dartValue).toList();
      return sizes;
    };
  }
}

extension JNIResolutionStrategyX on jni.ResolutionStrategy {
  ResolutionStrategy get dartValue {
    if (this == jni.ResolutionStrategy.HIGHEST_AVAILABLE_STRATEGY) {
      return ResolutionStrategy.highestAvailableStrategy;
    }
    final boundSize = getBoundSize();
    if (boundSize.isNull) {
      throw ArgumentError('boundSize');
    }
    final fallbackRule = getFallbackRule();
    return ResolutionStrategy(
      boundSize: boundSize.dartValue,
      fallbackRule: fallbackRule.dartResolutionFallbackRule,
    );
  }
}

extension JNIDynamicRangeX on jni.DynamicRange {
  DynamicRange get dartValue {
    if (this == jni.DynamicRange.UNSPECIFIED) {
      return DynamicRange.unspecifid;
    }
    if (this == jni.DynamicRange.SDR) {
      return DynamicRange.sdr;
    }
    if (this == jni.DynamicRange.HDR_UNSPECIFIED_10_BIT) {
      return DynamicRange.hdrUnspecified_10Bit;
    }
    if (this == jni.DynamicRange.HLG_10_BIT) {
      return DynamicRange.hlg_10Bit;
    }
    if (this == jni.DynamicRange.HDR10_10_BIT) {
      return DynamicRange.hdr10_10Bit;
    }
    if (this == jni.DynamicRange.HDR10_PLUS_10_BIT) {
      return DynamicRange.hdr10Plus_10Bit;
    }
    if (this == jni.DynamicRange.DOLBY_VISION_8_BIT) {
      return DynamicRange.dolbyVision_8Bit;
    }
    if (this == jni.DynamicRange.DOLBY_VISION_10_BIT) {
      return DynamicRange.dolbyVision_10Bit;
    } else {
      return DynamicRange(
        encoding: getEncoding().dartEncoding,
        bitDepth: getBitDepth().dartBitDepth,
      );
    }
  }
}

extension JNIUriX on jni.Uri {
  Uri get dartValue {
    final path = getPath().toDartString(
      releaseOriginal: true,
    );
    return Uri.file(path);
  }
}

extension JNILifecycleCameraControllerX on jni.LifecycleCameraController {
  Future<void> setEnabledUseCasesOnMainThread(int enabledUseCases) {
    return ui.runOnPlatformThread(() => setEnabledUseCases(enabledUseCases));
  }

  Future<void> bindToLifecycleOnMainThread(jni.LifecycleOwner lifecycleOwner) {
    return ui.runOnPlatformThread(() => bindToLifecycle(lifecycleOwner));
  }

  Future<void> unbindOnMainThread() {
    return ui.runOnPlatformThread(() => unbind());
  }

  Future<bool> hasCameraOnMainThread(jni.CameraSelector cameraSelector) {
    return ui.runOnPlatformThread(() => hasCamera(cameraSelector));
  }

  Future<jni.CameraSelector> getCameraSelectorOnMainThread() {
    return ui.runOnPlatformThread(() => getCameraSelector());
  }

  Future<void> setCameraSelectorOnMainThread(
      jni.CameraSelector cameraSelector) {
    return ui.runOnPlatformThread(() => setCameraSelector(cameraSelector));
  }

  Future<bool> isTapToFocusEnabledOnMainThread() {
    return ui.runOnPlatformThread(() => isTapToFocusEnabled());
  }

  Future<void> setTapToFocusEnabledOnMainThread(bool enabled) {
    return ui.runOnPlatformThread(() => setTapToFocusEnabled(enabled));
  }

  Future<bool> isPinchToZoomEnabledOnMainThread() {
    return ui.runOnPlatformThread(() => isPinchToZoomEnabled());
  }

  Future<void> setPinchToZoomEnabledOnMainThread(bool enabled) {
    return ui.runOnPlatformThread(() => setPinchToZoomEnabled(enabled));
  }

  Future<jni.LiveData<jni.ZoomState>> getZoomStateOnMainThread() {
    return ui.runOnPlatformThread(() => getZoomState());
  }

  Future<jni.ListenableFuture<JObject>> setLinearZoomOnMainThread(
    double linearZoom,
  ) {
    return ui.runOnPlatformThread(() => setLinearZoom(linearZoom));
  }

  Future<jni.ListenableFuture<JObject>> setZoomRatioOnMainThread(
    double zoomRatio,
  ) {
    return ui.runOnPlatformThread(() => setZoomRatio(zoomRatio));
  }

  Future<jni.LiveData<JInteger>> getTorchStateOnMainThread() {
    return ui.runOnPlatformThread(() => getTorchState());
  }

  Future<jni.ListenableFuture<JObject>> enableTorchOnMainThread(
    bool torchEnabled,
  ) {
    return ui.runOnPlatformThread(() => enableTorch(torchEnabled));
  }

  Future<jni.ResolutionSelector> getPreviewResolutionSelectorOnMainThread() {
    return ui.runOnPlatformThread(() => getPreviewResolutionSelector());
  }

  Future<void> setPreviewResolutionSelectorOnMainThread(
      jni.ResolutionSelector resolutionSelector) {
    final resolutionSelectorReference = resolutionSelector.reference;
    return ui.runOnPlatformThread(() {
      final resolutionSelector =
          jni.ResolutionSelector.fromReference(resolutionSelectorReference);
      setPreviewResolutionSelector(resolutionSelector);
    });
  }

  Future<int> getImageCaptureFlashModeOnMainThread() {
    return ui.runOnPlatformThread(() => getImageCaptureFlashMode());
  }

  Future<void> setImageCaptureFlashModeOnMainThread(int flashMode) {
    return ui.runOnPlatformThread(() => setImageCaptureFlashMode(flashMode));
  }

  Future<int> getImageCaptureModeOnMainThread() {
    return ui.runOnPlatformThread(() => getImageCaptureMode());
  }

  Future<void> setImageCaptureModeOnMainThread(int captureMode) {
    return ui.runOnPlatformThread(() => setImageCaptureMode(captureMode));
  }

  Future<jni.ResolutionSelector>
      getImageCaptureResolutionSelectorOnMainThread() {
    return ui.runOnPlatformThread(() => getImageCaptureResolutionSelector());
  }

  Future<void> setImageCaptureResolutionSelectorOnMainThread(
      jni.ResolutionSelector resolutionSelector) {
    final resolutionSelectorReference = resolutionSelector.reference;
    return ui.runOnPlatformThread(() {
      final resolutionSelector =
          jni.ResolutionSelector.fromReference(resolutionSelectorReference);
      setImageCaptureResolutionSelector(resolutionSelector);
    });
  }

  Future<void> takePictureOnMainThread(
    JObject outputFileOptions,
    jni.Executor executor,
    JObject imageSavedCallback,
  ) {
    final imageSavedCallbackReference = imageSavedCallback.reference;
    return ui.runOnPlatformThread(() {
      final imageSavedCallback = JObject.fromReference(
        imageSavedCallbackReference,
      );
      takePicture(
        outputFileOptions,
        executor,
        imageSavedCallback,
      );
    });
  }

  Future<jni.DynamicRange> getVideoCaptureDynamicRangeOnMainThread() {
    return ui.runOnPlatformThread(() => getVideoCaptureDynamicRange());
  }

  Future<void> setVideoCaptureDynamicRangeOnMainThread(
      jni.DynamicRange dynamicRange) {
    return ui
        .runOnPlatformThread(() => setVideoCaptureDynamicRange(dynamicRange));
  }

  Future<int> getVideoCaptureMirrorModeOnMainThread() {
    return ui.runOnPlatformThread(() => getVideoCaptureMirrorMode());
  }

  Future<void> setVideoCaptureMirrorModeOnMainThread(int mirrorMode) {
    return ui.runOnPlatformThread(() => setVideoCaptureMirrorMode(mirrorMode));
  }

  Future<jni.QualitySelector> getVideoCaptureQualitySelectorOnMainThread() {
    return ui.runOnPlatformThread(() => getVideoCaptureQualitySelector());
  }

  Future<void> setVideoCaptureQualitySelectorOnMainThread(
      jni.QualitySelector qualitySelector) {
    return ui.runOnPlatformThread(
        () => setVideoCaptureQualitySelector(qualitySelector));
  }

  Future<bool> isRecordingOnMainThread() {
    return ui.runOnPlatformThread(() => isRecording());
  }

  Future<jni.Recording> startRecordingOnMainThread(
    JObject outputOptions,
    jni.AudioConfig audioConfig,
    jni.Executor executor,
    jni.Consumer<jni.VideoRecordEvent> listener,
  ) {
    final listenerT = listener.T;
    final listenerReference = listener.reference;
    return ui.runOnPlatformThread(() {
      final listener = jni.Consumer<jni.VideoRecordEvent>.fromReference(
        listenerT,
        listenerReference,
      );
      return startRecording(
        outputOptions,
        audioConfig,
        executor,
        listener,
      );
    });
  }

  Future<int> getImageAnalysisBackpressureStrategyOnMainThread() {
    return ui.runOnPlatformThread(() => getImageAnalysisBackpressureStrategy());
  }

  Future<void> setImageAnalysisBackpressureStrategyOnMainThread(
      int backpressureStrategy) {
    return ui.runOnPlatformThread(
        () => setImageAnalysisBackpressureStrategy(backpressureStrategy));
  }

  Future<int> getImageAnalysisImageQueueDepthOnMainThread() {
    return ui.runOnPlatformThread(() => getImageAnalysisImageQueueDepth());
  }

  Future<void> setImageAnalysisImageQueueDepthOnMainThread(
      int imageQueueDepth) {
    return ui.runOnPlatformThread(
        () => setImageAnalysisImageQueueDepth(imageQueueDepth));
  }

  Future<int> getImageAnalysisOutputImageFormatOnMainThread() {
    return ui.runOnPlatformThread(() => getImageAnalysisOutputImageFormat());
  }

  Future<void> setImageAnalysisOutputImageFormatOnMainThread(
    int outputImageFormat,
  ) {
    return ui.runOnPlatformThread(
        () => setImageAnalysisOutputImageFormat(outputImageFormat));
  }

  Future<jni.ResolutionSelector>
      getImageAnalysisResolutionSelectorOnMainThread() {
    return ui.runOnPlatformThread(() => getImageAnalysisResolutionSelector());
  }

  Future<void> setImageAnalysisResolutionSelectorOnMainThread(
      jni.ResolutionSelector resolutionSelector) {
    final resolutionSelectorReference = resolutionSelector.reference;
    return ui.runOnPlatformThread(() {
      final resolutionSelector =
          jni.ResolutionSelector.fromReference(resolutionSelectorReference);
      setImageAnalysisResolutionSelector(resolutionSelector);
    });
  }

  Future<void> setImageAnalysisAnalyzerOnMainThread(
    jni.Executor executor,
    JObject analyzer,
  ) {
    final analyzerReference = analyzer.reference;
    return ui.runOnPlatformThread(() {
      final analyzer = JObject.fromReference(
        analyzerReference,
      );
      setImageAnalysisAnalyzer(
        executor,
        analyzer,
      );
    });
  }

  Future<void> clearImageAnalysisAnalyzerOnMainThread() {
    return ui.runOnPlatformThread(() => clearImageAnalysisAnalyzer());
  }
}

extension JNILiveDataX<T extends JObject> on jni.LiveData<T> {
  Future<void> observeOnMainThread(
    jni.LifecycleOwner lifecycleOwner,
    JObjType<T> observerT,
    JReference observerReference,
  ) {
    return ui.runOnPlatformThread(() {
      final observer = jni.Observer.fromReference(observerT, observerReference);
      observe(lifecycleOwner, observer);
    });
  }

  Future<void> removeObserverOnMainThread(
    JObjType<T> observerT,
    JReference observerReference,
  ) {
    return ui.runOnPlatformThread(() {
      final observer = jni.Observer.fromReference(observerT, observerReference);
      removeObserver(observer);
    });
  }
}

extension JNIPreviewViewX on jni.MyPreviewView {
  Future<void> setControllerOnMainThread(
    jni.CameraController cameraController,
  ) {
    return ui.runOnPlatformThread(() => setController(cameraController));
  }

  Future<void> setScaleTypeOnMainThread(
      jni.MyPreviewView_MyScaleType scaleType) {
    return ui.runOnPlatformThread(() => setScaleType(scaleType));
  }
}

extension JNIBarcodeX on jni.Barcode {
  MLCodeObject toDartValue({
    required DateTime time,
    required Duration duration,
  }) {
    final type = getFormat().jniMLCodeType;
    final bounds = getBoundingBox().dartValue;
    final corners = <ui.Offset>[];
    final cornerPoints = getCornerPoints();
    for (var i = 0; i < cornerPoints.length; i++) {
      final cornerPoint = cornerPoints[i];
      final corner = cornerPoint.dartValue;
      corners.add(corner);
    }
    final rawBytes = getRawBytes();
    final value = rawBytes.isNull ? null : rawBytes.dartValue;
    final stringValue = getDisplayValue().toDartString();
    return MLCodeObject(
      type: type,
      time: time,
      duration: duration,
      bounds: bounds,
      corners: corners,
      value: value,
      stringValue: stringValue,
    );
  }
}

extension JNIFaceX on jni.Face {
  MLFaceObject toDartValue({
    required DateTime time,
    required Duration duration,
  }) {
    final bounds = getBoundingBox().dartValue;
    final id = getTrackingId().intValue();
    final rollAngle = getHeadEulerAngleZ();
    final yawAngle = getHeadEulerAngleY();
    final pitchAngle = getHeadEulerAngleX();
    return MLFaceObject(
      time: time,
      duration: duration,
      bounds: bounds,
      id: id,
      rollAngle: rollAngle,
      yawAngle: yawAngle,
      pitchAngle: pitchAngle,
    );
  }
}

extension JNIByteArrayX on JArray<jbyte> {
  Uint8List get dartValue {
    final elements = getRange(0, length);
    return Uint8List.fromList(elements);
  }
}

extension JNIRectX on jni.Rect {
  ui.Rect get dartValue {
    return ui.Rect.fromLTRB(
      left.toDouble(),
      top.toDouble(),
      right.toDouble(),
      bottom.toDouble(),
    );
  }
}

extension JNIPointX on jni.Point {
  ui.Offset get dartValue {
    return ui.Offset(
      x.toDouble(),
      y.toDouble(),
    );
  }
}

extension JNISize on jni.Size {
  ui.Size get dartValue {
    final width = getWidth().toDouble();
    final height = getHeight().toDouble();
    return ui.Size(width, height);
  }
}

extension JNIVideoRecordEventX on jni.VideoRecordEvent {
  VideoRecordEvent get dartValue {
    final isInstanceOfStart = Jni.env.IsInstanceOf(
      reference.pointer,
      jni.VideoRecordEvent_Start.type.jClass.reference.pointer,
    );
    if (isInstanceOfStart) {
      return VideoRecordStartEvent();
    }
    final isInstanceOfPause = Jni.env.IsInstanceOf(
      reference.pointer,
      jni.VideoRecordEvent_Pause.type.jClass.reference.pointer,
    );
    if (isInstanceOfPause) {
      return VideoRecordPauseEvent();
    }
    final isInstanceOfResume = Jni.env.IsInstanceOf(
      reference.pointer,
      jni.VideoRecordEvent_Resume.type.jClass.reference.pointer,
    );
    if (isInstanceOfResume) {
      return VideoRecordResumeEvent();
    }
    final isInstanceOfFinalize = Jni.env.IsInstanceOf(
      reference.pointer,
      jni.VideoRecordEvent_Finalize.type.jClass.reference.pointer,
    );
    if (isInstanceOfFinalize) {
      final jniEvent = castTo(jni.VideoRecordEvent_Finalize.type);
      final jniError = jniEvent.getError();
      return VideoRecordFinalizeEvent(
        savedUri: jniEvent.getOutputResults().getOutputUri().dartValue,
        error: jniError == jni.VideoRecordEvent_Finalize.ERROR_NONE
            ? null
            : jniError,
      );
    }
    throw ArgumentError.value(this);
  }
}
