///
//  Generated code. Do not modify.
//  source: messages.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use scaleTypeDescriptor instead')
const ScaleType$json = const {
  '1': 'ScaleType',
  '2': const [
    const {'1': 'SCALE_TYPE_FILL_START', '2': 0},
    const {'1': 'SCALE_TYPE_FILL_CENTER', '2': 1},
    const {'1': 'SCALE_TYPE_FILL_END', '2': 2},
    const {'1': 'SCALE_TYPE_FIT_START', '2': 3},
    const {'1': 'SCALE_TYPE_FIT_CENTER', '2': 4},
    const {'1': 'SCALE_TYPE_FIT_END', '2': 5},
  ],
};

/// Descriptor for `ScaleType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List scaleTypeDescriptor = $convert.base64Decode('CglTY2FsZVR5cGUSGQoVU0NBTEVfVFlQRV9GSUxMX1NUQVJUEAASGgoWU0NBTEVfVFlQRV9GSUxMX0NFTlRFUhABEhcKE1NDQUxFX1RZUEVfRklMTF9FTkQQAhIYChRTQ0FMRV9UWVBFX0ZJVF9TVEFSVBADEhkKFVNDQUxFX1RZUEVfRklUX0NFTlRFUhAEEhYKElNDQUxFX1RZUEVfRklUX0VORBAF');
@$core.Deprecated('Use cameraFacingDescriptor instead')
const CameraFacing$json = const {
  '1': 'CameraFacing',
  '2': const [
    const {'1': 'CAMERA_FACING_BACK', '2': 0},
    const {'1': 'CAMERA_FACING_FRONT', '2': 1},
  ],
};

/// Descriptor for `CameraFacing`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cameraFacingDescriptor = $convert.base64Decode('CgxDYW1lcmFGYWNpbmcSFgoSQ0FNRVJBX0ZBQ0lOR19CQUNLEAASFwoTQ0FNRVJBX0ZBQ0lOR19GUk9OVBAB');
@$core.Deprecated('Use cameraViewArgumentsDescriptor instead')
const CameraViewArguments$json = const {
  '1': 'CameraViewArguments',
  '2': const [
    const {'1': 'scale_type', '3': 1, '4': 1, '5': 14, '6': '.messages.ScaleType', '10': 'scaleType'},
  ],
};

/// Descriptor for `CameraViewArguments`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cameraViewArgumentsDescriptor = $convert.base64Decode('ChNDYW1lcmFWaWV3QXJndW1lbnRzEjIKCnNjYWxlX3R5cGUYASABKA4yEy5tZXNzYWdlcy5TY2FsZVR5cGVSCXNjYWxlVHlwZQ==');
@$core.Deprecated('Use cameraSelectorDescriptor instead')
const CameraSelector$json = const {
  '1': 'CameraSelector',
  '2': const [
    const {'1': 'facing', '3': 1, '4': 1, '5': 14, '6': '.messages.CameraFacing', '10': 'facing'},
  ],
};

/// Descriptor for `CameraSelector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cameraSelectorDescriptor = $convert.base64Decode('Cg5DYW1lcmFTZWxlY3RvchIuCgZmYWNpbmcYASABKA4yFi5tZXNzYWdlcy5DYW1lcmFGYWNpbmdSBmZhY2luZw==');
@$core.Deprecated('Use useCaseDescriptor instead')
const UseCase$json = const {
  '1': 'UseCase',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'preview', '3': 2, '4': 1, '5': 11, '6': '.messages.Preview', '9': 0, '10': 'preview'},
    const {'1': 'image_analysis', '3': 3, '4': 1, '5': 11, '6': '.messages.ImageAnalysis', '9': 0, '10': 'imageAnalysis'},
    const {'1': 'Image_capture', '3': 4, '4': 1, '5': 11, '6': '.messages.ImageCapture', '9': 0, '10': 'ImageCapture'},
    const {'1': 'video_capture', '3': 5, '4': 1, '5': 11, '6': '.messages.VideoCapture', '9': 0, '10': 'videoCapture'},
  ],
  '8': const [
    const {'1': 'use_case'},
  ],
};

/// Descriptor for `UseCase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List useCaseDescriptor = $convert.base64Decode('CgdVc2VDYXNlEg4KAmlkGAEgASgJUgJpZBItCgdwcmV2aWV3GAIgASgLMhEubWVzc2FnZXMuUHJldmlld0gAUgdwcmV2aWV3EkAKDmltYWdlX2FuYWx5c2lzGAMgASgLMhcubWVzc2FnZXMuSW1hZ2VBbmFseXNpc0gAUg1pbWFnZUFuYWx5c2lzEj0KDUltYWdlX2NhcHR1cmUYBCABKAsyFi5tZXNzYWdlcy5JbWFnZUNhcHR1cmVIAFIMSW1hZ2VDYXB0dXJlEj0KDXZpZGVvX2NhcHR1cmUYBSABKAsyFi5tZXNzYWdlcy5WaWRlb0NhcHR1cmVIAFIMdmlkZW9DYXB0dXJlQgoKCHVzZV9jYXNl');
@$core.Deprecated('Use previewDescriptor instead')
const Preview$json = const {
  '1': 'Preview',
  '2': const [
    const {'1': 'viewId', '3': 1, '4': 1, '5': 5, '10': 'viewId'},
  ],
};

/// Descriptor for `Preview`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List previewDescriptor = $convert.base64Decode('CgdQcmV2aWV3EhYKBnZpZXdJZBgBIAEoBVIGdmlld0lk');
@$core.Deprecated('Use imageAnalysisDescriptor instead')
const ImageAnalysis$json = const {
  '1': 'ImageAnalysis',
};

/// Descriptor for `ImageAnalysis`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageAnalysisDescriptor = $convert.base64Decode('Cg1JbWFnZUFuYWx5c2lz');
@$core.Deprecated('Use imageCaptureDescriptor instead')
const ImageCapture$json = const {
  '1': 'ImageCapture',
};

/// Descriptor for `ImageCapture`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageCaptureDescriptor = $convert.base64Decode('CgxJbWFnZUNhcHR1cmU=');
@$core.Deprecated('Use videoCaptureDescriptor instead')
const VideoCapture$json = const {
  '1': 'VideoCapture',
};

/// Descriptor for `VideoCapture`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List videoCaptureDescriptor = $convert.base64Decode('CgxWaWRlb0NhcHR1cmU=');
@$core.Deprecated('Use cameraDescriptor instead')
const Camera$json = const {
  '1': 'Camera',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `Camera`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cameraDescriptor = $convert.base64Decode('CgZDYW1lcmESDgoCaWQYASABKAlSAmlk');
