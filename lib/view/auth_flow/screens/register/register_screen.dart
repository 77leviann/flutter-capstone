import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:greeve/global_widgets/global_button_widget.dart';
import 'package:greeve/global_widgets/global_text_field_widget.dart';
import 'package:greeve/utils/constants/colors_constant.dart';
import 'package:greeve/utils/constants/icons_constant.dart';
import 'package:greeve/utils/constants/images_constant.dart';
import 'package:greeve/utils/constants/routes_constant.dart';
import 'package:greeve/utils/constants/text_styles_constant.dart';
import 'package:greeve/view/auth_flow/screens/register/register_success_screen.dart';

part '../../widgets/register_form_name_widget.dart';
part '../../widgets/register_form_email_widget.dart';
part '../../widgets/register_form_password_widget.dart';
part '../../widgets/register_form_password_confirmation_widget.dart';
part '../../widgets/register_button_widget.dart';
part '../../../../view_model/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    IconsConstant.arrow,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: SizedBox(
                    height: 65.3,
                    width: 90,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: SvgPicture.asset(
                        ImagesConstant.logoPotrait,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Daftar',
                  style: TextStylesConstant.nunitoHeading4,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Daftar ke akun Anda sekarang',
                  style: TextStylesConstant.nunitoSubtitle,
                ),
                const SizedBox(
                  height: 28,
                ),
                SizedBox(
                  height: 20,
                  child: Text(
                    'Nama Lengkap',
                    style: TextStylesConstant.nunitoCaption.copyWith(
                      color: ColorsConstant.neutral800,
                    ),
                  ),
                ),
                RegisterFormNameWidget(),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 20,
                  child: Text(
                    'Email',
                    style: TextStylesConstant.nunitoCaption.copyWith(
                      color: ColorsConstant.neutral800,
                    ),
                  ),
                ),
                RegisterFormEmailWidget(),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 20,
                  child: Text(
                    'Kata Sandi',
                    style: TextStylesConstant.nunitoCaption.copyWith(
                      color: ColorsConstant.neutral800,
                    ),
                  ),
                ),
                RegisterFormPasswordWidget(),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 20,
                  child: Text(
                    'Konfirmasi Kata Sandi',
                    style: TextStylesConstant.nunitoCaption.copyWith(
                      color: ColorsConstant.neutral800,
                    ),
                  ),
                ),
                RegisterFormPasswordConfirmationWidget(),
                const SizedBox(
                  height: 44,
                ),
                RegisterButtonWidget(),
                const SizedBox(
                  height: 14,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah punya akun?',
                        style: TextStylesConstant.nunitoSubtitle,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offAndToNamed(RoutesConstant.login);
                        },
                        child: Text(
                          'Masuk',
                          style: TextStylesConstant.nunitoSubtitle,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
