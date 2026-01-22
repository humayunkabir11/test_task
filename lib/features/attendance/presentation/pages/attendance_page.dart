import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:testing/core/extensions/custom_extentions.dart';
import '../../../../core/common/widgets/appbar/common_appbar.dart';
import '../../../../core/common/widgets/button/elevated_button.dart';
import '../../../../core/common/widgets/field/custom_text_field.dart';
import '../../../../core/config/theme/style.dart';
import '../../../../core/custom_assets/assets.gen.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 132),
        child: CommonAppbar(
         // trailing: Assets.icons.icEdit.svg(),
          onTrailingTap: () {},
        ),
      ),
      body: Center(
        child: Text("Attendance"),
      ),
    );
  }
}
