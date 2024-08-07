import 'package:african_windows/core/pages/layouts/card_layout.dart';
import 'package:african_windows/core/utils/other.dart';
import 'package:african_windows/core/widgets/app_text_input.dart';
import 'package:flutter/material.dart';

class EditBody extends StatelessWidget {
  final TextEditingController? textFirstNameController;
  final TextEditingController? textLastNameController;
  final TextEditingController? textEmailController;
  final TextEditingController? textPhoneController;
  final TextEditingController? textAddressController;
  final FocusNode focusFirstName = FocusNode();
  final FocusNode focusLastName = FocusNode();
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPhone = FocusNode();
  final FocusNode focusAdress = FocusNode();

  EditBody({
    super.key,
    this.textFirstNameController,
    this.textLastNameController,
    this.textEmailController,
    this.textPhoneController,
    this.textAddressController,
    });

  @override
  Widget build(BuildContext context) {
    return CardLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            AppTextInput(
              label: 'First Names',
              hintText: 'Please enter the first names',
              focusNode: focusFirstName,
              controller: textFirstNameController,
              onSubmitted: _getFocus(context, focusFirstName, focusLastName),
              icon: const Icon(Icons.clear),
              onTapIcon: () async {
                await Future.delayed(const Duration(milliseconds: 100));
                  textFirstNameController?.clear();
              },
            ),
            AppTextInput(
              label: 'Last Names',
              hintText: 'Please enter the last names',
              focusNode: focusLastName,
              controller: textLastNameController,
              onSubmitted: _getFocus(context, focusLastName, focusEmail),
              icon: const Icon(Icons.clear),
              onTapIcon: () async {
                await Future.delayed(const Duration(milliseconds: 100));
                  textLastNameController?.clear();
              },
            ),
            AppTextInput(
              label: 'Email Address',
              hintText: 'Email Address',
              focusNode: focusEmail,
              controller: textEmailController,
              onSubmitted: _getFocus(context, focusEmail, focusPhone),
              icon: const Icon(Icons.clear),
              onTapIcon: () async {
                await Future.delayed(const Duration(milliseconds: 100));
                  textEmailController?.clear();
              },
            ),
            AppTextInput(
              label: 'Phone',
              hintText: 'Phone',
              focusNode: focusPhone,
              controller: textPhoneController,
              onSubmitted: _getFocus(context, focusPhone, focusAdress),
              icon: const Icon(Icons.clear),
              onTapIcon: () async {
                await Future.delayed(const Duration(milliseconds: 100));
                  textPhoneController?.clear();
              },
            ),
            AppTextInput(
              label: 'Address',
              hintText: 'Address',
              focusNode: focusAdress,
              controller: textAddressController,
              icon: const Icon(Icons.clear),
              onTapIcon: () async {
                await Future.delayed(const Duration(milliseconds: 100));
                  textAddressController?.clear();
              },
            ),
            Center(
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Submit'),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Function(String?)? _getFocus(BuildContext context,
   FocusNode? focusNodeStart, FocusNode? focusNodeEnd) {
    return focusNodeStart != null && focusNodeEnd != null ? (value)  {
                Other.fieldFocusChange(
                        context,
                        focusNodeStart,
                        focusNodeEnd,
                      );
              }: null;
   }
}
