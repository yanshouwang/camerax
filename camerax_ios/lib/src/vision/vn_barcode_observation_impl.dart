import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vn_barcode_composite_type_impl.dart';
import 'vn_barcode_symbology_impl.dart';

extension VNBarcodeObservationApiX on VNBarcodeObservationApi {
  VNBarcodeObservation get impl => VNBarcodeObservation(
    uuid: uuid,
    confidence: confidence,
    boundingBox: boundingBox.impl,
    bottomLeft: bottomLeft.impl,
    bottomRight: bottomRight.impl,
    topLeft: topLeft.impl,
    topRight: topRight.impl,
    payloadStringValue: payloadStringValue,
    payloadData: payloadData,
    supplementalPayloadString: supplementalPayloadString,
    supplementalPayloadData: supplementalPayloadData,
    supplementalCompositeType: supplementalCompositeType.impl,
    isGS1DataCarrier: isGS1DataCarrier,
    symbology: symbology.impl,
    isColorInverted: isColorInverted,
  );
}
