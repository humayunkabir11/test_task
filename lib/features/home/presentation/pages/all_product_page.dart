import 'package:flutter/material.dart';
import 'package:testing/core/common/widgets/appbar/custom_appbar.dart';

import '../../../../core/common/widgets/field/custom_text_field.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../widgets/produc_card.dart';

class AllProductPage extends StatelessWidget {
  const AllProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Color(0xffF8F8F8),
        title: Text("All Product"),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomTextField(
              hintText: "Search products",
              enabled: true,
              filledColor: Colors.white,
              prefixIcon: Assets.icons.icSearch.svg(),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              physics: BouncingScrollPhysics(),
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 14,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return const ProductCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
