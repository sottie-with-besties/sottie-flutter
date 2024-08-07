import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';

class LocalTextField extends StatelessWidget {
  const LocalTextField({
    super.key,
    this.hint,
    this.focusNode,
    this.onChanged,
    this.onFieldSubmitted,
    this.prefixIcon = true,
    this.suffixIcon,
    this.controller,
    this.inputFormatter,
    this.lines = 1,
    this.maxLength,
    this.keyboardType,
  });

  final String? hint;
  final FocusNode? focusNode;
  final void Function(String?)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final bool prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatter;
  final int? lines;
  final int? maxLength;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextFormField(
        minLines: lines,
        maxLines: lines,
        maxLength: maxLength,
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        inputFormatters: inputFormatter,
        decoration: InputDecoration(
          filled: true,
          fillColor: mainSilverColor,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2.5,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black54),
          prefixIcon: prefixIcon
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.black,
                  ),
                )
              : null,
          suffixIcon: suffixIcon,
        ),
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
