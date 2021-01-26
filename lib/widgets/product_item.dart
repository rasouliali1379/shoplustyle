import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shoplustyle/models/products_model.dart';
import 'package:shoplustyle/widgets/custom_text.dart';

class ProductItem extends StatelessWidget {
  final borderRadius = BorderRadius.circular(10);
  bool isGrid;
  ProductsModel item;

  ProductItem(this.isGrid, this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      margin: const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
      child: Container(
        height: 100,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomText(text: item.name, fontSize: 18, fontWeight: FontWeight.bold,)
                ],
              ),
            )),
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                  borderRadius: borderRadius,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: item.images[0].src,
                    placeholder: (context, url) => Center(
                        child: Wrap(children: [
                      SpinKitFadingCircle(
                        color: Color.fromRGBO(49, 72, 250, 100),
                      )
                    ])),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
