import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:shoplustyle/models/products_model.dart';
import 'package:shoplustyle/repository/products_repository.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/custom_text.dart';
import 'package:shoplustyle/widgets/loading.dart';

class ProductItem extends StatefulWidget {
  final ProductsModel product;

  ProductItem(this.product);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem>
    with AutomaticKeepAliveClientMixin {
  final borderRadius = BorderRadius.circular(10);

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(8),
      elevation: 1,
      child: AspectRatio(
        // height: 350,
        // width: 200,
        aspectRatio: 9 / 16,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
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
                aspectRatio: 1,
                child: ClipRRect(
                    borderRadius: borderRadius,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: widget.product.images[0].src,
                      placeholder: (context, url) => Center(
                          child: Wrap(children: [
                        SpinKitFadingCircle(
                          color: PRIMARY_LIGHT,
                        )
                      ])),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )),
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: CustomText(
                      text: widget.product.name,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Center(child: getPriceLabel())
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget getPriceLabel() {
    if (widget.product.type == "variable") {
      return getRangedPriceLabel();
    } else {
      if (widget.product.onSale) {
        return getOnSalePriceLabel();
      } else {
        return getSimplePriceLabel();
      }
    }
  }

  Widget getRangedPriceLabel() {
    return FutureBuilder(
        future: ProductRepository().getPriceRange(widget.product.id),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return loading(size: 20, which: THREE_DOTS);
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomText(
                  text: " از " +
                      NumberFormat("###,000", "en-US")
                          .format(int.parse(snapshot.data[0])) +
                      " تومان ",
                  fontSize: 16,
                  colors: [PRIMARY_LIGHT, PRIMARY_DARK],
                  fontWeight: FontWeight.bold,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: CustomText(
                    text: " تا " +
                        NumberFormat("###,000", "en-US").format(int.parse(
                            snapshot.data[snapshot.data.length - 1])) +
                        " تومان ",
                    colors: [PRIMARY_LIGHT, PRIMARY_DARK],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            );
          }
        });
  }

  Widget getOnSalePriceLabel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        CustomText(
          text: NumberFormat("###,000", "en-US")
                  .format(int.parse(widget.product.regularPrice)) +
              " تومان ",
          fontSize: 14,
          fontWeight: FontWeight.bold,
          textDecoration: TextDecoration.lineThrough,
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: CustomText(
            text: NumberFormat("###,000", "en-US")
                    .format(int.parse(widget.product.price)) +
                " تومان ",
            colors: [PRIMARY_LIGHT, PRIMARY_DARK],
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget getSimplePriceLabel() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: CustomText(
        text: NumberFormat("###,000", "en-US")
                .format(int.parse(widget.product.price)) +
            " تومان ",
        colors: [PRIMARY_LIGHT, PRIMARY_DARK],
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
