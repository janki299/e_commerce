import 'package:e_commerce/common_widgets/appbar.dart';
import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/custom_texfield.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            "Add Address",
            style: TTextThem.TTextThemeOnModeBase(context).bodyLarge,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              children: [
                CustomTextField(
                  hintText: "Name",
                  prefixIcon: Icons.perm_identity_outlined,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  hintText: "Phone Number",
                  prefixIcon: Icons.perm_identity_outlined,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hintText: "Street",
                        prefixIcon: Icons.streetview,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: CustomTextField(
                        hintText: "Postel Code",
                        prefixIcon: Icons.qr_code,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hintText: "City",
                        prefixIcon: Icons.location_city,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: CustomTextField(
                        hintText: "State",
                        prefixIcon: Icons.countertops_sharp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  hintText: "Country",
                  prefixIcon: Icons.qr_code,
                ),
                SizedBox(
                  height: 22,
                ),
                SizedBox(
                    width: double.infinity,
                    child:
                        ElevatedButton(onPressed: () {}, child: Text("Save")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
