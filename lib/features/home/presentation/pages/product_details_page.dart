import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testing/core/common/widgets/image/cache_image.dart';
import '../../../../core/common/widgets/button/elevated_button.dart';
import '../../../../core/config/theme/style.dart';
import '../../../../core/common/widgets/appbar/custom_appbar.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/di/init_dependencies.dart';
import '../../data/models/product_details_response_model.dart';
import '../bloc/product_details_bloc.dart';
import '../bloc/product_details_event.dart';
import '../bloc/product_details_state.dart';
import '../widgets/product_image_gallery.dart';

class ProductDetailsPage extends StatelessWidget {
  final String slug;

  const ProductDetailsPage({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ProductDetailsBloc>()..add(LoadProductDetailsEvent(slug)),
      child: const _ProductDetailsView(),
    );
  }
}

class _ProductDetailsView extends StatelessWidget {
  const _ProductDetailsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      appBar: CustomAppBar(
        centerTitle: true,
        backgroundColor: Color(0xffFFBB38).withOpacity(0.1),
        title: const Text("Popular Sells"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Assets.icons.icHeartfill.svg(
              colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
            ),
          ),
        ],
      ),
      body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductDetailsError) {
            return Center(child: Text(state.message));
          } else if (state is ProductDetailsLoaded) {
            final product = state.productDetails.product;
            if (product == null) {
              return const Center(child: Text("Product not found"));
            }
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    //  padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///------------------------ gallery image and image preview ---------->
                        _buildProductImage(state.productDetails),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              ///------------------ price --------------->
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "\$${product.offerPrice ?? product.price}",
                                    style: interMedium.copyWith(
                                      fontSize: 24.sp,
                                      color: const Color(0xffEF262C),
                                    ),
                                  ),
                                  if (product.offerPrice != null && product.price != null) ...[
                                    SizedBox(width: 8.w),
                                    Text(
                                      "\$${product.price}",
                                      style: interMedium.copyWith(
                                        fontSize: 15.sp,
                                        color: const Color(0xff9A9A9A),
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                              SizedBox(height: 8.h),
                              ///---------------- brand ----------------->

                              Text(
                                product.brand?.name?.toUpperCase() ?? "N/A",
                                style: interRegular.copyWith(
                                  fontSize: 12.sp,
                                  color: const Color(0xff9A9A9A),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                product.name ?? "N/A",
                                style: interMedium.copyWith(
                                  fontSize: 20.sp,
                                  color: const Color(0xff222222),
                                ),
                              ),
                              SizedBox(height: 8.h),
                              /// -------------- rating ------------->
                              Row(
                                children: [
                                  Row(
                                    children: List.generate(
                                      5,
                                          (_) => Assets.icons.icStart.svg(height: 15, width: 15),
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    "${product.averageRating ?? 0} Reviews",
                                    style:
                                    interRegular.copyWith(fontSize: 13.sp, color: const Color(0xff000000)),
                                  ),

                                ],
                              ),
                              SizedBox(height: 16.h),

                              /// ---------- description ------------->
                              _buildDescriptionSection(product),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(color: Color(0xffFfffff)),
                  child: Row(
                    children: [
                      Container(
                        height: 52.h,
                        width: 52.w,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xffF1F1F1),
                          //borderRadius: BorderRadius.circular(8),
                        ),
                        child: Badge(
                          label: const Text('0'),
                          backgroundColor: const Color(0xffFFA800),
                          child: Assets.icons.icCart.svg(),
                        ),
                      ),
                      const SizedBox(width: 13),
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {},
                          titleText: "Add to Cart",
                          buttonColor: const Color(0xffFFA800),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildProductImage(ProductDetailsResponseModel productDetails) {
    return ProductImageGallery(
      thumbImage: productDetails.product?.thumbImage,
      gallery: productDetails.gellery,
    );
  }


  Widget _buildDescriptionSection(ProductDetailModel product) {
    // Basic stripping of HTML tags for display
    String stripHtml(String html) {
      return html.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
    }

    final description = product.longDescription ?? product.shortDescription ?? '';
    final clearDescription = stripHtml(description).trim();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.shortDescription ?? "N/A",
          style: interRegular.copyWith(
            color: Color(0xff797979),
            fontSize: 14.sp,
          ),
        ),

        Text(
          "Introduction",
          style: interMedium.copyWith(
            fontSize: 18.sp,
            color: const Color(0xff222222),
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          clearDescription.isNotEmpty
              ? clearDescription
              : "No description available.",
          style: interRegular.copyWith(
            fontSize: 14.sp,
            color: const Color(0xff797979),
            height: 1.4,
          ),
        ),
      ],
    );
  }

}
