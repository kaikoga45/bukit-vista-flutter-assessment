import 'package:bukit_vista_flutter_assessment/presentation/widget/reusable_search_field.dart';
import 'package:flutter/material.dart';

import 'reusable_button_search_field.dart';

class ReusableHeader extends StatelessWidget implements PreferredSizeWidget {
  const ReusableHeader({
    Key? key,
    required this.title,
    this.displaySearchField = false,
    this.leading,
  }) : super(key: key);

  final String title;
  final bool displaySearchField;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: leading,
      title: Text(title),
      elevation: 0,
      bottom: displaySearchField
          ? PreferredSize(
              preferredSize: const Size.fromHeight(30),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ReusableSearchField(
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 0,
                      child: ReusableButtonSearchField(
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => displaySearchField
      ? const Size.fromHeight(140)
      : const Size.fromHeight(60);
}
