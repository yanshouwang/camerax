///
//  Generated code. Do not modify.
//  source: messages.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
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
@$core.Deprecated('Use imageProxyArgumentsDescriptor instead')
const ImageProxyArguments$json = const {
  '1': 'ImageProxyArguments',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'image_proxy', '3': 2, '4': 1, '5': 11, '6': '.messages.ImageProxy', '10': 'imageProxy'},
  ],
};

/// Descriptor for `ImageProxyArguments`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageProxyArgumentsDescriptor = $convert.base64Decode('ChNJbWFnZVByb3h5QXJndW1lbnRzEg4KAmlkGAEgASgJUgJpZBI1CgtpbWFnZV9wcm94eRgCIAEoCzIULm1lc3NhZ2VzLkltYWdlUHJveHlSCmltYWdlUHJveHk=');
@$core.Deprecated('Use imageProxyDescriptor instead')
const ImageProxy$json = const {
  '1': 'ImageProxy',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `ImageProxy`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageProxyDescriptor = $convert.base64Decode('CgpJbWFnZVByb3h5Eg4KAmlkGAEgASgJUgJpZA==');
@$core.Deprecated('Use mLRecognitionArgumentsDescriptor instead')
const MLRecognitionArguments$json = const {
  '1': 'MLRecognitionArguments',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'recognition', '3': 2, '4': 3, '5': 11, '6': '.messages.MLMetadata', '10': 'recognition'},
  ],
};

/// Descriptor for `MLRecognitionArguments`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mLRecognitionArgumentsDescriptor = $convert.base64Decode('ChZNTFJlY29nbml0aW9uQXJndW1lbnRzEg4KAmlkGAEgASgJUgJpZBI2CgtyZWNvZ25pdGlvbhgCIAMoCzIULm1lc3NhZ2VzLk1MTWV0YWRhdGFSC3JlY29nbml0aW9u');
@$core.Deprecated('Use mLMetadataDescriptor instead')
const MLMetadata$json = const {
  '1': 'MLMetadata',
  '2': const [
    const {'1': 'corners', '3': 1, '4': 3, '5': 11, '6': '.messages.Offset', '10': 'corners'},
    const {'1': 'barcode', '3': 2, '4': 1, '5': 11, '6': '.messages.Barcode', '9': 0, '10': 'barcode'},
  ],
  '8': const [
    const {'1': 'metadata'},
  ],
};

/// Descriptor for `MLMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mLMetadataDescriptor = $convert.base64Decode('CgpNTE1ldGFkYXRhEioKB2Nvcm5lcnMYASADKAsyEC5tZXNzYWdlcy5PZmZzZXRSB2Nvcm5lcnMSLQoHYmFyY29kZRgCIAEoCzIRLm1lc3NhZ2VzLkJhcmNvZGVIAFIHYmFyY29kZUIKCghtZXRhZGF0YQ==');
@$core.Deprecated('Use offsetDescriptor instead')
const Offset$json = const {
  '1': 'Offset',
  '2': const [
    const {'1': 'dx', '3': 1, '4': 1, '5': 5, '10': 'dx'},
    const {'1': 'dy', '3': 2, '4': 1, '5': 5, '10': 'dy'},
  ],
};

/// Descriptor for `Offset`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List offsetDescriptor = $convert.base64Decode('CgZPZmZzZXQSDgoCZHgYASABKAVSAmR4Eg4KAmR5GAIgASgFUgJkeQ==');
@$core.Deprecated('Use barcodeDescriptor instead')
const Barcode$json = const {
  '1': 'Barcode',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `Barcode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List barcodeDescriptor = $convert.base64Decode('CgdCYXJjb2RlEhQKBXZhbHVlGAEgASgJUgV2YWx1ZQ==');
