
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing/core/common/widgets/image/cache_image.dart';
import 'package:testing/core/config/theme/style.dart';

import '../../data/models/home_data-response_model.dart';

// --- Category Item Widget ---
class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback? onTap;

  const CategoryItem({
    super.key,
    required this.category,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              height: 70.h,
              width: 70.w,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFFFFF7E7), // Light cream color from image
                shape: BoxShape.circle,
              ),
              child: category.image != null
                  ? CacheImage(
                imageUrl:
                'https://mamunuiux.com/flutter_task/${category.image}',
                // height: 70,
                // width: 70,
                fit: BoxFit.cover,
              )
                  : const Icon(Icons.category, color: Colors.orange),
            ),

            Text(
              category.name ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: interRegular.copyWith(
                  color: const Color(0xff797979), fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}