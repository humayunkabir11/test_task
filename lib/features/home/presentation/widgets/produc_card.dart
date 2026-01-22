
// --- Product Card Widget ---
import 'package:flutter/material.dart';
import 'package:testing/core/config/theme/style.dart';

import '../../../../core/common/widgets/image/cache_image.dart';
import '../../../../core/custom_assets/assets.gen.dart';

class ProductCard extends StatelessWidget {
  final VoidCallback ? onTap;
  const ProductCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image Placeholder
                Expanded(
                  child: Center(
                    child: CacheImage(imageUrl: "",height: 90,width: 90,),
                  ),
                ),
                const SizedBox(height: 10),

                // Rating
                Row(
                  children: List.generate(
                    5,
                        (index) =>
                        Assets.icons.icStart.svg(),
                  ),
                ),
                const SizedBox(height: 5),

                // Title
                 Text(
                  'Samsung Galaxy 3 in 512GB',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: interMedium.copyWith(color: Color(0xff222222), fontSize: 16),
                ),
                const SizedBox(height: 5),

                // Price
                Row(
                  children: [
                     Text(
                      '\$69',
                      style: interSemiBold.copyWith(
                        color: Color(0xffEF262C),
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '\$87',
                      style: interRegular.copyWith(
                        color: Color(0xff9A9A9A),
                        decoration: TextDecoration.lineThrough,
                        fontSize: 14,
                      ),
                    ),
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