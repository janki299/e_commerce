import 'package:e_commerce/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../theme_widgets/textthem.dart';
import '../home_screen/home_screen.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.onEditTAp,
  });
  final VoidCallback onEditTAp;
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: TVerticalImage(
        height: 50,
        width: 50,
        padding: 0,
        images: "assets/images/searching.jpg",
      ),
      title: Text(
        controller.user.value.fullName,
        style: TTextThem.TTextThemeOnModeBase(context).titleLarge,
      ),
      subtitle: Obx(
        () => Text(controller.user.value.email,
            style: TTextThem.TTextThemeOnModeBase(context)
                .bodySmall!
                .apply(color: Colors.white)),
      ),
      trailing: IconButton(onPressed: onEditTAp, icon: Icon(Icons.edit)),
    );
  }
}
