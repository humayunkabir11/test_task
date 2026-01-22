import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testing/core/extensions/custom_extentions.dart';


import '../../../../core/common/widgets/image/cache_image.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/theme/style.dart';
import '../../data/models/chat/inbox_data.dart';

class ChatTile extends StatelessWidget {
  final VoidCallback onTap;
  final InboxData? chat;
  const ChatTile({super.key, required this.onTap, this.chat});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.2, color: Color(0xFFA7C5DA)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 12,
          children: [
            CacheImage(
              imageUrl: chat?.otherUser?.profileImage,
              height: 40,
              width: 40,
              borderRadius: 8,
              errorWidget: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  chat?.otherUser?.firstName ??
                      "C ".substring(0, 1).toUpperCase(),
                  style: interRegular.copyWith(
                    fontSize: 18.sp,
                    color: Colors.white,
                    letterSpacing: 0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 6,
                    children: [
                      Expanded(
                        child: Text(
                          chat?.otherUser?.firstName ?? "",
                          style: interRegular.copyWith(
                            fontSize: 16.sp,
                            color: const Color(0xFF5C5C5C),
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                      Text(
                        chat?.lastMessage?.createdAt?.timeAgo ?? "-:-",
                        style: interRegular.copyWith(
                          fontSize: 12.sp,
                          letterSpacing: 0,
                          color: const Color(0xFF5C5C5C),
                        ),
                      ),
                    ],
                  ),
                  const Gap(4),
                  Text(
                    chat?.lastMessage?.content ?? "n/a",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: interRegular.copyWith(
                      fontSize: 14.sp,
                      color: const Color(0xFF757575),
                      letterSpacing: 0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
