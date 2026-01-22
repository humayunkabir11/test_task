import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testing/core/common/widgets/button/elevated_button.dart';
import 'package:testing/core/config/theme/style.dart';

import '../../../../core/common/widgets/appbar/custom_appbar.dart';
import '../../../../core/custom_assets/assets.gen.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: CustomAppBar(
        centerTitle: true,
        title: Text("Popular Sells"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Assets.icons.icHeartfill.svg(
              colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _productImage(),
                    SizedBox(height: 12.h),
                    _imagePreviewRow(),
                    SizedBox(height: 16.h),
                    _priceSection(),
                    SizedBox(height: 8.h),
                    _titleSection(),
                    SizedBox(height: 8.h),
                    _ratingSection(),
                    SizedBox(height: 16.h),
                    _descriptionSection(),
                    SizedBox(height: 16.h),
                    _featuresSection(),
                    SizedBox(height: 100.h),
                  ],
                ),
              ),
            ),
            _buildAddToCartBar(),
          ],
        ),
      ),
    );
  }
}

Widget _productImage() {
  return Center(
    child: Container(
      height: 200.h,
      width: 200.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
      ),
      child: const Icon(Icons.phone_iphone, size: 120, color: Colors.grey),
    ),
  );
}

Widget _imagePreviewRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: List.generate(5, (index) {
      return Container(
        height: 58.h,
        width: 58.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: index == 0 ? Color(0xffE8E8E8) : Colors.transparent,
          ),
        ),
        child: const Icon(Icons.phone_android, size: 24),
      );
    }),
  );
}

Widget _priceSection() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        "\$6.99",
        style: interMedium.copyWith(fontSize: 24.sp, color: Color(0xffEF262C)),
      ),
      SizedBox(width: 8.w),
      Text(
        "\$9.99",
        style: interMedium.copyWith(
          fontSize: 15.sp,
          color: Color(0xff9A9A9A),
          decoration: TextDecoration.lineThrough,
        ),
      ),
    ],
  );
}

Widget _titleSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "MOBILE PHONES",
        style: interRegular.copyWith(fontSize: 12.sp, color: Color(0xff9A9A9A)),
      ),
      SizedBox(height: 4.h),
      Text(
        "Samsung Galaxy Z Fold3 5G\n3 colors in 512GB",
        style: interMedium.copyWith(fontSize: 20.sp, color: Color(0xff222222)),
      ),
    ],
  );
}

Widget _ratingSection() {
  return Row(
    children: [
      Row(
        children: List.generate(
          5,
          (_) => Assets.icons.icStart.svg(height: 15, width: 15),
        ),
      ),
      SizedBox(width: 8.w),
      Text(
        "(6 Reviews)",
        style: interRegular.copyWith(fontSize: 13.sp, color: Color(0xff000000)),
      ),
    ],
  );
}

Widget _descriptionSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
        style: interRegular.copyWith(
          fontSize: 14.sp,
          color: Color(0xff797979),
          height: 1.4,
        ),
      ),
      Text(
        "Introduction",
        style: interMedium.copyWith(fontSize: 16.sp, color: Color(0xff222222)),
      ),
      SizedBox(height: 6.h),
      Text(
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s into the find it to make amazing.",
        style: interRegular.copyWith(
          fontSize: 14.sp,
          color: Color(0xff797979),
          height: 1.4,
        ),
      ),
    ],
  );
}

Widget _featuresSection() {
  final features = [
    "Slim body with metal cover",
    "Latest Intel Core i5-1135G7 processor",
    "8GB DDR4 RAM and fast 512GB PCIe SSD NVIDIA GeForce MX350 2GB GDDR5 graphics card backlit keyboard, touchpad with gesture suppot",
    "NVIDIA GeForce MX350 2GB GDDR5 graphics card backlit keyboard, touchpad with gesture support",
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Features :",
        style: interMedium.copyWith(fontSize: 16.sp, color: Color(0xff222222)),
      ),
      SizedBox(height: 8.h),
      ...features.map(
        (item) => Padding(
          padding: EdgeInsets.only(bottom: 6.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff222222),
                ),
              ),
              Gap(8),

              Expanded(
                child: Text(
                  item,
                  style: interRegular.copyWith(
                    fontSize: 14.sp,
                    color: Color(0xff797979),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _buildAddToCartBar() {
  return Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(color: Color(0xffF1F1F1)),
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
            label: Text('3'),
            backgroundColor: Color(0xffFFA800),
            child: Assets.icons.icCart.svg(),
          ),
        ),
        const SizedBox(width: 13),
        Expanded(
          child: CustomElevatedButton(
            onPressed: () {},
            titleText: "Add to Cart",
            buttonColor: Color(0xffFFA800),
          ),
        ),
      ],
    ),
  );
}
