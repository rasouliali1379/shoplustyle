import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoplustyle/models/variation_model.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/custom_text.dart';

class VariationsModal extends StatelessWidget {
  final String title;
  final List<VariationModel> variations;
  final itemClickListener;

  VariationsModal(this.title, this.variations, this.itemClickListener);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomText(
                fontSize: 18,
                text: title,
              ),
            ),
            Divider(
              color: PRIMARY_LIGHT.withOpacity(0.2),
              height: 1,
              thickness: 1.5,
              indent: 8,
              endIndent: 8,
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: variations.length,
                itemBuilder: (context, index) => GestureDetector(
                    onTap: itemClickListener(variations[index].id),
                    child: variationsItem(variations[index])),
              ),
            ),
          ],
        ));
  }

  Widget variationsItem(VariationModel variation) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: PRIMARY_LIGHT.withOpacity(0.5), width: 1)),
      margin: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
      padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: variation.attributes[0].name +
                " " +
                variation.attributes[0].option,
            fontSize: 16,
          ),
          priceLabel(variation)
        ],
      ),
    );
  }

  Widget priceLabel(VariationModel variation) {
    if (variation.onSale) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
              fontSize: 12,
              color: Colors.grey,
              textDecoration: TextDecoration.lineThrough,
              text: NumberFormat("###,000", "en-US")
                      .format(int.parse(variation.regularPrice)) +
                  " تومان "),
          CustomText(
            fontSize: 14,
            colors: [PRIMARY_LIGHT, PRIMARY_DARK],
            text: NumberFormat("###,000", "en-US")
                    .format(int.parse(variation.salePrice)) +
                " تومان ",
            fontWeight: FontWeight.bold,
          )
        ],
      );
    } else {
      return CustomText(
          fontSize: 16,
          colors: [PRIMARY_LIGHT, PRIMARY_DARK],
          text: NumberFormat("###,000", "en-US")
                  .format(int.parse(variation.price)) +
              " تومان ");
    }
  }
}
