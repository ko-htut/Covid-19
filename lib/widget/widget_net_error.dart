import 'package:corona/widget/common_text_style.dart';
import 'package:corona/widget/v_empty_view.dart';
import 'package:flutter/material.dart';

class NetErrorWidget extends StatelessWidget {
  final VoidCallback callback;

  NetErrorWidget({@required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        alignment: Alignment.center,
        height: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.error_outline,
              size: 50,
            ),
            VEmptyView(10),
            Text(
              'ပြန်လည်တောင်းဆိုရန်',
              style: commonTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
