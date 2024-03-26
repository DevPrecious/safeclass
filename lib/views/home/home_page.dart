import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsafeclass/constants/constants.dart';
import 'package:nsafeclass/controllers/auth/auth_controller.dart';
import 'package:nsafeclass/controllers/parents/parent_controller.dart';
import 'package:nsafeclass/theme/pallete.dart';
import 'package:nsafeclass/widgets/click_tag_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ParentController parentController;
  late final AuthController authController;

  @override
  void initState() {
    parentController = Get.put(ParentController());
    authController = Get.put(AuthController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.activePurpleColor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 280.h,
                color: Pallete.activePurpleColor,
              ),
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/Pattern.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 40.h,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 30),
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => {},
                                    child: const CircleAvatar(
                                      radius: 20,
                                      backgroundColor:
                                          Pallete.activePurpleColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  SizedBox(
                                    width: 150.w,
                                    child: GetBuilder<AuthController>(
                                        init: authController,
                                        builder: (controller) {
                                          return Text(
                                            'Hi, ${controller.nemail.value}',
                                            style: GoogleFonts.archivo(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Pallete.secondaryColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Image.asset(
                                      'assets/images/message.png',
                                      width: 22.w,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Pallete.secondaryColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Image.asset(
                                        'assets/images/notification.png',
                                        width: 20.w,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 15),
                        width: double.infinity,
                        height: 120.h,
                        decoration: BoxDecoration(
                          color: Pallete.infoColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Safe Children',
                              style: GoogleFonts.archivo(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '2 children',
                                  style: GoogleFonts.archivo(
                                    color: Colors.white,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Chip(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    backgroundColor: Colors.white,
                                    avatar: Image.asset(
                                      'assets/images/add.png',
                                      scale: 2,
                                    ),
                                    label: Text(
                                      'Add Children',
                                      style: GoogleFonts.archivo(
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 31),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      ClickTagWidget(
                        boxColor: const Color(0xFF1EAC59),
                        bgColor: Pallete.fieldColor,
                        title: 'Check In',
                        imagePath: 'assets/images/compass.png',
                        subTitle: 'Check the status of your\nrequest',
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ClickTagWidget(
                        boxColor: const Color(0xFF581572),
                        bgColor: Pallete.pickUpColor,
                        imagePath: 'assets/images/ion_car-outline.png',
                        title: 'Pick Up',
                        subTitle:
                            'Choose who and how you want\nyour kids to be picked',
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ClickTagWidget(
                        boxColor: const Color(0xFFF1B82D),
                        bgColor: Pallete.lightYellow,
                        title: 'Drop',
                        imagePath: 'assets/images/carbon_pedestrian-child.png',
                        subTitle:
                            'Choose who will and how you\nwant to drop your kids',
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ClickTagWidget(
                        boxColor: const Color(0xFFEA2DA2),
                        bgColor: Pallete.verylightpink,
                        imagePath: 'assets/images/carbon_request-quote.png',
                        title: 'Request for Absence',
                        subTitle: 'Request for an Absence for your\nkids',
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Guardians',
                            style: GoogleFonts.archivo(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'See all',
                              style: GoogleFonts.inter(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
