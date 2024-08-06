import 'package:african_windows/core/pages/layouts/card_layout.dart';
import 'package:african_windows/core/widgets/text_input_field.dart';
import 'package:flutter/material.dart';

class EditBody extends StatelessWidget {
  final TextEditingController? textFirstNameController;
  final TextEditingController? textLastNameController;
  final TextEditingController? textEmailController;
  final TextEditingController? textPhoneController;
  final TextEditingController? textAddressController;
  final FocusNode? focusFirstName;
  final FocusNode? focusLastName;
  final FocusNode? focusEmail;
  final FocusNode? focusPhone;
  final FocusNode? focusAdress;

  const EditBody({
    super.key,
    this.textFirstNameController,
    this.textLastNameController,
    this.textEmailController,
    this.textPhoneController,
    this.textAddressController,
    this.focusFirstName,
    this.focusLastName,
    this.focusEmail,
    this.focusPhone,
    this.focusAdress,
    });

  @override
  Widget build(BuildContext context) {
    return CardLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            TextInputField(
              label: 'First Names',
              hintText: 'Please enter the first names',
              focusNode: focusFirstName,
              textController: textFirstNameController,
            ),
            TextInputField(
              label: 'Last Names',
              hintText: 'Please enter the last names',
              focusNode: focusLastName,
              textController: textLastNameController,
            ),
            TextInputField(
              label: 'Email Address',
              hintText: 'Email Address',
              focusNode: focusEmail,
              textController: textEmailController,
            ),
            TextInputField(
              label: 'Phone',
              hintText: 'Phone',
              focusNode: focusPhone,
              textController: textPhoneController,
            ),
            TextInputField(
              label: 'Address',
              hintText: 'Address',
              focusNode: focusAdress,
              textController: textAddressController,
            ),
        ],
      ),
    );
  }
}
