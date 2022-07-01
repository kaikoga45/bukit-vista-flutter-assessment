import 'package:flutter/material.dart';

class ReusableNavigationBar extends StatelessWidget {
  const ReusableNavigationBar({
    Key? key,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      onTap: onTap,
      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_rounded), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications_rounded), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: ''),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}
