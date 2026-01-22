import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/image/cache_image.dart';
import '../../../../core/config/theme/style.dart';

class UserMessageTile extends StatelessWidget {
  final List<String> messages;
  const UserMessageTile({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///--------------------profile pic
        CacheImage(
          imageUrl:
              "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpapers-clan.com%2Fwp-content%2Fuploads%2F2023%2F10%2Fnaruto-itachi-uchiha-with-red-eyes-desktop-wallpaper-preview.jpg&f=1&nofb=1&ipt=7f7a1a7e61d402346b3caab1a687ee3b05f44a481104ff8936730526aed4635d",
          height: 24,
          width: 24,
          borderRadius: 100,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///------------------user name
              Text(
                "Edward Davidson",
                style: interRegular.copyWith(
                  fontSize: 12.sp,
                  letterSpacing: 0,
                  color: const Color(0xFF5C5C5C),
                ),
              ),

              ...messages.map((e)=> Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                margin: EdgeInsets.only(top: 6, right: 0.2.sw, bottom: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE7F0EF).withValues(alpha: 0.46),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text(
                      "10:08 AM",
                      style: interRegular.copyWith(
                        fontSize: 12.sp,
                        color: const Color(0xFFF66E10),
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
