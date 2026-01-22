import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:testing/core/common/widgets/appbar/custom_appbar.dart';
import 'package:testing/core/common/widgets/field/custom_text_field.dart';
import 'package:testing/core/config/theme/style.dart';
import '../../../../core/config/routes/route_path.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../widgets/category_item.dart';
import '../widgets/produc_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF8F8F8),
        appBar: CustomAppBar(
          backgroundColor: Color(0xffF8F8F8),
          title: CustomTextField(
            hintText: "Search products",
            enabled: true,
            filledColor: Colors.white,
            prefixIcon: Assets.icons.icSearch.svg(),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
           // padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Categories Header ---
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 20,right: 20,bottom: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(
                            'Categories',
                            style: interSemiBold.copyWith(
                              fontSize: 18,
                              color: Color(0xff222222),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              context.pushNamed(RoutePath.allProductPage);
                            },
                            child:  Text(
                              'See all',
                              style: TextStyle(color: Color(0xff797979),fontSize: 18),
                            ),
                          ),
                        ],
                      ),

                      // --- Categories List ---
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryItem(
                            icon: Icons.battery_charging_full,
                            title: 'Mobile',
                          ),
                          CategoryItem(
                            icon: Icons.videogame_asset_outlined,
                            title: 'Gaming',
                          ),
                          CategoryItem(
                            icon: Icons.camera_alt_outlined,
                            title: 'Images',
                          ),
                          CategoryItem(icon: Icons.car_repair, title: 'Vehicles'),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // --- New Arrivals Header ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                     Padding(
                       padding: const EdgeInsets.only(left: 16.0,right: 4),
                       child: Text(
                        'New Arrivals',
                        style: interSemiBold.copyWith(
                          fontSize: 18,
                          color: Color(0xff222222)
                        ),
                                           ),
                     ),
                    IconButton(
                      icon: Assets.icons.icFilter.svg(),
                      onPressed: () {},
                    ),
                  ],
                ),

                // --- Product Grid ---
                GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    return  ProductCard(
                      onTap: (){
                        context.pushNamed(RoutePath.productDetailsPage);
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



