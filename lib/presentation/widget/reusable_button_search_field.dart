import 'package:flutter/material.dart';

class ReusableButtonSearchField extends StatelessWidget {
  const ReusableButtonSearchField({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFE6BA56),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.filter_list_rounded,
        ),
      ),
    );
  }
}
