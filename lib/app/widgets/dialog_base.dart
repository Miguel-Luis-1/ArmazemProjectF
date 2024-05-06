import 'package:flutter/material.dart';

class DialogBase extends StatelessWidget {
  final Widget content;
  final String title;
  final List<Widget>? actions;
  const DialogBase({
    super.key,
    required this.title,
    required this.content,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: AlertDialog(  
        contentPadding: const EdgeInsets.all(18),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
        content: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              child: content,
            )),
        actions: actions,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const VerticalDivider(color: Colors.transparent, width: 8),
            Container(),
            Expanded(
              child: Text(title),
            ),
          ],
        ),
      ),
    );
  }
}
