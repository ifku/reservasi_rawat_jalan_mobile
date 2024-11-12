import 'package:easy_localization/easy_localization.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/locale_keys.g.dart';

class ValidationUtils {
  static String? validateNik(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validation_invalidNIK.tr();
    }
    if (value.length != 16 || int.tryParse(value) == null) {
      return LocaleKeys.validation_invalidNIKFormat.tr();
    }
    return null;
  }

  static String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validation_invalidFullname.tr();
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validation_invalidPhone.tr();
    }
    if (value.length < 10 || int.tryParse(value) == null) {
      return LocaleKeys.validation_invalidPhoneFormat.tr();
    }
    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validation_invalidAddress.tr();
    }
    return null;
  }

  static String? validateGender(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validation_invalidGender.tr();
    }
    if (value.toLowerCase() != 'MALE' && value.toLowerCase() != 'FEMALE') {
      return LocaleKeys.validation_invalidGenderFormat.tr();
    }
    return null;
  }

  static String? validateBirthday(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validation_invalidDateOfBirth.tr();
    }
    try {
      final date = DateTime.parse(value);
      if (date.isAfter(DateTime.now())) {
        return LocaleKeys.validation_invalidDateOfBirthFuture.tr();
      }
    } catch (_) {
      return LocaleKeys.validation_invalidDateOfBirthFormat.tr();
    }
    return null;
  }
}
