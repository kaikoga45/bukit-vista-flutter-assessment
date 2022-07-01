import 'package:flutter/material.dart';

class ReusableBackButton extends StatelessWidget {
  const ReusableBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
      ),
    );
  }
}
