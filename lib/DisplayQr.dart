import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:testweb/datamodelobj.dart';

class DsiplayQr extends StatelessWidget {
  const DsiplayQr({
    Key key,
    @required this.qr,
  }) : super(key: key);

  final QrObj qr;

  @override
  Widget build(BuildContext context) {
    // QrObj selected;
//
    // for (int i; i <= qr.length; i++) {
    // if (qr[i].cardNo == null) {
    // selected = qr[i];
    // break;
    // }
    // }
    return Column(
      children: [
        Container(
          height: 50,
          color: Colors.red,
        ),
        Container(child: QrImage(data: qr.transId), height: 200),
        // Container(child: QrImage(data: qr[0].idNo), height: 90),
        Container(child: Text(qr.cardNo.isEmpty ? "is Empty" : qr.idNo)),
        Container(
          child: Text(qr.transId),
        )
      ],
    );
  }
}
