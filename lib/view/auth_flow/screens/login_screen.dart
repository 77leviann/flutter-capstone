import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_button_widget.dart';
import 'package:greeve/global_widgets/global_text_field_widget.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view_model/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 56, bottom: 40),
                child:
                    Center(child: SvgPicture.asset(ImagesConstant.logoPotrait)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Masuk',
                      style: TextStylesConstant.nunitoHeading4,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Masuk ke akun Anda sekarang',
                      style: TextStylesConstant.nunitoSubtitle,
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      height: 20,
                      child: Text(
                        'Email',
                        style: TextStylesConstant.nunitoCaption.copyWith(
                          color: ColorsConstant.neutral800,
                        ),
                      ),
                    ),
                    Obx(() => GlobalTextFieldWidget(
                          focusNode: controller.emailFocusNode,
                          controller: controller.emailController,
                          errorText: controller.emailErrorText.value,
                          hintText: 'Masukkan Email Anda',
                          prefixIcon: IconsConstant.message,
                          showSuffixIcon: false,
                          onChanged: (value) =>
                              controller.validateEmail(value),
                        )),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 20,
                      child: Text(
                        'Kata Sandi',
                        style: TextStylesConstant.nunitoCaption.copyWith(
                          color: ColorsConstant.neutral800,
                        ),
                      ),
                    ),
                    Obx(() => GlobalTextFieldWidget(
                          focusNode: controller.passwordFocusNode,
                          controller: controller.passwordController,
                          errorText: controller.passwordErrorText.value,
                          hintText: 'Masukkan Kata Sandi Anda',
                          prefixIcon: IconsConstant.lock,
                          showSuffixIcon: true,
                          onChanged: (value) =>
                              controller.validatePassword(value),
                          obscureText: controller.obscureText.value,
                        )),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Obx(() => Checkbox(
                                  value: controller.remindMe.value,
                                  onChanged: (bool? newValue) {
                                    controller.setRemindMe(newValue);
                                  },
                                  checkColor: ColorsConstant.white,
                                  activeColor: ColorsConstant.primary500,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  side: BorderSide(
                                    color: ColorsConstant.primary500,
                                    width: 2,
                                  ),
                                )),
                            Text(
                              'Ingatkan Saya',
                              style: TextStylesConstant.nunitoCaption,
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Lupa Kata Sandi',
                            style:
                                TextStylesConstant.nunitoButtonLarge.copyWith(
                              color: ColorsConstant.primary500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Obx(() => GlobalButtonWidget(
                          text: 'Masuk',
                          isFormValid: controller.isFormValid.value,
                          onTap: () {
                            Get.defaultDialog(
                              title: 'Gagal Masuk!',
                              titleStyle:
                                  TextStylesConstant.nunitoHeading3.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 24),
                              content: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 24,
                                  left: 24,
                                  right: 24,
                                ),
                                child: Text(
                                  "Email atau kata sandi yang Anda masukkan salah. Silakan periksa kembali informasi login Anda dan coba lagi.",
                                  textAlign: TextAlign.center,
                                  style: TextStylesConstant.nunitoSubtitle
                                      .copyWith(
                                    color: ColorsConstant.neutral600,
                                  ),
                                ),
                              ),
                              confirm: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  width: 250,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorsConstant.primary500,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Masuk Kembali',
                                      style: TextStylesConstant
                                          .nunitoButtonLarge
                                          .copyWith(
                                              color:
                                                  ColorsConstant.primary500),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )),
                    SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Belum Punya Akun?',
                            style: TextStylesConstant.nunitoSubtitle,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Daftar',
                            style: TextStylesConstant.nunitoSubtitle.copyWith(
                              color: ColorsConstant.primary500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
