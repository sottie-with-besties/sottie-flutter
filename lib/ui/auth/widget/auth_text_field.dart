import 'package:flutter/material.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    this.obsecure = false,
    this.validator,
    this.hint,
    this.keyboardType,
  });

  final bool obsecure;
  final String? Function(String?)? validator;
  final String? hint;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: mainWhiteSilverColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 3,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 3,
            ),
          ),
          hintText: hint,
          errorStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        keyboardType: keyboardType,
        obscureText: obsecure,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
