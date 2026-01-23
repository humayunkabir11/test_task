
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/common/widgets/button/elevated_button.dart';
import '../../../../core/config/theme/style.dart';
import '../../../../core/common/widgets/appbar/custom_appbar.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/di/init_dependencies.dart';
import '../../data/models/product_details_response_model.dart';
import '../bloc/product_details_bloc.dart';
import '../bloc/product_details_event.dart';
import '../bloc/product_details_state.dart';

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
        title: const Text("Product Details"),
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
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProductImage(product),
                        SizedBox(height: 12.h),
                        // _imagePreviewRow(), // Gallery implementation can be added if API provides gallery
                        SizedBox(height: 16.h),
                        _buildPriceSection(product),
                        SizedBox(height: 8.h),
                        _buildTitleSection(product),
                        SizedBox(height: 8.h),
                        _buildRatingSection(product),
                        SizedBox(height: 16.h),
                        _buildDescriptionSection(product),
                        SizedBox(height: 16.h),
                        if (product.activeVariants != null &&
                            product.activeVariants!.isNotEmpty)
                          _buildVariantsSection(product.activeVariants!),
                         SizedBox(height: 16.h),
                        if (state.productDetails.relatedProducts != null &&
                            state.productDetails.relatedProducts!.isNotEmpty)
                           _buildRelatedProducts(context, state.productDetails.relatedProducts!),
                        SizedBox(height: 100.h),
                      ],
                    ),
                  ),
                ),
                _buildAddToCartBar(),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildProductImage(ProductDetailModel product) {
    return Center(
      child: Container(
        height: 250.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
          image: product.thumbImage != null
              ? DecorationImage(
                  image: NetworkImage(
                      'https://mamunuiux.com/flutter_task/${product.thumbImage}'),
                  fit: BoxFit.contain,
                )
              : null,
        ),
        child: product.thumbImage == null
            ? const Icon(Icons.image, size: 120, color: Colors.grey)
            : null,
      ),
    );
  }

  Widget _buildPriceSection(ProductDetailModel product) {
     final price = product.price;
     final offerPrice = product.offerPrice;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "\$${offerPrice ?? price}",
          style:
              interMedium.copyWith(fontSize: 24.sp, color: const Color(0xffEF262C)),
        ),
        if (offerPrice != null && price != null) ...[
          SizedBox(width: 8.w),
          Text(
            "\$$price",
            style: interMedium.copyWith(
              fontSize: 15.sp,
              color: const Color(0xff9A9A9A),
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTitleSection(ProductDetailModel product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (product.brand != null)
        Text(
          product.brand?.name?.toUpperCase() ?? "",
          style:
              interRegular.copyWith(fontSize: 12.sp, color: const Color(0xff9A9A9A)),
        ),
        SizedBox(height: 4.h),
        Text(
          product.name ?? '',
          style: interMedium.copyWith(fontSize: 20.sp, color: const Color(0xff222222)),
        ),
      ],
    );
  }

  Widget _buildRatingSection(ProductDetailModel product) {
    return Row(
      children: [
        Row(
          children: List.generate(
            5,
            (_) => Assets.icons.icStart.svg(height: 15, width: 15),
          ),
        ),
        SizedBox(width: 8.w),
        // Text(
        //   "(${product.averageRating ?? 0} Reviews)",
        //   style:
        //       interRegular.copyWith(fontSize: 13.sp, color: const Color(0xff000000)),
        // ), 
        // Showing dummy reviews count as API returns 0 or empty often, or use dynamic if available
      ],
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
          "Description",
          style: interMedium.copyWith(fontSize: 16.sp, color: const Color(0xff222222)),
        ),
        SizedBox(height: 6.h),
        Text(
          clearDescription.isNotEmpty ? clearDescription : "No description available.",
          style: interRegular.copyWith(
            fontSize: 14.sp,
            color: const Color(0xff797979),
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildVariantsSection(List<ActiveVariant> variants) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: variants.map((variant) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${variant.name} :",
                style: interMedium.copyWith(
                    fontSize: 16.sp, color: const Color(0xff222222)),
              ),
              SizedBox(height: 8.h),
              Wrap(
                spacing: 8.w,
                children: variant.activeVariantItems?.map((item) {
                  return Chip(
                    label: Text(item.name ?? ''),
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.grey),
                  );
                }).toList() ?? [],
              )
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildRelatedProducts(BuildContext context, List<dynamic> relatedProducts) { // Using dynamic as list type from model might differ slightly if reused
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(
                "Related Products",
                style: interMedium.copyWith(fontSize: 16.sp, color: const Color(0xff222222)),
            ),
            Gap(10.h),
            SizedBox(
                height: 120.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: relatedProducts.length,
                    itemBuilder: (context, index) {
                        final related = relatedProducts[index];
                        return GestureDetector(
                          onTap: () {
                             // Navigate to same page with new slug
                              if (related.slug != null) {
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (_) => ProductDetailsPage(slug: related.slug!))
                                );
                              }
                          },
                          child: Container(
                              width: 100.w,
                              margin: EdgeInsets.only(right: 10.w),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Column(
                                  children: [
                                      Expanded(
                                          child: related.thumbImage != null ? Image.network(
                                              'https://mamunuiux.com/flutter_task/${related.thumbImage}',
                                              fit: BoxFit.cover,
                                          ) : const Icon(Icons.image),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(related.name ?? '', maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 10.sp)),
                                      )
                                  ],
                              ),
                          ),
                        );
                    },
                ),
            )
        ],
      );
  }


  Widget _buildAddToCartBar() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(color: Color(0xffF1F1F1)),
      child: Row(
        children: [
          Container(
            height: 48.h,
            width: 48.w,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
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
    );
  }
}
