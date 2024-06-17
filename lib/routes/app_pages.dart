import 'package:get/get.dart';
import 'package:greeve/routes/app_routes.dart';
import 'package:greeve/view/cart/screens/cart_screen.dart';
import 'package:greeve/view/forgot_password/screens/confirmation_screen.dart';
import 'package:greeve/view/forgot_password/screens/forgot_password_screen.dart';
import 'package:greeve/view/forgot_password/screens/new_pass_screen.dart';
import 'package:greeve/view/forgot_password/screens/otp_screen.dart';
import 'package:greeve/view/common/bottom_navigation_screen.dart';
import 'package:greeve/view/greeve_coin/screen/all_voucher_screen.dart';
import 'package:greeve/view/greeve_coin/screen/history_screen.dart';
import 'package:greeve/view/greeve_coin/screen/how_to_get_coin_screen.dart';
import 'package:greeve/view/greeve_coin/screen/greeve_coin_screen.dart';
import 'package:greeve/view/login/screens/loading_screen.dart';
import 'package:greeve/view/login/screens/login_screen.dart';
import 'package:greeve/view/onboarding/screens/on_boarding_screen.dart';
import 'package:greeve/view/product/screens/all_product_screen.dart';
import 'package:greeve/view/product/screens/detail_product_screen.dart';
import 'package:greeve/view/product/screens/product_screen.dart';
import 'package:greeve/view/register/register_success_screen.dart';
import 'package:greeve/view/register/screens/register_screen.dart';
import 'package:greeve/view/common/splash_screen.dart';
import 'package:greeve/view/search_product/screen/search_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splashApp,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPassScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => const OtpScreen(),
    ),
    GetPage(
      name: AppRoutes.confirmPassword,
      page: () => const ConfirmPassScreen(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: AppRoutes.registerSuccess,
      page: () => const RegisterSuccessScreen(),
    ),
    GetPage(
      name: AppRoutes.newPassword,
      page: () => const NewPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.loading,
      page: () => const LoadingScreen(),
    ),
    GetPage(
      name: AppRoutes.bottomNavigation,
      page: () => const BottomNavScreen(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnBoardingScreen(),
    ),
    GetPage(
      name: AppRoutes.product,
      page: () => const ProductScreen(),
    ),
    GetPage(
      name: AppRoutes.allProduct,
      page: () => const AllProductScreen(),
    ),
    GetPage(
      name: AppRoutes.detailProduct,
      page: () => const DetailProductScreen(),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => const CartScreen(),
    ),
    GetPage(
      name: AppRoutes.searchProduct,
      page: () => const SearchScreen(),
    ),
    GetPage(
      name: AppRoutes.greeveCoin,
      page: () => const GreeveScreen(),
    ),
    GetPage(
      name: AppRoutes.getCoin,
      page: () => const GetCoinScreen(),
    ),
     GetPage(
      name: AppRoutes.allVoucher,
      page: () => const AllVoucherScreen(),
    ),
    GetPage(
      name: AppRoutes.historyCoin,
      page: () => const HistoryCoinScreen(),
    ),
  ];
}
