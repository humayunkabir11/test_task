import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/common/widgets/button/elevated_button.dart';
import '../../../../core/common/widgets/field/custom_text_field.dart';
import '../../../../core/config/theme/style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../domain/usecase/auth_usecase.dart';
import '../bloc/auth_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _emailController = TextEditingController(text: "teacher1@admin.com");
  final TextEditingController _passwordController = TextEditingController(text: "Admin@123");
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [


            // Form Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  // Welcome Section
                  Text(
                    'Welcome!',
                    style: interRegular.copyWith(
                      color: const Color(0xFF5C5C5C),
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      height: 1.10,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    'Sign in To Continue.',
                    style: interRegular.copyWith(
                      color: const Color(0xFF757575),
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      height: 1.10,
                    ),
                  ),
                  const Gap(16),
                  _buildEmailField(),
                  const Gap(16),
                  _buildPasswordField(),
                  const Gap(16),
                  _buildRememberMeAndForgotPassword(),
                  const Gap(32),
                  _buildSignInButton(),
                  const Gap(24),
                  _buildSignUpText(),
                  const Gap(40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return CustomTextField(
      controller: _emailController,
      hintText: 'Enter Your Email',
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      prefixIcon: Padding(
        padding: EdgeInsets.all(16.w),
        child: SvgPicture.asset("assets/icons/ic_email.svg"),
      ),
      filledColor: const Color(0x75E7F0EF),
      borderRadius: 12,
      contentPadding: EdgeInsets.all(0),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!value.contains('@')) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return CustomTextField(
      controller: _passwordController,
      hintText: 'Enter Your Password',
      isPassword: true,
      textInputAction: TextInputAction.done,
      contentPadding: EdgeInsets.all(0),
      prefixIcon: Padding(
        padding: EdgeInsets.all(16.w),
        child: SvgPicture.asset("assets/icons/ic_lock.svg"),
      ),
      filledColor: const Color(0x75E7F0EF),
      borderRadius: 12,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }

  Widget _buildRememberMeAndForgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Remember Me Checkbox
        Row(
          children: [
            SizedBox(
              height: 20.h,
              width: 20.w,
              child: Checkbox(
                value: _rememberMe,

                onChanged: (value) {
                  setState(() {
                    _rememberMe = value ?? false;
                  });
                },
                activeColor: Color(0xFF4A90E2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: BorderSide(color: const Color(0xFF757575), width: 1.5),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              'Remember Me',
              style: interRegular.copyWith(
                color: const Color(0xFF757575),
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                height: 1.48,
              ),
            ),
          ],
        ),
        // Forgot Password
        GestureDetector(
          onTap: () {
            // TODO: Navigate to forgot password
          },
          child: Text(
            'Forgot Password?',

            style: interRegular.copyWith(
              color: Color(0xFFFED12F),
              fontSize: 16,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
              decorationColor: Color(0xFFFED12F),
              height: 1.10,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignInButton() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return CustomElevatedButton(
          onPressed: () {
            final params = GetAuthParams(
              body: {
                "email": _emailController.text,
                "password": _passwordController.text,
              },
            );

            context.read<AuthBloc>().add(LoginEvent(params: params));
          },
          isLoading: state is LoginLoadingState,
          titleText: 'Sign In',
          buttonColor: Color(0xFF3F80AE),
          titleSize: 16.sp,
          buttonHeight: 54.h,
          borderRadius: 12,
          enableShadow: true,
        );
      },
    );
  }

  Widget _buildSignUpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: interRegular.copyWith(
            color: const Color(0xFF757575),
            fontSize: 16,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            height: 1.10,
          ),
        ),
        GestureDetector(
          onTap: () {
            // TODO: Navigate to sign up
          },
          child: Text(
            'Sign Up',
            style: interSemiBold.copyWith(
              fontSize: 16,
              fontFamily: 'Montserrat',
              color: const Color(0xFFFED12F),
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
              height: 1.10,
              decorationColor: const Color(0xFFFED12F),
            ),
          ),
        ),
      ],
    );
  }
}

// Custom Clipper for the curved bottom of the top section
