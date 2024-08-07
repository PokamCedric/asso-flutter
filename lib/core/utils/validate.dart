enum ValidateType {
  normal,
  email,
  password,
  phone,
}

class Validator {
  static const String empty = "empty field";
  static const String range = "invalid range";
  static const String email = "invalid email";
  static const String phone = "invalid phone";
  static const String match = "no matching value";

  static String validate({
    required String data,
    ValidateType type = ValidateType.normal,
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

        return '';

      case ValidateType.phone:

        ///More pattern
        const String phonePattern =
            r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$";
        if (!RegExp(phonePattern).hasMatch(data)) {
          return phone;
        }

        return '';

      default:
        return '';
    }
  }

  ///Singleton factory
  static final Validator _instance = Validator._internal();

  factory Validator() {
    return _instance;
  }

  Validator._internal();
}
