import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/config/theme/style.dart';
import '../../data/models/role_model.dart';

class RoleCard extends StatelessWidget {
  final RoleModel role;
  final ValueChanged<RoleModel> onRoleSelected;
  final bool isSelected;

  const RoleCard({
    super.key,
    required this.onRoleSelected,
    required this.role,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onRoleSelected(role);
      },
      child: Container(
        width: 165.w,
        padding: EdgeInsets.all(20),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: isSelected ? const Color(0xFF3F80AE) : Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: isSelected
                  ? const Color(0xFF6599BE)
                  : const Color(0x996599BE),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [
            SvgPicture.asset(role.image, height: 48, width: 48),
            Text(
              role.title,
              textAlign: TextAlign.center,
              style: interRegular.copyWith(
                color: isSelected
                    ? const Color(0xffffffff)
                    : const Color(0xFF6599BE),
                fontSize: 18.sp,
                height: 1.10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
