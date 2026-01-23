
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/common/widgets/appbar/custom_appbar.dart';
import '../../../../core/di/init_dependencies.dart';
import '../../data/models/home_data-response_model.dart';
import '../bloc/home_bloc.dart';
import 'all_product_page.dart';
import 'product_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(LoadHomeDataEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text("Home"),
          centerTitle: true,
          height: 60.h,
          automaticallyImplyLeading: false, 
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeError) {
              return Center(child: Text(state.message));
            } else if (state is HomeLoaded) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state.homeData.homepageCategories != null &&
                        state.homeData.homepageCategories!.isNotEmpty) ...[
                      Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      Gap(10.h),
                      SizedBox(
                        height: 100.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.homeData.homepageCategories!.length,
                          itemBuilder: (context, index) {
                            final category =
                                state.homeData.homepageCategories![index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AllProductPage(categoryId: category.id),
                                  ),
                                );
                              },
                              child: Container(
                                width: 80.w,
                                margin: EdgeInsets.only(right: 10.w),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30.r,
                                      backgroundImage: category.image != null
                                          ? NetworkImage(
                                              'https://mamunuiux.com/flutter_task/${category.image}')
                                          : null,
                                      child: category.image == null
                                          ? const Icon(Icons.category)
                                          : null,
                                    ),
                                    Gap(5.h),
                                    Text(
                                      category.name ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 12.sp),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Gap(20.h),
                    ],
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New Arrivals',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AllProductPage(),
                              ),
                            );
                          },
                          child: const Text('See All'),
                        ),
                      ],
                    ),
                    Gap(10.h),
                    if (state.homeData.newArrivalProducts != null)
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                             SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                        ),
                        itemCount: state.homeData.newArrivalProducts!.length,
                        itemBuilder: (context, index) {
                          final product =
                              state.homeData.newArrivalProducts![index];
                          return GestureDetector(
                            onTap: () {
                              if (product.slug != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailsPage(
                                      slug: product.slug!,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Card(
                              elevation: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        image: product.thumbImage != null
                                            ? DecorationImage(
                                                image: NetworkImage(
                                                    'https://mamunuiux.com/flutter_task/${product.thumbImage}'),
                                                fit: BoxFit.cover,
                                              )
                                            : null,
                                        color:
                                            Colors.grey[200], // Placeholder color
                                      ),
                                      child: product.thumbImage == null
                                          ? const Icon(Icons.image, size: 50)
                                          : null,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.name ?? 'No Name',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Gap(5.h),
                                        Text(
                                          'Qty: ${product.qty}',
                                          style: TextStyle(
                                              fontSize: 12.sp, color: Colors.grey),
                                        ),
                                        Gap(5.h),
                                        Row(
                                          children: [
                                            Text(
                                              '\$${product.offerPrice ?? product.price}',
                                              style: const TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            if (product.offerPrice != null &&
                                                product.price != null) ...[
                                              Gap(5.w),
                                              Text(
                                                '\$${product.price}',
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey,
                                                  decoration:
                                                      TextDecoration.lineThrough,
                                                ),
                                              ),
                                            ]
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
