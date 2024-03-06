import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextFormField extends StatelessWidget {
  bool filled;
  bool readOnly;
  TextInputAction textInputAction;
  TextCapitalization textCapitalization;
  TextEditingController controller;
  String? prefixText;
  String label;
  String? errorText;
  int? minLines;
  int? maxLines;
  List<TextInputFormatter>? inputFormater;
  int? maxLength;
  void Function(String)? onFieldSubmitted;
  String? Function(String?)? validator;
  TextInputType? textInputType;
  Color borderColor;
  CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.minLines,
    this.maxLength,
    this.errorText,
    this.inputFormater,
    this.maxLines,
    this.prefixText,
    this.textInputType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.next,
    this.readOnly = false,
    this.filled = false,
    this.onFieldSubmitted,
    this.borderColor = Colors.grey,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      onChanged: onFieldSubmitted,
      textCapitalization: textCapitalization,
      validator: validator,
      controller: controller,
      cursorColor: Colors.black,
      keyboardType: textInputType,
      minLines: minLines,
      inputFormatters: inputFormater,
      maxLines: maxLines,
      maxLength: maxLength,
      textInputAction: textInputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: Colors.black),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 10),
        floatingLabelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.grey),
        prefixText: prefixText,
        errorMaxLines: 2,
        filled: filled,
        errorText: errorText,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        alignLabelWithHint: true,
        counterText: '',
        labelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.grey),
        labelText: label,
        border: const OutlineInputBorder(),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
