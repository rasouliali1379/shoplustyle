import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shoplustyle/utils/consts.dart';

Widget loading({double size = 50.0, String which}){
  switch(which){
    case FADING_CIRCLE_SPIN:
      return SpinKitFadingCircle(
        color: PRIMARY_LIGHT,
        size: size,
      );
    case THREE_DOTS:
      return SpinKitThreeBounce(
        color: PRIMARY_LIGHT,
        size: size,
      );
  }

  return SpinKitFadingCircle(
    color: PRIMARY_LIGHT,
    size: size,
  );
}