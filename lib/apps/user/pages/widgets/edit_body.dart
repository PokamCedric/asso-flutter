import 'package:african_windows/apps/user/bloc/user_bloc.dart';
import 'package:african_windows/core/pages/layouts/card_layout.dart';
import 'package:african_windows/core/utils/other.dart';
import 'package:african_windows/core/utils/validate.dart';
import 'package:african_windows/core/widgets/app_button.dart';
import 'package:african_windows/core/widgets/app_text_input.dart';
import 'package:african_windows/core_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:african_windows/apps/user/models/model_user.dart';

class EditBody extends StatefulWidget {
  const EditBody({super.key});

  @override
  State<EditBody> createState() => _EditBodyState();
}

class _EditBodyState extends State<EditBody> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

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
      final newUser = UserModel(
        id: DateTime.now().millisecondsSinceEpoch, // generate a unique id
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        role: UserRole.normalUser, // default role
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        address: _addressController.text.trim(),
      );
      CoreBloc.userListingsBloc.add(AddUserEvent(newUser));
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
    return BlocConsumer<UserListingsBloc, UserListingsState>(
      listener: (context, state) {
        if (state.status == UserListingsStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User added successfully!')),
          );
          _clearForm();
        } else if (state.status == UserListingsStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? 'An error occurred')),
          );
        }
      },
      builder: (context, state) {
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
                onSubmitted: _getFocus(context, focusFirstName, focusLastName),
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
                onSubmitted: _getFocus(context, focusLastName, focusEmail),
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
                onSubmitted: _getFocus(context, focusEmail, focusPhone),
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
                onSubmitted: _getFocus(context, focusPhone, focusAdress),
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
                    onPressed: state.status == UserListingsStatus.loading ? null : _update,
                    text: state.status == UserListingsStatus.loading ? 'Loading...' : 'Submit',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _clearForm() {
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _addressController.clear();
    setState(() {
      _firstName = '';
      _lastName = '';
      _email = '';
      _phone = '';
      _address = '';
    });
  }

  Function(String?)? _getFocus(BuildContext context,
      FocusNode? focusNodeStart, FocusNode? focusNodeEnd) {
    return focusNodeStart != null && focusNodeEnd != null ? (value) {
      Other.fieldFocusChange(
        context,
        focusNodeStart,
        focusNodeEnd,
      );
    } : null;
  }
}
