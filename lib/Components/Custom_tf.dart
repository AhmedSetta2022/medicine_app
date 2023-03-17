import 'package:flutter/material.dart';

class CustomeTextFormField extends StatelessWidget {
  CustomeTextFormField(
      {super.key,
      required this.HintText,
      required this.LabelText,
      required this.SuffixIcon,
      required this.keyboardtype,
      required this.obscuretext,
      this.onchanged});
  final String HintText;
  final String LabelText;
  final Icon SuffixIcon;
  final bool obscuretext;
  final Function(String)? onchanged;
  final TextInputType keyboardtype;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      validator: (value) {
        if (value!.isEmpty) {
          return "This Field Required";
        }
      },
      obscureText: obscuretext,
      keyboardType: keyboardtype,
      decoration: InputDecoration(
          prefixIcon: SuffixIcon,
          hintText: HintText,
          labelText: LabelText,
          contentPadding: EdgeInsets.all(18),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blueGrey)),
          fillColor: Colors.grey[50],
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blueGrey)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey))),
    );
  }
}
