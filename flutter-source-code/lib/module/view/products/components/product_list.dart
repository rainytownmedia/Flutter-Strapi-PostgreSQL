import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rainytownmedia/config/routes.dart';
import 'package:rainytownmedia/constants/app_color.dart';
import 'package:rainytownmedia/constants/size.dart';
import 'package:rainytownmedia/module/controller/app_controller.dart';
import 'package:rainytownmedia/module/controller/data_controller.dart';
import 'package:rainytownmedia/utils/helper/lazy_loader.dart';
import 'package:rainytownmedia/widgets/product_item.dart';

class AllProduct extends StatelessWidget {
  const AllProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController appCtrl = Get.find();
    DataController data = Get.find();
    return ExpandablePageView.builder(
      itemCount: data.categoryList.length,
      controller: appCtrl.productPageCtrl,
      onPageChanged: appCtrl.productTabIndex,
      animationDuration: 500.milliseconds,
      animationCurve: Curves.ease,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, index) {
        return Obx(() {
          if (data.isLoading.value) {
            return Wrap(
              spacing: 15,
              runSpacing: 15,
              alignment: WrapAlignment.center,
              children: List.generate(4, (index) {
                return SizedBox(
                  height: getScreenHeight(250),
                  width: getScreeWidth(165),
                  child: const ShimmerLoader(),
                );
              }),
            );
          }
          if (data.categoryItems.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Products Not Available!",
                  style: GoogleFonts.rubik(
                    fontSize: getTextSize(14),
                    color: kLightText,
                  ),
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Wrap(
                spacing: 15,
                runSpacing: 15,
                alignment: WrapAlignment.start,
                children: List.generate(
                    data.categoryItems.length < 4
                        ? data.categoryItems.length
                        : 4, (index) {
                  return ProductItem(
                    item: data.categoryItems[index],
                    press: () {
                      data.productDetails(data.categoryItems[index]);
                      Get.toNamed(AppRoute.detailsPage);
                    },
                  );
                }),
              ),
            );
          }
        });
      },
    );
  }
}
