
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/common/widgets/appbar/custom_appbar.dart';
import '../../../../core/common/widgets/field/custom_text_field.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/di/init_dependencies.dart';
import '../bloc/all_product_bloc.dart';

class AllProductPage extends StatelessWidget {
  const AllProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AllProductBloc>()..add(LoadProductsEvent()),
      child: const _AllProductView(),
    );
  }
}

class _AllProductView extends StatefulWidget {
  const _AllProductView();

  @override
  State<_AllProductView> createState() => _AllProductViewState();
}

class _AllProductViewState extends State<_AllProductView> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<AllProductBloc>().add(LoadMoreProductsEvent());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("All Products"),
        centerTitle: true,
        height: 60.h,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: CustomTextField(
              controller: _searchController,
              hintText: 'Search products...',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Assets.icons.icSearch.svg(height: 16.h, width: 16.w),
              ),
              filledColor: const Color(0xFFE7F0EF).withValues(alpha: 0.46),
              borderRadius: 8,
              onFieldSubmitted: (query) {
                if(query.isNotEmpty) {
                    context.read<AllProductBloc>().add(SearchProductsEvent(query));
                }
              },
              suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                     _searchController.clear();
                     context.read<AllProductBloc>().add(LoadProductsEvent());
                  },
              )
            ),
          ),
          
          Expanded(
            child: BlocBuilder<AllProductBloc, AllProductState>(
              builder: (context, state) {
                if (state is AllProductLoading && state is! AllProductLoaded) { // Initial loading
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AllProductError) {
                   if (state.message.contains("no internet")) {
                        return Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.wifi_off, size: 60, color: Colors.grey),
                            Text("No Internet Connection"),
                            ElevatedButton(onPressed: (){
                               context.read<AllProductBloc>().add(LoadProductsEvent());
                            }, child: const Text("Retry"))
                          ],
                        ));
                   }
                  return Center(child: Text(state.message));
                } else if (state is AllProductLoaded) {
                  if (state.products.isEmpty) {
                    return const Center(child: Text('No products found.'));
                  }
                  return GridView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.all(10.w),
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                    ),
                    itemCount: state.hasReachedMax
                        ? state.products.length
                        : state.products.length + 1,
                    itemBuilder: (context, index) {
                      if (index >= state.products.length) {
                         return Padding(
                           padding: EdgeInsets.all(8.0.w),
                           child: const Center(child: CircularProgressIndicator()),
                         );
                      }
                      final product = state.products[index];
                       return Card(
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
                                            const SizedBox(width: 5),
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
                          );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
