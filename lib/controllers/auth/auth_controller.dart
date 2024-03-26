import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsafeclass/clients/api_client.dart';
import 'package:nsafeclass/constants/constants.dart';
import 'package:nsafeclass/views/auth/login_screen.dart';
import 'package:nsafeclass/views/home/home_page.dart';

class AuthController extends GetxController {
  bool isLoading = false;
  RxString nemail = ''.obs;
  final APIClient _apiClient = APIClient();

  void load() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      isLoading = !isLoading;
      refresh();
    });
  }

  Future loginUser({
    required String email,
    required String password,
  }) async {
    try {
      load();
      nemail.value = email;
      final response = await _apiClient.loginUser(
        email: email,
        password: password,
      );
      if (response.statusCode == 200) {
        Get.snackbar(
          'success',
          'Welcome',
          colorText: Colors.white,
          backgroundColor: Colors.green,
        );
        box.write(
          'token',
          json.decode(response.body)['access_token'],
        );
        Get.off(
          () => const HomePage(),
        );
      } else if (json.decode(response.body)['error_description'] != '') {
        Get.snackbar(
          'Error',
          json.decode(response.body)['error_description'],
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (e) {
      print('Error occurred: $e');
    } finally {
      load();
    }
  }

  Future registerUser({
    required String fullname,
    required String email,
    required String password,
  }) async {
    try {
      load();
      final response = await _apiClient.registerUser(
        fullname: fullname,
        email: email,
        password: password,
      );
      if (response.statusCode == 200) {
        Get.snackbar(
          'success',
          'Welcome',
          colorText: Colors.white,
          backgroundColor: Colors.green,
        );
        Get.off(
          () => const LoginScreen(),
        );
      } else if (json.decode(response.body)['description'] != null) {
        Get.snackbar(
          'Error',
          'Email has been taken',
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      } else {
        Get.snackbar(
          'Error',
          json.decode(response.body)['error'],
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (e) {
      print('Error occurred: $e');
    } finally {
      load();
    }
  }
}
