import 'package:e_commerce/screens/home_screen/Tcircular_container.dart';
import 'package:e_commerce/services/common_function.dart';
import 'package:e_commerce/services/looger.dart';
import 'package:e_commerce/theme_widgets/textthem.dart';
import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip(
      {super.key,
      required this.text,
      required this.selected,
      this.onSelectItem});
  final String text;
  final bool selected;
  final void Function(bool)? onSelectItem;
  @override
  Widget build(BuildContext context) {
    final isColor = CommonFunction.getColorFromString(text) != null;
    Logger.log("Color is", text);
    return ChoiceChip(
      label: isColor
          ? SizedBox()
          : Text(
              text,
              style: TTextThem.TTextThemeOnModeBase(context).bodyLarge,
            ),
      selected: selected,
      onSelected: onSelectItem,
      labelStyle: TextStyle(color: selected ? Colors.white : null),
      avatar: isColor
          ? TcircularContainer(
              height: 50,
              width: 50,
              backgroundColor: CommonFunction.getColorFromString(text)!,
            )
          : null,

      shape: isColor ? CircleBorder() : null,

      backgroundColor:
          isColor ? CommonFunction.getColorFromString(text)! : null,
      padding: isColor ? EdgeInsets.all(0) : null,
      // selectedColor: Colors.green,
      labelPadding: isColor ? EdgeInsets.all(0) : null,
    );
  }
}
