import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/button/rrj_primary_button.dart';
import 'package:reservasi_rawat_jalan_mobile/core/components/input_field/rrj_input_textfield.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';
import 'package:reservasi_rawat_jalan_mobile/core/routes/router_name.dart';
import 'package:reservasi_rawat_jalan_mobile/core/utils/validation_utils.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({
    super.key,
    this.nik,
    required this.email,
  });

  final String email;
  final String? nik;

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  @override
  void dispose() {
    _nikController.dispose();
    _fullnameController.dispose();
    _phoneController.dispose();
    _genderController.dispose();
    _addressController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RRJInputTextField(
                    label: LocaleKeys.completeProfile_email.tr(),
                    isRequired: true,
                    readOnly: true,
                    isEnabled: false,
                    hintText: widget.email,
                    focusedBorderColor: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 16),
                  RRJInputTextField(
                    controller: _nikController,
                    label: LocaleKeys.completeProfile_nationalIdentityNumber.tr(),
                    isRequired: true,
                    readOnly: widget.nik != null,
                    isEnabled: widget.nik == null,
                    hintText: _nikController.text.isEmpty
                        ? widget.nik
                        : _nikController.text,
                    focusedBorderColor: Theme.of(context).colorScheme.primary,
                    validator: ValidationUtils.validateNik,
                  ),
                  const SizedBox(height: 16),
                  RRJInputTextField(
                    controller: _fullnameController,
                    label: LocaleKeys.completeProfile_fullname.tr(),
                    isRequired: true,
                    focusedBorderColor: Theme.of(context).colorScheme.primary,
                    validator: ValidationUtils.validateFullName,
                  ),
                  const SizedBox(height: 16),
                  RRJInputTextField(
                    controller: _phoneController,
                    label: LocaleKeys.completeProfile_phoneNumber.tr(),
                    isRequired: true,
                    focusedBorderColor: Theme.of(context).colorScheme.primary,
                    validator: ValidationUtils.validatePhone,
                  ),
                  const SizedBox(height: 16),
                  RRJInputTextField(
                    controller: _addressController,
                    label: LocaleKeys.completeProfile_address.tr(),
                    isRequired: true,
                    focusedBorderColor: Theme.of(context).colorScheme.primary,
                    validator: ValidationUtils.validateAddress,
                  ),
                  const SizedBox(height: 16),
                  RRJInputTextField(
                    controller: _genderController,
                    label: LocaleKeys.completeProfile_gender.tr(),
                    isRequired: true,
                    focusedBorderColor: Theme.of(context).colorScheme.primary,
                    validator: ValidationUtils.validateGender,
                  ),
                  const SizedBox(height: 16),
                  RRJInputTextField(
                    controller: _birthdayController,
                    label: LocaleKeys.detailProfileScreen_dateOfBirth.tr(),
                    isRequired: true,
                    focusedBorderColor: Theme.of(context).colorScheme.primary,
                    validator: ValidationUtils.validateBirthday,
                  ),
                  const SizedBox(height: 16),
                  RRJPrimaryButton(
                    width: MediaQuery.of(context).size.width,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.goNamed(RouteName.home);
                      }
                    },
                    child: Text(
                      LocaleKeys.completeProfile_completeProfile.tr(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
