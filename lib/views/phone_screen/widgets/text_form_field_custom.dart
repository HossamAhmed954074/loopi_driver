import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom({
    required this.labelTitle,
    required this.onChanged,
    super.key,
    required this.phoneController,
  });
  final String labelTitle;
  final Function(String)? onChanged;
  final TextEditingController phoneController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: TextFormField(
        controller: phoneController,
        keyboardType: TextInputType.phone,
        cursorColor: Colors.black,
        validator: (value) {
          if (value!.isEmpty) {
            return 'أدخل رقم الهاتف';
          }else if(value.length < 11){
            return 'رقم الهاتف غير صحيح';
          }
          return null;
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(16),
          ),
          label: Text(labelTitle),
        ),
      ),
    );
  }
}
