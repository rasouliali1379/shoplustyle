import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shoplustyle/utils/consts.dart';

class CustomProductCarouselItem extends StatelessWidget {

  final borderRadius = BorderRadius.circular(10);
  final aspectRatio = 1.0;

  final String imageUrl;

  CustomProductCarouselItem(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: PRIMARY_LIGHT.withOpacity(0.5),
            offset: const Offset(0, 1),
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: ClipRRect(
            borderRadius: borderRadius,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: imageUrl,
              placeholder: (context, url) => Center(
                  child: Wrap(children: [
                    SpinKitFadingCircle(
                      color: PRIMARY_LIGHT,
                    )
                  ])),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )),
      ),
    );
  }
}
