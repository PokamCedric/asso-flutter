enum ValidateType {
  normal,
  email,
  password,
  phone,
}

class Validator {
  static const String empty = "value_not_empty";
  static const String range = "value_not_valid_range";
  static const String email = "value_not_valid_email";
  static const String phone = "value_not_valid_phone";
  static const String match = "value_not_match";

  static validate({
    required String data,
    required ValidateType type,
    int? min,
    int? max,
    bool allowEmpty = false,
    String? match,
  }) {
    ///Empty
    if (!allowEmpty && data.isEmpty) {
      return empty;
    }

    ///Match
    if (match != null && data != match) {
      return match;
    }

    if (min != null &&
        max != null &&
        (data.length < min || data.length > max)) {
      return '$range ($min-$max)';
    }

    switch (type) {
      case ValidateType.email:

        ///More pattern
        const  String emailPattern =
            r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";
        if (!RegExp(emailPattern).hasMatch(data)) {
          return email;
        }

        return null;

      case ValidateType.phone:

        ///More pattern
        const String phonePattern =
            r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$";
        if (!RegExp(phonePattern).hasMatch(data)) {
          return phone;
        }

        return null;

      default:
        return null;
    }
  }

  ///Singleton factory
  static final Validator _instance = Validator._internal();

  factory Validator() {
    return _instance;
  }

  Validator._internal();
}
