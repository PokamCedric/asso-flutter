import 'package:african_windows/core/constants/defaults.dart';
import 'package:african_windows/core/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:african_windows/core/widgets/layout_input_feld.dart';
import 'package:flutter_svg/svg.dart';

class TextInputField extends StatelessWidget {
  final String label;
  final ValueChanged<String?> onChanged;

  const TextInputField({
    super.key,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return InputFieldLayout(
      label: label,
      child: TextFormField(
                  style: Theme.of(context).textTheme.labelLarge,
                  decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                          left: AppDefaults.padding,
                          right: AppDefaults.padding / 2),
                      child: SvgPicture.asset(Images.searchLight),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    border: AppDefaults.outlineInputBorder,
                    focusedBorder: AppDefaults.focusedOutlineInputBorder,
                  ),
                ),
    );
  }
}
