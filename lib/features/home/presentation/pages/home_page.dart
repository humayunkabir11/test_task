
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/init_dependencies.dart';
import '../../data/models/home_data-response_model.dart';
import '../bloc/home_bloc.dart';
import 'all_product_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(LoadHomeDataEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeError) {
              return Center(child: Text(state.message));
            } else if (state is HomeLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state.homeData.homepageCategories != null &&
                        state.homeData.homepageCategories!.isNotEmpty) ...[
                      const Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.homeData.homepageCategories!.length,
                          itemBuilder: (context, index) {
                            final category =
                                state.homeData.homepageCategories![index];
                            return Container(
                              width: 80,
                              margin: const EdgeInsets.only(right: 10),
                              child: Column(
                                children: [
                                  // Placeholder for icon/image since standard Image.network might fail if url is broken/relative
                                  // API returns relative paths like "uploads/..." usually need base url.
                                  // Assuming base url is https://mamunuiux.com/flutter_task/
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: category.image != null
                                        ? NetworkImage(
                                            'https://mamunuiux.com/flutter_task/${category.image}')
                                        : null,
                                    child: category.image == null
                                        ? const Icon(Icons.category)
                                        : null,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    category.name ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 12),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'New Arrivals',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
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
                    const SizedBox(height: 10),
                    if (state.homeData.newArrivalProducts != null)
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: state.homeData.newArrivalProducts!.length,
                        itemBuilder: (context, index) {
                          final product =
                              state.homeData.newArrivalProducts![index];
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
                                  padding: const EdgeInsets.all(8.0),
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
                                      const SizedBox(height: 5),
                                      Text(
                                        'Qty: ${product.qty}',
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                      const SizedBox(height: 5),
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
                                              style: const TextStyle(
                                                fontSize: 12,
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
