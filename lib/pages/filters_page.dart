import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shoplustyle/controllers/filters_page_controller.dart';
import 'package:shoplustyle/controllers/home_page_controller.dart';
import 'package:shoplustyle/modals/categories_modal.dart';
import 'package:shoplustyle/utils/consts.dart';
import 'package:shoplustyle/widgets/custom_button.dart';
import 'package:shoplustyle/widgets/custom_drop_down.dart';
import 'package:shoplustyle/widgets/custom_switch.dart';
import 'package:shoplustyle/widgets/custom_text.dart';
import 'package:shoplustyle/widgets/custom_text_field.dart';
import 'package:shoplustyle/widgets/radiant_gradient_mask.dart';

class FiltersPage extends StatelessWidget {
  //Controller
  final FiltersPageController _controller = Get.find();
  final HomePageController homeController = Get.find();

  //Borders Radius
  final filterBtnBorderRadius = BorderRadius.all(Radius.circular(10.0));

  //Padding
  final pageContentPadding = EdgeInsets.all(16);

  @override
  Widget build(BuildContext context) {
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
                Theme(
                    data: ThemeData(canvasColor: Colors.transparent),
                    child: GetX<FiltersPageController>(
                        builder: (controller) => CustomDropDown(
                              "دسته بندی",
                              controller.selectedCategory.name,
                              controller.categorySelectionHandler,
                              homeController.categories
                            ))),
                Theme(
                    data: ThemeData(canvasColor: Colors.transparent),
                    child: GetX<FiltersPageController>(
                        builder: (controller) => Visibility(
                              visible: controller.subCategoryVisibility,
                              child: CustomDropDown(
                                  "زیر گروه",
                                  controller.selectedSubCategory.name,
                                  controller.subCategorySelectionHandler,
                                  homeController.categories),
                            ))),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        flex: 2,
                        child: CustomTextField(
                            "تومان",
                            TextInputType.numberWithOptions(
                                decimal: false, signed: false))),
                    Expanded(
                        child: Center(
                            child: CustomText(
                      fontSize: 14,
                      text: "تا : ",
                    ))),
                    Expanded(
                        flex: 2,
                        child: CustomTextField(
                            "تومان",
                            TextInputType.numberWithOptions(
                                decimal: false, signed: false))),
                    Expanded(
                        child: Center(
                            child: CustomText(
                      fontSize: 14,
                      text: "قیمت از : ",
                    ))),
                  ],
                ),
                CustomSwitch(false, "فقط کالا های موجود", (value) {}),
                CustomSwitch(false, "فقط کالا های تخفیف دار", (value) {}),
              ],
            ),
            Align(
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
            )
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
          GestureDetector(
            onTap: _controller.closeFilters(),
            child: RadiantGradientMask(
                child: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.white,
            )),
          ),
          CustomText(
            text: "فیلتر ها",
            color: PRIMARY_LIGHT,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
