import 'package:flutter/material.dart';
import 'package:testing/core/common/widgets/image/cache_image.dart';
import 'package:testing/core/config/theme/style.dart';

// --- Category Item Widget ---
class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF7E7), // Light cream color from image
            shape: BoxShape.circle,
          ),
          child: CacheImage(imageUrl: "",borderRadius: 100,),
        ),
        const SizedBox(height: 8),
        Text(title, style: interRegular.copyWith(color: Color(0xff797979), fontSize: 14)),
      ],
    );
  }
}