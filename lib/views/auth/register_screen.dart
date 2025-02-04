import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsafeclass/constants/ui_constants.dart';
import 'package:nsafeclass/controllers/auth/auth_controller.dart';
import 'package:nsafeclass/theme/pallete.dart';
import 'package:nsafeclass/views/auth/login_screen.dart';
import 'package:nsafeclass/widgets/text_field_widget.dart';

class RegisterScreen extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (builder) => const RegisterScreen(),
      );
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController fullnameController;
  late final AuthController authController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fullnameController = TextEditingController();
    authController = Get.put(AuthController());
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fullnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.authAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: GoogleFonts.archivo(
                fontSize: 27.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Monitor your child's safety and stay\nreassured",
              style: GoogleFonts.archivo(
                fontSize: 15.sp,
                color: Pallete.fieldTextColor,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFieldWidget(
              controller: fullnameController,
              hintText: 'Enter your full name',
              text: 'Full name',
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFieldWidget(
              controller: emailController,
              hintText: 'Enter your email address',
              text: 'Email',
            ),
            SizedBox(
              height: 30.h,
            ),
            TextFieldWidget(
              controller: passwordController,
              hintText: 'Enter password',
              text: 'Password',
              isPassword: true,
              icon: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.visibility,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: GetBuilder<AuthController>(
                init: authController,
                builder: (controller) {
                  return controller.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Pallete.activePurpleColor,
                          ),
                          onPressed: () async {
                            await controller.registerUser(
                              fullname: fullnameController.text.trim(),
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                          },
                          child: Text(
                            'Sign In',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              color: Pallete.whiteColor,
                              fontSize: 17.sp,
                            ),
                          ),
                        );
                },
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => const LoginScreen(),
                  );
                },
                child: Text(
                  'Log into your account',
                  style: GoogleFonts.inter(
                    fontSize: 15.sp,
                    color: Pallete.activePurpleColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
