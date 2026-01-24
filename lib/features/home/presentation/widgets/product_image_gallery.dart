import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/common/widgets/image/cache_image.dart';
import '../../../../core/config/theme/style.dart';
import '../../data/models/product_details_response_model.dart';

class ProductImageGallery extends StatefulWidget {
  final String? thumbImage;
  final List<GalleryModel>? gallery;

  const ProductImageGallery({
    super.key,
    required this.thumbImage,
    required this.gallery,
  });

  @override
  State<ProductImageGallery> createState() => _ProductImageGalleryState();
}

class _ProductImageGalleryState extends State<ProductImageGallery> {
  String? _selectedImage;

  @override
  void initState() {
    super.initState();
    _selectedImage = widget.thumbImage;
  }

  @override
  void didUpdateWidget(covariant ProductImageGallery oldWidget) {
    if (oldWidget.thumbImage != widget.thumbImage) {
      _selectedImage = widget.thumbImage;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {


    final List<String> allImages = [];
    if (widget.thumbImage != null) {
      allImages.add(widget.thumbImage!);
    }
    if (widget.gallery != null) {
      allImages.addAll(widget.gallery!.map((e) => e.image).whereType<String>());
    }

    return Column(
      children: [
        // Main Image
        Center(
          child: Container(
            height: 250.h,
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffFFBB38).withOpacity(0.1),
             // borderRadius: BorderRadius.circular(10), // Optional
            ),
            child: _selectedImage != null
                ? CacheImage(
                    height: 195,
                    width: 195,
                    fit: BoxFit.contain,
                    imageUrl:
                        'https://mamunuiux.com/flutter_task/$_selectedImage',
                  )
                : const Icon(Icons.image, size: 120, color: Colors.grey),
          ),
        ),
        SizedBox(height: 16.h),

        // Thumbnails
        if (allImages.isNotEmpty)
          SizedBox(
            height: 60.h,
            child: ListView.separated(

              padding: EdgeInsets.symmetric(horizontal: 16.w),
              scrollDirection: Axis.horizontal,
              itemCount: allImages.length,
              separatorBuilder: (context, index) => SizedBox(width: 10.w),
              itemBuilder: (context, index) {
                final image = allImages[index];
                final isSelected = _selectedImage == image;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedImage = image;
                    });
                  },
                  child: Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected ? const Color(0xffE8E8E8) : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CacheImage(
                        imageUrl:
                            'https://mamunuiux.com/flutter_task/$image',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
