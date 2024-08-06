import 'package:african_windows/core/widgets/text_input_field.dart';
import 'package:flutter/material.dart';

class EditBody extends StatelessWidget {

  const EditBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          TextInputField(
            label: 'First Name',
            onChanged: (value) {},
          ),
          TextInputField(
            label: 'Last Name',
            onChanged: (value) {},
          ),
      ],
    );
  }
}
