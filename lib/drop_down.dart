import 'package:flutter/material.dart';

import 'package:get/get.dart';


class CustomDropDownField<T> extends StatelessWidget {
  String? Function(T?)? validator;
  final String label;
  final String hintText;
  final T? value;
  final List<DropdownMenuItem<T?>> itemList;
  final Function(T?) onChanged;
  CustomDropDownField({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.itemList,
    required this.label,
    required this.hintText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return DropdownButtonFormField<T?>(
      dropdownColor: Colors.white,
      menuMaxHeight: size.height * .4,
      icon: Padding(
        padding: EdgeInsets.only(right: 10),
        child: Icon(
          Icons.keyboard_arrow_down_outlined,
          size: 15,
          color: Colors.grey,
        ),
      ),
      isDense: true,
      value: value,
      items: itemList,
      validator: validator,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: Colors.black),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,

        hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color:Colors.grey),
        label: Text(label),
        labelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.grey),
        isDense: true,
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        border: const OutlineInputBorder(),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
