import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

void showProgressIndecator(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: LoadingIndicator(
          indicatorType: Indicator.lineScale,
        
          /// Required, The loading type of the widget
          colors: const [
            Colors.deepOrangeAccent,
            Colors.greenAccent,
            Colors.indigoAccent,
            Colors.limeAccent,
            Colors.pinkAccent,
            Colors.redAccent,
            Colors.tealAccent,
          ],
        ),
      ),
    ),
  );
  showDialog(
    barrierColor: Colors.white.withOpacity(0),
    barrierDismissible: false,
    context: context,
    builder: (context) => alertDialog,
  );
}
