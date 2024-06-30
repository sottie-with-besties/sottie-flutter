import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sottie_flutter/core/constant/custom_colors.dart';

class LocalTextField extends StatelessWidget {
  const LocalTextField({
    super.key,
    required this.hint,
    required this.focusNode,
  });

  final String hint;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextFormField(
        focusNode: focusNode,
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
          prefixIcon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
