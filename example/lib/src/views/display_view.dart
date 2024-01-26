import 'package:camerax/camerax.dart';
import 'package:flutter/material.dart';

class DisplayView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final barcode = ModalRoute.of(context)?.settings.arguments as Barcode;
    return Scaffold(
      appBar: AppBar(
        title: Text('扫描结果'),
      ),
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              Column(
                children: [
                  Image.asset(
                    barcode.type.source,
                    width: 40.0,
                    height: 40.0,
                  ),
                  Container(height: 8.0),
                  Text(
                    barcode.type.name,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0x99000000),
                    ),
                  ),
                ],
              ),
              Container(height: 40.0),
              Expanded(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '条码格式',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Container(height: 4.0),
                        Text(
                          barcode.format.name,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0x99000000),
                          ),
                        ),
                      ],
                    ),
                    Container(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '结果类型',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Container(height: 4.0),
                        Text(
                          barcode.type.name,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0x99000000),
                          ),
                        ),
                      ],
                    ),
                    Container(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '结果内容',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Container(height: 4.0),
                        Text(
                          barcode.rawValue ?? '',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0x99000000),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(height: 40.0),
              ButtonTheme(
                minWidth: 188.0,
                height: 36.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                textTheme: ButtonTextTheme.primary,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('复制'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension on BarcodeType {
  String get source {
    switch (this) {
      case BarcodeType.calendarEvent:
        return 'images/event.png';
      case BarcodeType.contactInfo:
        return 'images/contact.png';
      case BarcodeType.email:
        return 'images/email.png';
      case BarcodeType.geo:
        return 'images/location.png';
      case BarcodeType.isbn:
        return 'images/isbn.png';
      case BarcodeType.phone:
        return 'images/tel.png';
      case BarcodeType.product:
        return 'images/product.png';
      case BarcodeType.sms:
        return 'images/sms.png';
      case BarcodeType.url:
        return 'images/website.png';
      case BarcodeType.wifi:
        return 'images/wifi.png';
      case BarcodeType.text:
      case BarcodeType.driverLicense:
      default:
        return 'images/text.png';
    }
  }

  String get name {
    switch (this) {
      case BarcodeType.calendarEvent:
        return '事件';
      case BarcodeType.contactInfo:
        return '通讯录';
      case BarcodeType.driverLicense:
        return '驾照';
      case BarcodeType.email:
        return '电子邮件';
      case BarcodeType.geo:
        return '坐标';
      case BarcodeType.isbn:
        return 'ISBN';
      case BarcodeType.phone:
        return '电话';
      case BarcodeType.product:
        return '商品';
      case BarcodeType.sms:
        return '短信';
      case BarcodeType.text:
        return '文本';
      case BarcodeType.url:
        return '网址';
      case BarcodeType.wifi:
        return 'WiFi';
      default:
        return '未知';
    }
  }
}

extension on BarcodeFormat {
  String get name {
    switch (this) {
      case BarcodeFormat.aztec:
        return 'AZTEC';
      case BarcodeFormat.code128:
        return 'Code 128';
      case BarcodeFormat.code39:
        return 'Code 39';
      case BarcodeFormat.code93:
        return 'Code 93';
      case BarcodeFormat.codebar:
        return 'Codebar';
      case BarcodeFormat.data_matrix:
        return 'Data Matrix';
      case BarcodeFormat.ean13:
        return 'EAN-13';
      case BarcodeFormat.ean8:
        return 'EAN-8';
      case BarcodeFormat.itf:
        return 'ITF';
      case BarcodeFormat.pdf417:
        return 'PDF-417';
      case BarcodeFormat.qr_code:
        return 'QR CODE';
      case BarcodeFormat.upc_a:
        return 'UPC-A';
      case BarcodeFormat.upc_e:
        return 'UPC-E';
      default:
        return '未知';
    }
  }
}
