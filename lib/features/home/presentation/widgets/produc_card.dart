
import 'package:flutter/material.dart';
import 'package:testing/core/config/theme/style.dart';

import '../../../../core/common/widgets/image/cache_image.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../data/models/home_data-response_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                Expanded(
                  child: Center(
                    child: CacheImage(
                      imageUrl: product.thumbImage != null
                          ? 'https://mamunuiux.com/flutter_task/${product.thumbImage}'
                          : '',
                      height: 90,
                      width: 90,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Rating
                Row(
                  children: List.generate(
                    5,
                    (index) => Assets.icons.icStart.svg(),
                  ),
                ),
                const SizedBox(height: 5),

                // Title
                Text(
                  product.name ?? 'No Name',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: interMedium.copyWith(
                      color: const Color(0xff222222), fontSize: 16),
                ),
                const SizedBox(height: 5),

                // Price
                Row(
                  children: [
                    Text(
                      '\$${product.offerPrice ?? product.price}',
                      style: interSemiBold.copyWith(
                        color: const Color(0xffEF262C),
                        fontSize: 18,
                      ),
                    ),
                    if (product.offerPrice != null) ...[
                      const SizedBox(width: 4),
                      Text(
                        '\$${product.price}',
                        style: interRegular.copyWith(
                          color: const Color(0xff9A9A9A),
                          decoration: TextDecoration.lineThrough,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
            // Heart Icon
            Positioned(
              top: 0,
              right: 0,
              child: Assets.icons.icHeart.svg(),
            ),
          ],
        ),
      ),
    );
  }
}