import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/filters_page_controller.dart';
import 'package:shoplustyle/controllers/home_page_controller.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/utils/price_formatter.dart';
import 'package:shoplustyle/widgets/custom_button.dart';
import 'package:shoplustyle/widgets/category_drop_down.dart';
import 'package:shoplustyle/widgets/custom_switch.dart';
import 'package:shoplustyle/widgets/custom_text.dart';
import 'package:shoplustyle/widgets/custom_text_field.dart';
import 'package:shoplustyle/widgets/radiant_gradient_mask.dart';

class FiltersPage extends StatelessWidget {
  //Controller
  FiltersPageController _controller;
  final HomePageController homeController = Get.find();

  //Borders Radius
  final filterBtnBorderRadius = BorderRadius.all(Radius.circular(10.0));

  //Padding
  final pageContentPadding = EdgeInsets.all(16);

  final String controllerId;


  FiltersPage(this.controllerId);

  @override
  Widget build(BuildContext context) {

    _controller = Get.put(FiltersPageController(controllerId));

    return Material(
      child: Container(
        color: Colors.white,
        padding: pageContentPadding,
        child: SafeArea(
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                pageBar(),
                categoryDropDown(),
                subCategoryDropDown(),
                priceRange(),
                availableProductsSwitch(),
                saleProductsSwitch(),
              ],
            ),
            applyBtn()
          ]),
        ),
      ),
    );
  }

  Widget pageBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            text: "فیلتر ها",
            color: PRIMARY_LIGHT,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          GestureDetector(
            onTap: _controller.closeFilters(),
            child: RadiantGradientMask(
                child: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.white,
            )),
          )
        ],
      ),
    );
  }

  Widget categoryDropDown() {
    return GetX<FiltersPageController>(
        builder: (controller) => CategoryDropDown(
            "دسته بندی",
            controller.selectedCategory.name,
            controller.categorySelectionHandler,
            homeController.categories,
            0,
            false));
  }

  Widget subCategoryDropDown() {
    return GetX<FiltersPageController>(
        builder: (controller) => Visibility(
            visible: controller.subCategoryVisibility,
            child: CategoryDropDown(
                "زیر گروه",
                controller.selectedSubCategory.name,
                controller.subCategorySelectionHandler,
                controller.getSubCategories(),
                controller.selectedCategory.id,
                true)));
  }

  Widget priceRange() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            child: Center(
                child: CustomText(
          fontSize: 14,
          text: "قیمت از : ",
        ))),
        Expanded(
            flex: 2,
            child: CustomTextField(
                hint: "تومان",
                textInputType: TextInputType.numberWithOptions(
                    decimal: false, signed: false),
                controller: _controller.minPriceController,
                inputFormatters: [PriceFormatter()])),
        Expanded(
            child: Center(
                child: CustomText(
          fontSize: 14,
          text: "تا : ",
        ))),
        Expanded(
            flex: 2,
            child: CustomTextField(
              hint: "تومان",
              textInputType: TextInputType.numberWithOptions(
                  decimal: false, signed: false),
              controller: _controller.maxPriceController,
              inputFormatters: [PriceFormatter()],
            )),
      ],
    );
  }

  Widget applyBtn() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.maxFinite,
        child: CustomButton(
          text: "اعمال فیلتر",
          textSize: 14,
          borderRadius: filterBtnBorderRadius,
          onPressed: _controller.applyFilters(),
        ),
      ),
    );
  }

  Widget availableProductsSwitch() {
    return GetBuilder<FiltersPageController>(
        builder: (controller) => CustomSwitch(_controller.availableProducts,
            "فقط کالا های موجود", _controller.toggleAvailableProductsSwitch()));
  }

  Widget saleProductsSwitch() {
    return GetBuilder<FiltersPageController>(
        builder: (controller) => CustomSwitch(_controller.saleProducts,
            "فقط کالا های تخفیف دار", _controller.toggleSaleProductsSwitch()));
  }
}
