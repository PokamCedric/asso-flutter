import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:african_windows/apps/membership/members/models/model_user.dart';
import 'package:african_windows/apps/membership/members/bloc/user_bloc.dart';
import 'package:african_windows/core/pages/layouts/card_layout.dart';
import 'package:african_windows/core/services/navigation_service.dart';
import 'package:african_windows/core/utils/other.dart';
import 'package:african_windows/core/utils/validate.dart';
import 'package:african_windows/core/widgets/app_button.dart';
import 'package:african_windows/core/widgets/app_text_input.dart';
import 'package:african_windows/core_bloc.dart';

class UserEditBody extends StatefulWidget {
  final UserModel user;
  const UserEditBody({super.key, required this.user});

  @override
  State<UserEditBody> createState() => _UserEditBodyState();
}

class _UserEditBodyState extends State<UserEditBody> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;

  final FocusNode focusFirstName = FocusNode();
  final FocusNode focusLastName = FocusNode();
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPhone = FocusNode();
  final FocusNode focusAdress = FocusNode();

  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _phone = '';
  String _address = '';

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.user.firstName);
    _lastNameController = TextEditingController(text: widget.user.lastName);
    _emailController = TextEditingController(text: widget.user.email);
    _phoneController = TextEditingController(text: widget.user.phone);
    _addressController = TextEditingController(text: widget.user.address);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    focusFirstName.dispose();
    focusLastName.dispose();
    focusEmail.dispose();
    focusPhone.dispose();
    focusAdress.dispose();
    super.dispose();
  }

  void _update() {
    if (_isValid()) {
      final updatedUser = widget.user.copyWith(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        address: _addressController.text.trim(),
      );
      CoreBloc.usersBloc.add(UpdateUserEvent(updatedUser));
    }
  }

  bool _isValid() {
    setState(() {
      _firstName = Validator.validate(
        data: _firstNameController.text.trim(),
      );
      _lastName = Validator.validate(
        data: _lastNameController.text.trim(),
      );
      _email = Validator.validate(
        data: _emailController.text.trim(),
        type: ValidateType.email,
      );
      _phone = Validator.validate(
          data: _phoneController.text.trim(), type: ValidateType.phone);
      _address = Validator.validate(
        data: _addressController.text.trim(),
      );
    });

    return _firstName.isEmpty &&
        _lastName.isEmpty &&
        _email.isEmpty &&
        _phone.isEmpty &&
        _address.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<NavigationController>(context);

    return BlocConsumer<UsersBloc, UsersState>(
      listener: (context, state) async {
        if (UsersStatus.updateSuccess == state.status) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User updated successfully!')),
          );
          await Future.delayed(const Duration(seconds: 1));
          nav.goBack();
        } else if (UsersStatus.updateError == state.status) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage??'Error')),
          );
        }
      },
      builder: (context, state) {
        bool isLoading = (UsersStatus.updating == state.status);

        return CardLayout(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextInput(
                label: 'First Names',
                hintText: 'Please enter the first names',
                errorText: _firstName,
                focusNode: focusFirstName,
                controller: _firstNameController,
                onSubmitted: Other.getFocus(context, focusFirstName, focusLastName),
                icon: const Icon(Icons.clear),
                onTapIcon: () async {
                  await Future.delayed(const Duration(milliseconds: 100));
                  _firstNameController.clear();
                },
              ),
              AppTextInput(
                label: 'Last Names',
                hintText: 'Please enter the last names',
                errorText: _lastName,
                focusNode: focusLastName,
                controller: _lastNameController,
                onSubmitted: Other.getFocus(context, focusLastName, focusEmail),
                icon: const Icon(Icons.clear),
                onTapIcon: () async {
                  await Future.delayed(const Duration(milliseconds: 100));
                  _lastNameController.clear();
                },
              ),
              AppTextInput(
                label: 'Email Address',
                hintText: 'Email Address',
                errorText: _email,
                focusNode: focusEmail,
                controller: _emailController,
                onSubmitted: Other.getFocus(context, focusEmail, focusPhone),
                icon: const Icon(Icons.clear),
                onTapIcon: () async {
                  await Future.delayed(const Duration(milliseconds: 100));
                  _emailController.clear();
                },
              ),
              AppTextInput(
                label: 'Phone',
                hintText: 'Phone',
                errorText: _phone,
                focusNode: focusPhone,
                controller: _phoneController,
                onSubmitted: Other.getFocus(context, focusPhone, focusAdress),
                icon: const Icon(Icons.clear),
                onTapIcon: () async {
                  await Future.delayed(const Duration(milliseconds: 100));
                  _phoneController.clear();
                },
              ),
              AppTextInput(
                label: 'Address',
                hintText: 'Address',
                errorText: _address,
                focusNode: focusAdress,
                controller: _addressController,
                icon: const Icon(Icons.clear),
                onTapIcon: () async {
                  await Future.delayed(const Duration(milliseconds: 100));
                  _addressController.clear();
                },
              ),
              Center(
                child: SizedBox(
                  width: 200,
                  child: AppButton(
                    onPressed: isLoading ? null : _update,
                    text: isLoading ? 'Loading...' : 'Submit',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
