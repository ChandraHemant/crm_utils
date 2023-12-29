/// Type definition for custom bs form validator
typedef CRMSelectValidatorValue<T> = String? Function(T? value);

class CRMSelectValidator {
  const CRMSelectValidator({
    required this.validator,
  });

  /// validator function to check value is valid or not
  final CRMSelectValidatorValue validator;
}

class CRMSelectValidators {
  /// define required validation
  static CRMSelectValidator get required => CRMSelectValidator(
    validator: (value) {
      String valueValidate = value.toString().trim();
      if (valueValidate.isEmpty || value == null) return "Select field is required";

      return null;
    },
  );
}