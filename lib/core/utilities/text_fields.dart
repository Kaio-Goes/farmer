import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget modernTextFormField({
  bool password = false,
  IconData? prefixIcon,
  required TextEditingController controller,
  FormFieldValidator<String>? validator,
  required String hint,
  required String label,
  double? width,
  Key? key,
  TextInputType? textInputType,
  bool readOnly = false,
  Function(String)? onChanged,
  List<TextInputFormatter>? inputFormatters,
  Color labelColor = const Color.fromARGB(255, 73, 72, 72),
  Color fillColor = Colors.white,
  Color borderColor = Colors.grey,
  Color focusBorderColor = const Color.fromARGB(255, 195, 231, 178),
  Color errorBorderColor = Colors.red,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(color: labelColor, fontWeight: FontWeight.w500),
      ),
      const SizedBox(height: 10),
      SizedBox(
        width: width,
        child: TextFormField(
          key: key,
          onChanged: onChanged,
          controller: controller,
          validator: validator,
          obscureText: password,
          inputFormatters: inputFormatters,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: textInputType,
          readOnly: readOnly,
          decoration: InputDecoration(
            filled: true,
            fillColor: readOnly
                ? Colors.grey.withAlpha((0.3 * 255).toInt())
                : fillColor,
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: Colors.grey)
                : null,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 12.0,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: borderColor, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: focusBorderColor, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: errorBorderColor, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: errorBorderColor, width: 1.5),
            ),
          ),
        ),
      ),
    ],
  );
}
