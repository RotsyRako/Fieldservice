import 'package:reactive_forms/reactive_forms.dart';

enum SingInFormFields {
  email,
  password,
}

FormGroup signInForm() {
  return FormGroup({
    SingInFormFields.email.name: FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
    SingInFormFields.password.name: FormControl<String>(
      validators: [Validators.required],
    ),
  });
}
