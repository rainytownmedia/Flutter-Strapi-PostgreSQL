import 'package:flutter/material.dart';
import 'package:rainytownmedia/constants/size.dart';
import 'package:rainytownmedia/module/view/category/components/sale_banner.dart';
import 'package:rainytownmedia/widgets/header_text.dart';

class OnSell extends StatelessWidget {
  const OnSell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFFFFFF),
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const HeaderText(text: "Products On Sale"),
          getVerticalSpace(15),
          const SaleBanner(),
        ],
      ),
    );
  }
}
