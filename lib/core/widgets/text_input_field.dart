import 'package:african_windows/core/constants/defaults.dart';
import 'package:flutter/material.dart';
import 'package:african_windows/core/widgets/layout_input_feld.dart';
import 'package:flutter_svg/svg.dart';

class TextInputField extends StatelessWidget {
  final String label;
  final String image;
  final TextEditingController? textController;
  final FocusNode? focusNode;
  final String? hintText;
  final ValueChanged<String?>? onChanged;
  final Function(String?)? onFieldSubmitted;

  const TextInputField({
    super.key,
    required this.label,
    this.textController,
    this.focusNode,
    this.hintText,
    this.onChanged,
    this.onFieldSubmitted,
    this.image = '',
  });

  @override
  Widget build(BuildContext context) {

    return InputFieldLayout(
      label: label,
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        controller: textController,
        focusNode: focusNode,
                  style: Theme.of(context).textTheme.labelLarge,
                  decoration: InputDecoration(
                    hintText: hintText,
                    prefixIcon: image.isEmpty ? null : Padding(
                      padding: const EdgeInsets.only(
                          left: AppDefaults.padding,
                          right: AppDefaults.padding / 2),
                      child: SvgPicture.asset(image),
                    ),
                    filled: true,
                    border: AppDefaults.outlineInputBorder,
                    focusedBorder: AppDefaults.focusedOutlineInputBorder,
                  ),
                ),
    );
  }
}
