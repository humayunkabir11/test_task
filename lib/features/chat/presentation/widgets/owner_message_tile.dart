import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/style.dart';

class OwnerMessageTile extends StatelessWidget {
  final List<String> messages;
  const OwnerMessageTile({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ...messages.map(
          (e) => Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            margin: EdgeInsets.only(top: 6, left: 0.2.sw, bottom: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFE7F0EF).withValues(alpha: 0.46),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                Text(
                  e,
                  style: interRegular.copyWith(
                    fontSize: 12.sp,
                    color: const Color(0xFF757575),
                    letterSpacing: 0,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 6,
                  children: [
                    Text(
                      "10:08 AM",
                      style: interRegular.copyWith(
                        fontSize: 12.sp,
                        color: const Color(0xFF757575),
                        letterSpacing: 0,
                      ),
                    ),

                    Icon(
                      Icons.done_all,
                      size: 16,
                      color: const Color(0xFF757575),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
