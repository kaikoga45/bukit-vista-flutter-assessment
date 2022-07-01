import 'package:flutter/material.dart';

class ReusableTab extends StatelessWidget {
  const ReusableTab({
    Key? key,
    required this.tabs,
    required this.view,
  }) : super(key: key);

  final List<Tab> tabs;
  final List<Widget> view;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.black26, width: 2)),
            ),
            child: TabBar(
              tabs: tabs,
            ),
          ),
          SizedBox(
            height: double.maxFinite,
            child: TabBarView(children: view),
          ),
        ],
      ),
    );
  }
}
