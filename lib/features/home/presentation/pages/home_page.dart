
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:testing/core/config/routes/route_path.dart';
import 'package:testing/core/config/theme/style.dart';
import '../../../../core/common/widgets/appbar/custom_appbar.dart';
import '../../../../core/common/widgets/field/custom_text_field.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/di/init_dependencies.dart';
import '../../data/models/home_data-response_model.dart';
import '../bloc/home_bloc.dart';
import 'all_product_page.dart';
import 'product_details_page.dart';
import '../widgets/produc_card.dart';
import '../widgets/category_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _searchController;
  Timer? _debounce;
  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _homeBloc = sl<HomeBloc>()..add(LoadHomeDataEvent());
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    _homeBloc.close();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        _homeBloc.add(SearchProductsEvent(query));
      } else {
        _homeBloc.add(LoadProductsEvent());
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homeBloc,
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor:  Color(0xffF8F8F8),
          title: CustomTextField(
            controller: _searchController,
            hintText: 'Search products',
            textInputAction: TextInputAction.search,
            prefixIcon: Assets.icons.icSearch.svg(height: 16.h, width: 16.w),
            filledColor: Colors.white,
            enabled: true,
            borderRadius: 8,

            onChanged: _onSearchChanged,
            onFieldSubmitted: (query) {
              if (_debounce?.isActive ?? false) _debounce!.cancel();
              if (query.isNotEmpty) {
                _homeBloc.add(SearchProductsEvent(query));
              }
            },
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                if (_debounce?.isActive ?? false) _debounce!.cancel();
                _searchController.clear();
                _homeBloc.add(LoadProductsEvent());
              },
            )
                : SizedBox.shrink(),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading && state is! HomeLoaded) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeError) {
              if (state.message.toLowerCase().contains("no internet")) {
                return Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.wifi_off, size: 60, color: Colors.grey),
                    Gap(10),
                    Text("No Internet Connection",style: interRegular.copyWith(color:Colors.grey),),
                    Gap(10),
                    ElevatedButton(onPressed: (){
                      _homeBloc.add(LoadHomeDataEvent());
                    }, child: const Text("Retry"))
                  ],
                ));
              }
              return Center(child: Text(state.message));
            } else if (state is HomeLoaded) {
              return SingleChildScrollView(
                // padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(8),
                    if (state.homeData.homepageCategories != null &&
                        state.homeData.homepageCategories!.isNotEmpty) ...[
                      Container(
                        height: 162.h,
                        padding: EdgeInsets.only(
                            bottom: 8.h, left: 20.w, right: 20.w),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Categories',
                                  style: interSemiBold.copyWith(
                                    color: Color(0xff222222),
                                    fontSize: 18.sp,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.pushNamed(RoutePath.allProductPage,
                                        extra: null);
                                  },
                                  child: Text(
                                    'See All',
                                    style: interRegular.copyWith(
                                        color: Color(0xff797979),
                                        fontSize: 18.sp),
                                  ),
                                ),
                              ],
                            ),

                            /// ---------------- Categories list --------------->
                            SizedBox(
                              height: 95.h,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                state.homeData.homepageCategories!.length,
                                itemBuilder: (context, index) {
                                  final category =
                                  state.homeData.homepageCategories![index];
                                  return CategoryItem(
                                    category: category,
                                    onTap: () {
                                      context.pushNamed(RoutePath.allProductPage,
                                          extra: category.id);
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(20),
                    ],
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'New Arrivals',
                            style: interSemiBold.copyWith(
                              color: Color(0xff222222),
                              fontSize: 18.sp,
                            ),
                          ),
                          Assets.icons.icFilter.svg()
                        ],
                      ),
                    ),
                    Gap(10.h),
                    if (state.homeData.newArrivalProducts!.isEmpty)
                      const Center(child: Text('No products found')),

                    if (state.homeData.newArrivalProducts != null)
                    /// ------------------ New Arrivals List ------------------>
                      GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 12.h),
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 14.w,
                          mainAxisSpacing: 16.h,
                        ),
                        itemCount: state.homeData.newArrivalProducts!.length,
                        itemBuilder: (context, index) {
                          final product =
                          state.homeData.newArrivalProducts![index];
                          return ProductCard(
                            product: product,
                            onTap: () {
                              if (product.slug != null) {
                                context.pushNamed(
                                    RoutePath.productDetailsPage,
                                    extra: product.slug);
                              }
                            },
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