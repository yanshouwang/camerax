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
    const {'1': 'controller_id', '3': 1, '4': 1, '5': 9, '10': 'controllerId'},
    const {'1': 'scale_type', '3': 2, '4': 1, '5': 14, '6': '.messages.ScaleType', '10': 'scaleType'},
  ],
};

/// Descriptor for `CameraViewArguments`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cameraViewArgumentsDescriptor = $convert.base64Decode('ChNDYW1lcmFWaWV3QXJndW1lbnRzEiMKDWNvbnRyb2xsZXJfaWQYASABKAlSDGNvbnRyb2xsZXJJZBIyCgpzY2FsZV90eXBlGAIgASgOMhMubWVzc2FnZXMuU2NhbGVUeXBlUglzY2FsZVR5cGU=');
@$core.Deprecated('Use cameraSelectorDescriptor instead')
const CameraSelector$json = const {
  '1': 'CameraSelector',
  '2': const [
    const {'1': 'facing', '3': 1, '4': 1, '5': 14, '6': '.messages.CameraFacing', '10': 'facing'},
  ],
};

/// Descriptor for `CameraSelector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cameraSelectorDescriptor = $convert.base64Decode('Cg5DYW1lcmFTZWxlY3RvchIuCgZmYWNpbmcYASABKA4yFi5tZXNzYWdlcy5DYW1lcmFGYWNpbmdSBmZhY2luZw==');
@$core.Deprecated('Use torchStateArgumentsDescriptor instead')
const TorchStateArguments$json = const {
  '1': 'TorchStateArguments',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'state', '3': 2, '4': 1, '5': 8, '10': 'state'},
  ],
};

/// Descriptor for `TorchStateArguments`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List torchStateArgumentsDescriptor = $convert.base64Decode('ChNUb3JjaFN0YXRlQXJndW1lbnRzEg4KAmlkGAEgASgJUgJpZBIUCgVzdGF0ZRgCIAEoCFIFc3RhdGU=');
@$core.Deprecated('Use mLMetadataObjectArgumentsDescriptor instead')
const MLMetadataObjectArguments$json = const {
  '1': 'MLMetadataObjectArguments',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'ml_object', '3': 2, '4': 1, '5': 11, '6': '.messages.MLMetadataObject', '10': 'mlObject'},
  ],
};

/// Descriptor for `MLMetadataObjectArguments`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mLMetadataObjectArgumentsDescriptor = $convert.base64Decode('ChlNTE1ldGFkYXRhT2JqZWN0QXJndW1lbnRzEg4KAmlkGAEgASgJUgJpZBI3CgltbF9vYmplY3QYAiABKAsyGi5tZXNzYWdlcy5NTE1ldGFkYXRhT2JqZWN0UghtbE9iamVjdA==');
@$core.Deprecated('Use mLMetadataObjectDescriptor instead')
const MLMetadataObject$json = const {
  '1': 'MLMetadataObject',
  '2': const [
    const {'1': 'barcodes', '3': 1, '4': 3, '5': 11, '6': '.messages.Barcode', '10': 'barcodes'},
  ],
};

/// Descriptor for `MLMetadataObject`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mLMetadataObjectDescriptor = $convert.base64Decode('ChBNTE1ldGFkYXRhT2JqZWN0Ei0KCGJhcmNvZGVzGAEgAygLMhEubWVzc2FnZXMuQmFyY29kZVIIYmFyY29kZXM=');
@$core.Deprecated('Use barcodeDescriptor instead')
const Barcode$json = const {
  '1': 'Barcode',
  '2': const [
    const {'1': 'bounding_box', '3': 1, '4': 1, '5': 11, '6': '.messages.Rect', '9': 0, '10': 'boundingBox', '17': true},
    const {'1': 'raw_value', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'rawValue', '17': true},
    const {'1': 'raw_bytes', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'rawBytes', '17': true},
  ],
  '8': const [
    const {'1': '_bounding_box'},
    const {'1': '_raw_value'},
    const {'1': '_raw_bytes'},
  ],
};

/// Descriptor for `Barcode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List barcodeDescriptor = $convert.base64Decode('CgdCYXJjb2RlEjYKDGJvdW5kaW5nX2JveBgBIAEoCzIOLm1lc3NhZ2VzLlJlY3RIAFILYm91bmRpbmdCb3iIAQESIAoJcmF3X3ZhbHVlGAIgASgJSAFSCHJhd1ZhbHVliAEBEiAKCXJhd19ieXRlcxgDIAEoDEgCUghyYXdCeXRlc4gBAUIPCg1fYm91bmRpbmdfYm94QgwKCl9yYXdfdmFsdWVCDAoKX3Jhd19ieXRlcw==');
@$core.Deprecated('Use rectDescriptor instead')
const Rect$json = const {
  '1': 'Rect',
  '2': const [
    const {'1': 'left', '3': 1, '4': 1, '5': 5, '10': 'left'},
    const {'1': 'top', '3': 2, '4': 1, '5': 5, '10': 'top'},
    const {'1': 'right', '3': 3, '4': 1, '5': 5, '10': 'right'},
    const {'1': 'bottom', '3': 4, '4': 1, '5': 5, '10': 'bottom'},
  ],
};

/// Descriptor for `Rect`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rectDescriptor = $convert.base64Decode('CgRSZWN0EhIKBGxlZnQYASABKAVSBGxlZnQSEAoDdG9wGAIgASgFUgN0b3ASFAoFcmlnaHQYAyABKAVSBXJpZ2h0EhYKBmJvdHRvbRgEIAEoBVIGYm90dG9t');
