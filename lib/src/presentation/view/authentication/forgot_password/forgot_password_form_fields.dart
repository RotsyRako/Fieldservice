import 'package:reactive_forms/reactive_forms.dart';

enum ForgotPasswordFormFields {
  email,
}

FormGroup forgotPasswordForm() {
  return FormGroup({
    ForgotPasswordFormFields.email.name: FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
  });
}
