import 'package:flutter/material.dart';

class ReusableSearchField extends StatelessWidget {
  const ReusableSearchField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black54,
        ),
        hintText: "Search your guess name",
        fillColor: Colors.white,
      ),
      onChanged: onChanged,
    );
  }
}
