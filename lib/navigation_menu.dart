import 'package:e_commerce/screens/home_screen/home_screen.dart';
import 'package:e_commerce/screens/settings_screen/settings_screen.dart';
import 'package:e_commerce/screens/store_screen/store_screen.dart';
import 'package:e_commerce/screens/wish_list_screen/wishListScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIn.value,
          onDestinationSelected: (index) => controller.selectedIn.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.shop), label: "Store"),
            NavigationDestination(
                icon: Icon(Icons.favorite), label: "WishList"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile")
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIn.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIn = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const Wishlistscreen(),
    const SettingsScreen(),
    Container(
      color: Colors.redAccent,
      // child: Text("wishList"),
    ),
    Container(
      color: Colors.greenAccent,
      // child: Text("Profile"),
    ),
    Container(
      color: Colors.purple,
      // child: Text("Profile"),
    ),
  ];
}
