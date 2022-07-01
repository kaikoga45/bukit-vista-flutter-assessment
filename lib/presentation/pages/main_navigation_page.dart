import 'package:bukit_vista_flutter_assessment/presentation/pages/blank_page.dart';
import 'package:bukit_vista_flutter_assessment/presentation/pages/home_page.dart';
import 'package:bukit_vista_flutter_assessment/presentation/widget/reusable_navigation_bar.dart';
import 'package:flutter/material.dart';

const _pages = [HomePage(), BlankPage(), BlankPage(), BlankPage()];

class MainNavigationPage extends StatefulWidget {
  static const id = '/navigation';
  const MainNavigationPage({Key? key}) : super(key: key);

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: _pages,
      ),
      bottomNavigationBar: ReusableNavigationBar(
        index: _index,
        onTap: (index) => setState(() => _index = index),
      ),
    );
  }
}
