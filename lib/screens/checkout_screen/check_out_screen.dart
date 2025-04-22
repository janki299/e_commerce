import 'package:e_commerce/common_widgets/custom_texfield.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/screens/checkout_screen/TBillingAmount_section.dart';
import 'package:e_commerce/screens/checkout_screen/TBilling_payment_section.dart';
import 'package:e_commerce/screens/home_screen/Tcircular_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/appbar.dart';
import '../../services/common_function.dart';
import '../../theme_widgets/textthem.dart';
import '../cart_screen/cart_items.dart';
import '../signup_screen/success_screen.dart';
import 'TBillinAddress_section.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CommonFunction.isDarkMode(context);
    return Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            "Order Review",
            style: TTextThem.TTextThemeOnModeBase(context).titleLarge,
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                  image: "assets/images/telling.jpg",
                  statusTitle: "Payment Sucess!",
                  statusText: "Your payment successfully submited",
                  onContinueTap: () => Get.offAll(() => NavigationMenu()),
                )),
            child: Text("CheckOut \$256"),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                TCartItems(
                  showAddRemoveButton: false,
                  isDark: isDark,
                ),
                SizedBox(
                  height: 10,
                ),
                TCouponCode(isDark: isDark),
                SizedBox(
                  height: 10,
                ),
                TRoundedContainer(
                  borderColor: Colors.black,
                  radius: 8,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                  backgroundColor: isDark ? Colors.black : Colors.white10,
                  child: Column(
                    children: [
                      TBillingPaymentSection(),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      TBillingAmountSection(),
                      TBillingAddressSection(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
        backgroundColor: isDark ? Colors.black : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                  child: CustomTextField(
                hintText: "fgfgfg",
              )),
              SizedBox(
                width: 4,
              ),
              ElevatedButton(onPressed: () {}, child: Text("Apply"))
            ],
          ),
        ));
  }
}
