import 'dart:developer';

import 'package:fancy_snackbar/fancy_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:point_of_sale/src/core/route/app_page.dart';
import 'package:point_of_sale/src/core/service/asset_service.dart';
import 'package:point_of_sale/src/core/style/app_color.dart';
import 'package:point_of_sale/src/features/auth/domain/entity/login_request_entity.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final request = LoginRequestEntity(
        username: _usernameController.text.trim(),
        password: _passwordController.text.trim(),
      );

      context.read<LoginBloc>().add(LoginSubmitted(request));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(AssetsService.loginBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              FancySnackbar.showSnackbar(
                context,
                snackBarType: FancySnackBarType.error,
                title: "Login failed",
                message: "${state.message}",
                duration: 5,
                onCloseEvent: () {
                  _usernameController.clear();
                  _passwordController.clear();
                },
              );
            } else if (state is LoginSuccess) {
              FancySnackbar.showSnackbar(
                context,
                snackBarType: FancySnackBarType.success,
                title: "Successfull login",
                message: "Welcome to the app!",
                duration: 5,
                onCloseEvent: () {
                  context.goNamed(Routes.home.name);
                },
              );
            }
          },
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 24.h,
                  ),
                  child: GlassContainer.clearGlass(
                    height: 420.h,
                    width: 400.w,
                    borderRadius: BorderRadius.circular(32.0),
                    blur: 18,
                    borderWidth: 2.0,
                    // color: Colors.white.withOpacity(0.10),
                    gradient: LinearGradient(
                      colors: [
                        AppColor.lightBackground.withValues(alpha: 0.20),
                        AppColor.accent.withValues(alpha: 0.10),
                        AppColor.primary.withValues(alpha: 0.08),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderGradient: LinearGradient(
                      colors: [
                        AppColor.accent.withValues(alpha: 0.35),
                        Colors.white.withValues(alpha: 0.10),
                      ],
                    ),
                    //  shadowColor: AppColor.lightBackground.withValues(alpha: 0.10),
                    elevation: 8,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.w,
                        vertical: 32.h,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w900,
                                color: AppColor.accent,
                                letterSpacing: 1.2,
                              ),
                            ),
                            SizedBox(height: 32.h),
                            TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                  color: AppColor.lightText.withOpacity(0.7),
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: AppColor.accent,
                                ),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColor.lightText,
                              ),
                              validator: (value) =>
                                  value == null || value.isEmpty
                                  ? 'Required'
                                  : null,
                            ),
                            SizedBox(height: 18.h),
                            TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: AppColor.lightText.withValues(
                                    alpha: 0.7,
                                  ),
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: AppColor.accent,
                                ),
                                filled: true,
                                fillColor: AppColor.lightBackground.withValues(
                                  alpha: 0.15,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              obscureText: true,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColor.lightText,
                              ),
                              validator: (value) =>
                                  value == null || value.isEmpty
                                  ? 'Required'
                                  : null,
                            ),
                            SizedBox(height: 28.h),
                            SizedBox(
                              width: double.infinity,
                              height: 48.h,
                              child: state is LoginLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColor.accent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        elevation: 2,
                                      ),
                                      onPressed: _submit,
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
