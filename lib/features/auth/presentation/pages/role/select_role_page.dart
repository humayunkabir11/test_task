import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common/widgets/appbar/custom_appbar.dart';
import '../../../../../core/common/widgets/button/elevated_button.dart';
import '../../../../../core/config/routes/app_route.dart';
import '../../../../../core/config/routes/route_path.dart';
import '../../../../../core/config/theme/style.dart';
import '../../../data/models/role_model.dart';
import '../../bloc/auth_bloc.dart';
import '../../widgets/role_card.dart';

class SelectRolePage extends StatelessWidget {
  const SelectRolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        //toolbarHeight: 80,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomElevatedButton(
          onPressed: () {
            context.pushNamed(RoutePath.loginPage);
          },
          titleText: "Continue",
          buttonHeight: 48,
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthRoleSelected) {
            Fluttertoast.showToast(
              msg: "Selected ${state.role}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
        builder: (context, state) {
          UserRole? selectedRole;
          if (state is AuthRoleSelected) {
            selectedRole = state.role;
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create an Account',
                  style: interRegular.copyWith(
                    color: const Color(0xFF5C5C5C),
                    fontSize: 28.sp,
                    height: 1.40,
                  ),
                ),
                Gap(4),
                Text(
                  'Choose user Type',
                  style: interRegular.copyWith(
                    color: const Color(0xFF757575),
                    fontSize: 20.sp,
                    height: 1.10,
                  ),
                ),
                Gap(32),
                Wrap(
                  runSpacing: 12,
                  spacing: 12,
                  children: List.generate(userRoles.length, (index) {
                    final role = userRoles[index];
                    return RoleCard(
                      role: role,
                      isSelected: role.role == selectedRole,
                      onRoleSelected: (r) {
                       // context.read<AuthBloc>().add(SelectRoleEvent(r?.role??""));
                      },
                    );
                  }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
