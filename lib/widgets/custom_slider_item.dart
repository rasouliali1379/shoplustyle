import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shoplustyle/utils/consts.dart';

class CustomSliderItem extends StatelessWidget {
  final navBorderRadius = BorderRadius.circular(20);
  final aspectRatio = 4 / 3;

  final item;

  CustomSliderItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: navBorderRadius,
          boxShadow: [
            BoxShadow(
              color: PRIMARY_LIGHT.withOpacity(0.5),
              offset: const Offset(0, 2),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Container(
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: AspectRatio(
                aspectRatio: aspectRatio,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: item.bannersImage,
                  placeholder: (context, url) => Center(
                      child: Wrap(children: [CircularProgressIndicator()])),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              )),
        ),
      ),
    );
  }
}