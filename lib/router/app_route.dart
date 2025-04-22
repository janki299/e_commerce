import 'package:e_commerce/router/router.dart';
import 'package:e_commerce/screens/address_screen/address_screen.dart';
import 'package:e_commerce/screens/forgotPassword_screen/forgot_password_screen.dart';
import 'package:e_commerce/screens/into_screen/intro_sceen.dart';
import 'package:e_commerce/screens/order_screen/order_screen.dart';
import 'package:e_commerce/screens/product_detail_screen/product_review_screen/product_review_screen.dart';
import 'package:e_commerce/screens/settings_screen/profile_detail_screen.dart';
import 'package:e_commerce/screens/wish_list_screen/wishListScreen.dart';
import 'package:get/get.dart';

import '../screens/cart_screen/cart_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/login_screen/login_screen.dart';
import '../screens/settings_screen/settings_screen.dart';
import '../screens/signup_screen/signup_screen.dart';
import '../screens/signup_screen/verify_email_screen.dart';
import '../screens/store_screen/store_screen.dart';
// Ensure this file is imported with TRoutes definitions
// Import your screen files accordingly

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => const Wishlistscreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(
        name: TRoutes.productReviews, page: () => const ProductReviewScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const HomeScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(
        name: TRoutes.userProfile, page: () => const TProfileDetailScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const AddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: TRoutes.onBoarding, page: () => const IntroSceen()),
    // Add more GetPage entries as needed
  ];
}
