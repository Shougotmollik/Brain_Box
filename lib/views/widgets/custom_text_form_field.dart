import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.showToggle = false,
    required this.textEditingController,
    this.validator,
  });
  final String hintText;
  final IconData prefixIcon;
  final bool showToggle;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
        obscureText: widget.showToggle ? _obscureText : !_obscureText,
        controller: widget.textEditingController,
        validator: widget.validator,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black54,
          letterSpacing: 0.5,
          height: 1.2,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
            prefixIcon: Icon(
              widget.prefixIcon,
              color: Colors.grey.shade500,
              size: 28,
            ),
            suffixIcon: widget.showToggle
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey.shade500,
                      size: 28,
                    ))
                : null,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            hintStyle: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w400,
              wordSpacing: 2,
              letterSpacing: 1.2,
            ),
            hintText: widget.hintText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            )),
        cursorColor: Colors.black87,
        cursorWidth: 1.5,
      ),
    );
  }
}
