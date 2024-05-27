import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeve/models/api_responses/login_response.dart';
import 'package:greeve/services/api/api_service.dart';

class LoginController extends GetxController {
  final ApiService _apiService = ApiService();

  Rx<String?> emailErrorText = Rx<String?>(null);
  Rx<String?> passwordErrorText = Rx<String?>(null);
  Rx<bool> isFormValid = Rx<bool>(false);
  Rx<bool?> remindMe = Rx<bool?>(false);
  Rx<bool> obscureText = true.obs;
  Rx<bool> isLoading = Rx<bool>(false);
  Rx<LoginResponse?> loginData = Rx<LoginResponse?>(null);
  Rx<String> errorMessage = Rx<String>('');

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  FocusNode get emailFocusNode => _emailFocusNode;
  FocusNode get passwordFocusNode => _passwordFocusNode;

  @override
  void onInit() {
    _emailFocusNode.addListener(() => update());
    _passwordFocusNode.addListener(() => update());
    _emailController.addListener(validateForm);
    _passwordController.addListener(validateForm);
    super.onInit();
  }

  void login() async {
    isLoading.value = true;
    try {
      final result = await _apiService.login(_emailController.text, _passwordController.text);
      loginData.value = result;
      errorMessage.value = '';
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void validateEmail(String value) {
    final RegExp emailRegex = RegExp(
        r"""^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$""");
    if (!emailRegex.hasMatch(value)) {
      emailErrorText.value = 'Email tidak valid! contoh: johndoe123@gmail.com';
    } else {
      emailErrorText.value = null;
    }
    validateForm();
  }

  void validatePassword(String value) {
    if (value.length < 8) {
      passwordErrorText.value = 'Kata sandi minimal 8 karakter';
    } else {
      passwordErrorText.value = null;
    }
    validateForm();
  }

  void validateForm() {
    if (emailErrorText.value != null ||
        passwordErrorText.value != null ||
        _emailController.text == '' ||
        _passwordController.text == '') {
      isFormValid.value = false;
    } else {
      isFormValid.value = true;
    }
  }

  void setRemindMe(bool? newValue) {
    remindMe.value = newValue;
  }

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  void clearForm() {
    _emailController.clear();
    _passwordController.clear();
    emailErrorText.value = null;
    passwordErrorText.value = null;
    isFormValid.value = false;
  }
}
