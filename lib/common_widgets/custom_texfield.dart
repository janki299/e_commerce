import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;
  final TextEditingController? controller;
  final String? errorText;
  final Function(String)? onChanged;
  final VoidCallback? onSuffixIconTap;
  final double? width;
  final Function(String?)? validation;
  CustomTextField({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.controller,
    this.errorText,
    this.onChanged,
    this.onSuffixIconTap,
    this.width,
    this.validation,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: widget.width,
          child: TextFormField(
            validator: (value) => widget.validation!(value),
            controller: widget.controller,
            obscureText: widget.isPassword ? !passwordVisible : false,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: isDarkMode ? Colors.grey[900] : Colors.white,
              hintText: widget.hintText,
              prefixIcon: widget.prefixIcon != null
                  ? Icon(widget.prefixIcon,
                      color: isDarkMode ? Colors.white70 : Colors.black54)
                  : null,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: isDarkMode ? Colors.white70 : Colors.black54,
                      ),
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    )
                  : (widget.suffixIcon != null
                      ? IconButton(
                          icon: Icon(widget.suffixIcon,
                              color:
                                  isDarkMode ? Colors.white70 : Colors.black54),
                          onPressed: widget.onSuffixIconTap,
                        )
                      : null),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                    color: isDarkMode ? Colors.white24 : Colors.black26),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                    color: isDarkMode ? Colors.white70 : Colors.black54),
              ),
              errorText: widget.errorText,
            ),
          ),
        ),
        if (widget.errorText != null && widget.errorText!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 5),
            child: Text(
              widget.errorText!,
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
