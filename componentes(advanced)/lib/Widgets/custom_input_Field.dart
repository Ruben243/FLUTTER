// ignore_for_file: file_names
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField(
      {Key? key,
      this.helperText,
      this.hintText,
      this.labelText,
      this.sufficIcon,
      this.icon,
      this.type,
      this.isPassword = false,
      required this.formProperty,
      required this.formValues})
      : super(key: key);

  final String? helperText;
  final String? hintText;
  final String? labelText;
  final IconData? sufficIcon;
  final IconData? icon;
  final TextInputType? type;
  final bool isPassword;

  final String formProperty;
  final Map<String, String> formValues;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      keyboardType: type,
      obscureText: isPassword,
      autofocus: false,
      initialValue: '',
      onChanged: (value) => formValues[formProperty] = value,
      validator: (value) {
        if (value == null) return 'Este campo requerido';
        return value.length < 3 ? 'Minimo 3 letras' : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        helperText: helperText,
        hintText: hintText,
        labelText: labelText,
        suffixIcon: sufficIcon == null ? null : Icon(sufficIcon),
        icon: icon == null ? null : Icon(icon),
      ),
    );
  }
}
