import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.prefixIcon, // เพิ่ม prefixIcon ที่นี่
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator, 
    this.keyboardType, // เพิ่ม keyboardType ที่นี่
  }) : super(
          key: key,
        );

  final Alignment? alignment;
  final double? width;
  final TextEditingController? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon; // เพิ่ม prefixIcon ที่นี่
  final TextInputType? keyboardType; // เพิ่ม keyboardType ที่นี่

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: textFormFieldWidget(context),
          )
        : textFormFieldWidget(context);
  }

  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? TextStyle(
          fontSize: 20,
          fontFamily: 'Hina Mincho',
          fontWeight: FontWeight.w700,
          ),
        prefixIcon: prefixIcon, // เปลี่ยน prefixIcon ที่นี่
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.all(13),
        fillColor: fillColor ?? Colors.white,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
              ),
            ),
      );

  Widget textFormFieldWidget(BuildContext context) => SizedBox(
        width: width ?? double.maxFinite,
        child: TextFormField(
          scrollPadding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          controller: controller,
          focusNode: focusNode,
          onTapOutside: (event) {
            if (focusNode != null) {
              focusNode?.unfocus();
            } else {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          autofocus: autofocus!,
          style: textStyle ?? TextStyle(
            fontSize: 20,
            fontFamily: 'Hina Mincho',
            fontWeight: FontWeight.w700,
            ),
          obscureText: obscureText!,
          textInputAction: textInputAction!,
          keyboardType: keyboardType ?? TextInputType.text, // ใช้ keyboardType ที่ถูกกำหนดหรือ default เป็น TextInputType.text
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
        ),
      );
}
